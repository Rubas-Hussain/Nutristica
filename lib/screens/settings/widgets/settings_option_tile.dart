import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';

class SettingsOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool showTrailing;

  const SettingsOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.showTrailing = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.r),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
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
                border: Border.all(
                  color: AppColors.blackColor.withOpacity(0.2),
                  width: 1.5.w,
                ),
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
                    style: AppTextStyles.m500black16,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: AppTextStyles.r400grey12,
                  ),
                ],
              ),
            ),
            if (showTrailing)
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

