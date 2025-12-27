import 'dart:ui';

import 'package:get/get.dart';

import '../models/calorie_models/calorie_chart_data_model.dart';
import '../utils/app_colors.dart';

class HomeController extends GetxController{
  final List<CalorieChartData> chartData = [
    CalorieChartData('Carbs', 60, AppColors.darkGreenColor),
    CalorieChartData('Protein', 30, AppColors.blueColor),
    CalorieChartData('Fat', 10, AppColors.orangeColor),
  ];
  final CalorieChartData totalCalorieData = CalorieChartData('Calories', 60, AppColors.lightGreenColor);

}
