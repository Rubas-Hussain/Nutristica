import 'package:flutter/material.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const InfoTile({super.key, required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.offWhiteColor,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: AppColors.greyColor.withOpacity(0.1),
          width: 1.5.w,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 48.r,
            width: 48.r,
            decoration: BoxDecoration(
              color: AppColors.lightYellowColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              icon,
              color: AppColors.blackColor,
              size: 24.r,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.r400grey12,
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: AppTextStyles.m500black16,
                ),
              ],
            ),
          ),
          // Icon(
          //   LucideIcons.chevronRight,
          //   color: AppColors.greyColor,
          //   size: 20.r,
          // ),
        ],
      ),
    );
  }
}
