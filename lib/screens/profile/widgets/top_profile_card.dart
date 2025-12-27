import 'package:flutter/material.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';

class TopProfileCard extends StatelessWidget {
  const TopProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Container(
            height: 80.r,
            width: 80.r,
            decoration: BoxDecoration(
              color: AppColors.lightYellowColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.offWhiteColor,
                width: 4.w,
              ),
            ),
            child: Center(
              child: Text(
                'JD',
                style: AppTextStyles.m500black24.copyWith(
                  color: AppColors.black2Color,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: AppTextStyles.m500black24.copyWith(
                  color: AppColors.black2Color,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'john.doe@example.com',
                style: AppTextStyles.r400grey12.copyWith(
                  fontSize: 14.sp,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
