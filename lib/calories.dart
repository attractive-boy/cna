import 'database.dart';

class MacroCalculator {
  static CaloriesCompanion calculateMacros(
      double age,
      double weight,
      double height,
      String gender,
      String goal,
      double bodyfat,
      double activityLevel,
      String presetDiet) {
    // 基础代谢率（BMR）的计算
    double bmr = (10 * weight / 2.2046 + 6.25 * height - 5 * age +
        (gender == "M" ? 5 : gender == "F" ? -161 : 0));

    // 总热量消耗（TDEE）的计算
    double tdee = bmr * activityLevel;

    double minCarbs = 0.0;
    double minFats = 0.0;
    double minProteins = 0.0;
    bool cappedMinCalories = false;

    // 计算宏观营养素的初始值
    switch (presetDiet.toLowerCase()) {
      case "atkins / ketogenic":
        minCarbs = 0;
        minFats = 0.8 * weight;
        minProteins = 0.3 * weight;
        break;
      case "paleo":
        minCarbs = 0.3 * weight;
        minFats = 0.4 * weight;
        minProteins = 0.3 * weight;
        break;
      case "mediterranean":
        minCarbs = 0.4 * weight;
        minFats = 0.3 * weight;
        minProteins = 0.3 * weight;
        break;
      case "zone":
        minCarbs = 0.4 * weight;
        minFats = 0.3 * weight;
        minProteins = 0.3 * weight;
        break;
      case "vegetarian":
        minCarbs = 0.5 * weight;
        minFats = 0.2 * weight;
        minProteins = 0.3 * weight;
        break;
      case "vegan":
        minCarbs = 0.6 * weight;
        minFats = 0.2 * weight;
        minProteins = 0.2 * weight;
        break;
      default:
      // 设置默认值
        minCarbs = 0.45 * weight;
        minFats = 0.25 * weight;
        minProteins = 0.3 * weight;
        break;
    }

    // 计算宏观营养素的热量
    double minCarbsCalories = 4 * minCarbs;
    double minFatsCalories = 9 * minFats;
    double minProteinsCalories = 4 * minProteins;
    double minCalories = minCarbsCalories + minFatsCalories + minProteinsCalories;

    // 如果计算出的最小热量超过TDEE的一定比例，则进行调整
    if (minCalories > tdee * 0.8) {
      cappedMinCalories = true;
      double scalingFactor = tdee * 0.8 / minCalories;
      minCarbs *= scalingFactor;
      minFats *= scalingFactor;
      minProteins *= scalingFactor;
    }

    double calories = tdee;
    double maxCarbs = (0.5 * calories / 4).ceil().toDouble();
    double maxFats = (0.35 * calories / 9).ceil().toDouble();
    double maxProteins = (0.3 * calories / 4).ceil().toDouble();

    // 返回 CaloriesCompanion 对象
    return CaloriesCompanion.insert(
      calories: calories,
      minCarbs: minCarbs,
      minFats: minFats,
      minProteins: minProteins,
      maxCarbs: maxCarbs,
      maxFats: maxFats,
      maxProteins: maxProteins,
      cappedMinCalories: cappedMinCalories,
    );
  }
}
