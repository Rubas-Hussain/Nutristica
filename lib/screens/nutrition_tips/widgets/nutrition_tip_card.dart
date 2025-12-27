import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';

class NutritionTipCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final Color color;
  final VoidCallback onTap;

  const NutritionTipCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.offWhiteColor,
          borderRadius: BorderRadius.circular(20.r),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50.r,
              width: 50.r,
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Icon(
                LucideIcons.lightbulb,
                color: color,
                size: 28.r,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          category,
                          style: AppTextStyles.r400grey12.copyWith(
                            color: color,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    title,
                    style: AppTextStyles.m500black16.copyWith(
                      fontSize: 17.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    description,
                    style: AppTextStyles.r400grey12.copyWith(
                      fontSize: 14.sp,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              LucideIcons.chevronRight,
              color: AppColors.greyColor,
              size: 20.r,
            ),
          ],
        ),
      ),
    );
  }
}

