import 'package:flutter/material.dart';
import 'package:nutritionist_app/controllers/home_controller.dart';
import 'package:nutritionist_app/utils/app_textstyles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import '../../../utils/app_colors.dart';

class LegendItem extends StatelessWidget {
  final String legendText;
  final ChartPoint point;
  final int seriesIndex;
  final HomeController controller;

  const LegendItem({
    super.key,
    required this.legendText,
    required this.point,
    required this.seriesIndex,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                legendText,
                style: AppTextStyles.m500white12.copyWith(fontSize: 14.sp),
              ),
              SizedBox(width: 10.w),
              Text(
                '${point.y?.toInt()}%',
                style: AppTextStyles.l300white12.copyWith(fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(height: 2.w),
          Stack(
            children: [
              Container(
                height: 8.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: (point.y ?? 0) / 100),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return Stack(
                    children: [
                      // Background bar
                      Container(
                        height: 8.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      // Animated foreground bar
                      Container(
                        height: 8.h,
                        width: value * 100.w,
                        // width grows smoothly
                        decoration: BoxDecoration(
                          color: controller.chartData[seriesIndex].color,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
