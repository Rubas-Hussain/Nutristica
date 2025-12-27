// import 'package:get/get.dart';
//
// import '../utils/app_colors.dart';
//
// class ProgressController extends GetxController{
//   List <Map<String,dynamic>> bmiHealthBarConfigs= [
//     {
//       'color': AppColors.lightBlueColor,
//       'color_key':'Underweight'
//     },
//     {
//       'color': AppColors.darkGreenColor,
//       'color_key':'Healthy'
//     },
//     {
//       'color': AppColors.lightOrangeColor,
//       'color_key':'Overweight'
//     },
//     {
//       'color': AppColors.redColor,
//       'color_key':'Obese'
//     },
//
//   ];
//
//   RxInt selectedGoalProgressIndex = 0.obs;
//
//   final double goalWeight = 60;
//
//   static List<WeightData> get  weightData => [
//     WeightData(1, 61.2),
//     WeightData(7, 60.8),
//     WeightData(14, 60.5),
//     WeightData(21, 59.1),
//     WeightData(28, 59.9),
//     WeightData(35, 59.6),
//     WeightData(42, 59.3),
//   ];
//   double minY = weightData.map((e) => e.weight).reduce((a, b) => a < b ? a : b) - 2;
//   double maxY = weightData.map((e) => e.weight).reduce((a, b) => a > b ? a : b) + 2;
//
//   double minX=1;
//   RxDouble get maxX => getMaxXForGoalProgressChart().obs;
//   double getMaxXForGoalProgressChart(){
//     switch (selectedGoalProgressIndex.value){
//       case 0:
//         return 30.0;
//       case 1:
//         return 90.0;
//       case 2:
//         return 180.0;
//       case 3:
//         return 365.0;
//       // case 3:
//       //   if(weightData.isNotEmpty){
//       //     return weightData.last.day.toDouble();
//       //   }
//       default:
//         return 30.0;
//     }
//   }
// }
//
// class WeightData {
//   final int day;
//   final double weight;
//
//   WeightData(this.day, this.weight);
// }
//
//
//

// progress_controller.dart
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class ProgressController extends GetxController {
  RxInt selectedGoalProgressIndex = 0.obs;
  final double goalWeight = 60;

  List <Map<String,dynamic>> bmiHealthBarConfigs= [
    {
      'color': AppColors.lightBlueColor,
      'color_key':'Underweight'
    },
    {
      'color': AppColors.darkGreenColor,
      'color_key':'Healthy'
    },
    {
      'color': AppColors.lightOrangeColor,
      'color_key':'Overweight'
    },
    {
      'color': AppColors.redColor,
      'color_key':'Obese'
    },

  ];


  static List<WeightData> get weightData => [
    WeightData(1, 61.2),
    WeightData(7, 60.8),
    WeightData(14, 60.5),
    WeightData(21, 59.1),
    WeightData(28, 59.9),
    WeightData(35, 59.6),
    WeightData(42, 59.3),
  ];

  double minY =
      weightData.map((e) => e.weight).reduce((a, b) => a < b ? a : b) - 2;
  double maxY =
      weightData.map((e) => e.weight).reduce((a, b) => a > b ? a : b) + 2;

  double minX = 1;

  RxDouble get maxX => getMaxXForGoalProgressChart().obs;

  double getMaxXForGoalProgressChart() {
    switch (selectedGoalProgressIndex.value) {
      case 0:
        return 30.0;
      case 1:
        return 90.0;
      case 2:
        return 180.0; // 6 months
      case 3:
        return 365.0; // 1 year
      default:
        return 30.0;
    }
  }

  // Month labels
  final List<String> monthLabels = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  // Convert day to month name (approx)
  String getMonthLabel(int day) {
    int monthIndex = ((day - 1) / 30).floor();
    if (monthIndex < 0) monthIndex = 0;
    if (monthIndex > 11) monthIndex = 11;
    return monthLabels[monthIndex];
  }
}


class WeightData {
  final int day;
  final double weight;

  WeightData(this.day, this.weight);
}
