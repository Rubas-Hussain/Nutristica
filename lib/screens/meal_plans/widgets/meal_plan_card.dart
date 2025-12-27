import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';

class MealPlanCard extends StatelessWidget {
  final String title;
  final String description;
  final int calories;
  final String duration;
  final String difficulty;
  final Color color;
  final VoidCallback onTap;

  const MealPlanCard({
    super.key,
    required this.title,
    required this.description,
    required this.calories,
    required this.duration,
    required this.difficulty,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50.r,
                  width: 50.r,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Icon(
                    LucideIcons.utensilsCrossed,
                    color: color,
                    size: 28.r,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.m500black24.copyWith(
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          '$calories kcal/day',
                          style: AppTextStyles.r400grey12.copyWith(
                            color: color,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  LucideIcons.chevronRight,
                  color: AppColors.greyColor,
                  size: 20.r,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              description,
              style: AppTextStyles.r400grey12.copyWith(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                _buildInfoChip(
                  LucideIcons.calendar,
                  duration,
                  AppColors.blueColor,
                ),
                SizedBox(width: 12.w),
                _buildInfoChip(
                  LucideIcons.trendingUp,
                  difficulty,
                  AppColors.orangeColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16.r,
            color: color,
          ),
          SizedBox(width: 6.w),
          Text(
            label,
            style: AppTextStyles.r400grey12.copyWith(
              color: color,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}

