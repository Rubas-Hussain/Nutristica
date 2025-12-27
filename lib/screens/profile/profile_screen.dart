import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/screens/profile/widgets/info_section.dart';
import 'package:nutritionist_app/screens/profile/widgets/stats_section.dart';
import 'package:nutritionist_app/screens/profile/widgets/top_profile_card.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/navigation_header_widget.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_textstyles.dart';
import '../../widgets/decorated_background_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowColor,
      body: DecoratedBackgroundContainer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavigationHeaderWidget(title: 'Profile',showBackIcon: true,),

                  SizedBox(height: 30.h),

                  TopProfileCard(),

                  SizedBox(height: 30.h),
                  Text(
                    'Health Stats',
                    style: AppTextStyles.m500black24.copyWith(
                      color: AppColors.black2Color,
                      fontSize: 20.sp,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  StatsSection(),

                  SizedBox(height: 30.h),

                  Text(
                    'Personal Information',
                    style: AppTextStyles.m500black24.copyWith(
                      color: AppColors.black2Color,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  InfoSection(),

                  SizedBox(height: 20.h),

                  _buildHealthGoalsSection(context),

                  SizedBox(height: 30.h),

                  _buildEditButton(context),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildHealthGoalsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Health Goals',
          style: AppTextStyles.m500black24.copyWith(
            color: AppColors.black2Color,
            fontSize: 20.sp,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.offWhiteColor,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(
              color: AppColors.greyColor.withOpacity(0.1),
              width: 1.5.w,
            ),
          ),
          child: Column(
            children: [
              _buildGoalItem(
                context,
                title: 'Daily Calorie Goal',
                value: '2,000 kcal',
                progress: 0.75,
                color: AppColors.lightGreenColor,
              ),
              SizedBox(height: 16.h),
              // _buildGoalItem(
              //   context,
              //   title: 'Water Intake Goal',
              //   value: '8 glasses',
              //   progress: 0.60,
              //   color: AppColors.lightBlueColor,
              // ),
              // SizedBox(height: 16.h),
              _buildGoalItem(
                context,
                title: 'Weight Goal',
                value: '60 kg',
                progress: 0.85,
                color: AppColors.orangeColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGoalItem(
    BuildContext context, {
    required String title,
    required String value,
    required double progress,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.m500black14,
            ),
            Text(
              value,
              style: AppTextStyles.r400grey12,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8.h,
            backgroundColor: AppColors.lightGreyColor,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to edit profile screen
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black2Color,
          foregroundColor: AppColors.offWhiteColor,
          padding: EdgeInsets.symmetric(vertical: 18.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LucideIcons.edit,
              size: 20.r,
            ),
            SizedBox(width: 8.w),
            Text(
              'Edit Profile',
              style: AppTextStyles.m500white12.copyWith(
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

