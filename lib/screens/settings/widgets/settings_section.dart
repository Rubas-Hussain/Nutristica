import 'package:flutter/material.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.m500black24.copyWith(
            color: AppColors.black2Color,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 16.h),
        ...children,
      ],
    );
  }
}

