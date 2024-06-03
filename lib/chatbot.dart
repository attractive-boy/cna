import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'database.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );
  final _chatGptUser = const types.User(id: 'chatgpt');

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
      types.TextMessage message,
      types.PreviewData previewData,
      ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);

    await _sendMessageToChatGPT(message.text);
  }

  Future<String?> getAccessToken() async {
    final url = Uri.parse("https://aip.baidubce.com/oauth/2.0/token");
    final response = await http.post(url, body: {
      "grant_type": "client_credentials",
      "client_id": 'gNODxFhWCpsgVqihB3f957e2',
      "client_secret": 'qdCXTmOv0OGDEtz9atzWwkKGvIPAQXkw',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return responseData["access_token"];
    } else {
      print("Failed to get access token: ${response.statusCode}");
      return null;
    }
  }

  Future<void> sendRequest(String accessToken, List<Map<String, String>> messages) async {
    final url = Uri.parse(
        "https://aip.baidubce.com/rpc/2.0/ai_custom/v1/wenxinworkshop/chat/completions?access_token=$accessToken");

    final payload = jsonEncode({
      "messages": messages,
      "temperature": 0.95,
      "top_p": 0.8,
      "penalty_score": 1,
      "disable_search": false,
      "enable_citation": false,
      "response_format": "text",
      "system": "use english answer me",
    });

    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(url, headers: headers, body: payload);

    if (response.statusCode == 200) {
      print("Response: ${response.body}");
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String reply = data['result']; // Adjust based on actual response structure

      final chatGptMessage = types.TextMessage(
        author: _chatGptUser,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: reply,
      );

      _addMessage(chatGptMessage);
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  }

  Future<void> _sendMessageToChatGPT(String text) async {
    final accessToken = await getAccessToken();
    if (accessToken != null) {
      final messages = _messages.reversed.map((message) {
        return {
          "role": message.author.id == _user.id ? "user" : "assistant",
          "content": (message as types.TextMessage).text,
        };
      }).toList();

      await sendRequest(accessToken, messages);
    } else {
      print("Failed to obtain access token.");
    }
  }



  void _loadMessages() async {

  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Chat(
      messages: _messages,
      onAttachmentPressed: _handleAttachmentPressed,
      onMessageTap: _handleMessageTap,
      onPreviewDataFetched: _handlePreviewDataFetched,
      onSendPressed: _handleSendPressed,
      showUserAvatars: true,
      showUserNames: true,
      user: _user,
    ),
  );
}