// goal_progress_widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../controllers/progress_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';
import '../../../widgets/multi_segment_slider.dart';
import '../../../utils/responsive_util.dart';

class GoalProgressWidget extends StatelessWidget {
  final ProgressController controller;

  const GoalProgressWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Obx(
              () => MultiSegmentSlider<int>(
            initialValue: controller.selectedGoalProgressIndex.value,
            decoration: BoxDecoration(
              color: AppColors.greyColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            thumbDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
              ],
            ),
            selectedTextColor: AppColors.black2Color,
            unselectedTextColor: AppColors.greyColor,
            children: {
              0: Text('30 days',
                  style: AppTextStyles.r400black14.copyWith(
                      color: controller.selectedGoalProgressIndex.value == 0
                          ? null
                          : AppColors.greyColor,
                      fontWeight: controller.selectedGoalProgressIndex.value == 0
                          ? FontWeight.w700
                          : null)),
              1: Text('90 days',
                  style: AppTextStyles.r400black14.copyWith(
                      color: controller.selectedGoalProgressIndex.value == 1
                          ? null
                          : AppColors.greyColor,
                      fontWeight: controller.selectedGoalProgressIndex.value == 1
                          ? FontWeight.w700
                          : null)),
              2: Text('6 months',
                  style: AppTextStyles.r400black14.copyWith(
                      color: controller.selectedGoalProgressIndex.value == 2
                          ? null
                          : AppColors.greyColor,
                      fontWeight: controller.selectedGoalProgressIndex.value == 2
                          ? FontWeight.w700
                          : null)),
              3: Text('1 year',
                  style: AppTextStyles.r400black14.copyWith(
                      color: controller.selectedGoalProgressIndex.value == 3
                          ? null
                          : AppColors.greyColor,
                      fontWeight: controller.selectedGoalProgressIndex.value == 3
                          ? FontWeight.w700
                          : null)),
            },
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInToLinear,
            onValueChanged: (v) {
              controller.selectedGoalProgressIndex.value = v;
            },
          ),
        ),
      ),
      SizedBox(height: 10.h),
      Padding(
        padding: EdgeInsets.only(right: 15.0.w),
        child: Obx(
              () => SizedBox(
            height: 220.h,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: NumericAxis(
                minimum: controller.minX,
                maximum: controller.maxX.value,
                interval: controller.selectedGoalProgressIndex.value >= 2
                    ? 30
                    : 7, // approximate interval
                majorGridLines: const MajorGridLines(width: 0),
                axisLabelFormatter: (AxisLabelRenderDetails args) {
                  if (controller.selectedGoalProgressIndex.value >= 2) {
                    // Show month names
                    return ChartAxisLabel(
                        controller.getMonthLabel(args.value.toInt()),
                        TextStyle(
                            color: AppColors.blackColor, fontSize: 12.sp));
                  }
                  return ChartAxisLabel(
                      args.value.toInt().toString(),
                      TextStyle(
                          color: AppColors.blackColor, fontSize: 12.sp));
                },
                title: controller.selectedGoalProgressIndex.value >= 2
                    ? AxisTitle(
                    text: 'Months',
                    textStyle:
                    AppTextStyles.r400black14.copyWith(fontSize: 12.sp))
                    : AxisTitle(
                    text: 'Days',
                    textStyle:
                    AppTextStyles.r400black14.copyWith(fontSize: 12.sp)),
              ),
              primaryYAxis: NumericAxis(
                minimum: controller.minY,
                maximum: controller.maxY,
                interval: 1,
                title: AxisTitle(
                    text: 'Weight (kg)',
                    textStyle:
                    AppTextStyles.r400black14.copyWith(fontSize: 12.sp)),
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
              ),
              series: <CartesianSeries>[
                SplineSeries<WeightData, int>(
                  dataSource: ProgressController.weightData,
                  xValueMapper: (data, _) => data.day,
                  yValueMapper: (data, _) => data.weight,
                  width: 2.5.w,
                  color: AppColors.darkGreenColor,
                  markerSettings: MarkerSettings(
                      isVisible: true,
                      shape: DataMarkerType.circle,
                      height: 5.h,
                      width: 5.w),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
