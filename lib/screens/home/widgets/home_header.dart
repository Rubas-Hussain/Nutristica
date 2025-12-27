import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';
import '../../../utils/assets.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: AppTextStyles.l300grey12.copyWith(
                    color: AppColors.black2Color,
                  ),
                ),
                // SizedBox(height: 5.h,),
                Text(
                  'Stefani Wong',
                  style: AppTextStyles.m500black24.copyWith(
                    color: AppColors.black2Color,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              height: 40.h,
              width:  40.w,
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                  color: AppColors.offWhiteColor,
                  borderRadius: BorderRadius.circular(12.r)
              ),
              child: SvgPicture.asset(Assets.notificationIcon),
            )
          ],
        ),
      ),
    );
  }
}
