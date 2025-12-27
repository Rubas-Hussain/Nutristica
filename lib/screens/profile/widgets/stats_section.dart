import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/screens/profile/widgets/stat_card.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

import '../../../utils/app_colors.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                icon: LucideIcons.activity,
                title: 'BMI',
                value: '22.6',
                subtitle: 'Healthy',
                color: AppColors.darkGreenColor,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: StatCard(
                icon: LucideIcons.scale,
                title: 'Weight',
                value: '65 kg',
                subtitle: 'Current',
                color: AppColors.blueColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: StatCard(
                icon: LucideIcons.ruler,
                title: 'Height',
                value: '170 cm',
                subtitle: 'Current',
                color: AppColors.orangeColor,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: StatCard(
                icon: LucideIcons.cake,
                title: 'Age',
                value: '28',
                subtitle: 'Years',
                color: AppColors.lightBlueColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
