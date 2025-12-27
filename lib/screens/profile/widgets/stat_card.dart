import 'package:flutter/material.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final Color color;
  const StatCard({super.key, required this.icon, required this.title, required this.value, required this.subtitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      // decoration: BoxDecoration(
      //     color: AppColors.black2Color,
      //     borderRadius: BorderRadius.circular(18.r),
      //     border: Border.all(color: AppColors.greyColor.withOpacity(0.9),width: 1.5.w)
      // ),
      decoration: BoxDecoration(
        color: AppColors.offWhiteColor,
        // color: AppColors.black2Color,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: AppColors.greyColor.withOpacity(0.1),
          width: 1.5.w,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40.r,
            width: 40.r,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20.r,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            style: AppTextStyles.r400grey12/*.copyWith(color: AppColors.offWhiteColor)*/,
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: AppTextStyles.m500black16.copyWith(
              fontSize: 18.sp,
              // color: AppColors.offWhiteColor
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            subtitle,
            style: AppTextStyles.r400grey10/*.copyWith(color: AppColors.offWhiteColor)*/,
          ),
        ],
      ),
    );
  }
}
