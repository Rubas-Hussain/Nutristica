import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';

class BMIResultCard extends StatelessWidget {
  final double bmi;
  final String category;
  final Color color;
  final double weight;
  final double height;

  const BMIResultCard({
    super.key,
    required this.bmi,
    required this.category,
    required this.color,
    required this.weight,
    required this.height,
  });

  double _calculateBMIPosition(BuildContext context) {
    final double minBmi = 15;
    final double maxBmi = 40;
    final double normalized = ((bmi - minBmi) / (maxBmi - minBmi)).clamp(0.0, 1.0);
    return normalized * (context.width - 48.w);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.black2Color,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: AppColors.greyColor.withOpacity(0.9),
          width: 1.5.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Your BMI is ',
                style: AppTextStyles.m500white12.copyWith(fontSize: 20.sp),
              ),
              Text(
                bmi.toStringAsFixed(1),
                style: AppTextStyles.m500white12.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Weight: $weight kg, Height: $height cm',
            style: AppTextStyles.r400white10.copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Your weight is ',
                style: AppTextStyles.r400white10.copyWith(fontSize: 16.sp),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  category,
                  style: AppTextStyles.r400white10.copyWith(fontSize: 14.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          // BMI Health Bar
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Gradient Bar
                Container(
                  height: 8.h,
                  width: context.width - 48.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.lightBlueColor, // Underweight
                        AppColors.darkGreenColor, // Healthy
                        AppColors.lightOrangeColor, // Overweight
                        AppColors.redColor, // Obese
                      ],
                      stops: const [0.0, 0.4, 0.7, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                // BMI Indicator
                Positioned(
                  left: _calculateBMIPosition(context),
                  top: -6.h,
                  child: Container(
                    height: 20.h,
                    width: 2.w,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          // BMI Health Keys
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBMILabel('Underweight', AppColors.lightBlueColor),
              _buildBMILabel('Healthy', AppColors.darkGreenColor),
              _buildBMILabel('Overweight', AppColors.lightOrangeColor),
              _buildBMILabel('Obese', AppColors.redColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBMILabel(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 9.h,
          width: 9.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          label,
          style: AppTextStyles.r400black14.copyWith(
            color: AppColors.offWhiteColor,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}

