import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';
import '../../../utils/assets.dart';

class NavigationHeaderWidget extends StatelessWidget {
  final String title;
  final bool? showBackIcon;
  const NavigationHeaderWidget({super.key, required this.title, this.showBackIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,

      child: Row(
        children: [
          if(showBackIcon==true)...[

          InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              height: 40.r,
              width: 40.r,
              decoration: BoxDecoration(
                color: AppColors.offWhiteColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                LucideIcons.arrowLeft,
                color: AppColors.blackColor,
                size: 20.r,
              ),
            ),
          ),
            SizedBox(width: 16.w),
          ],
          Text(
            title,
            style: AppTextStyles.m500black24.copyWith(
              color: AppColors.black2Color,
            ),
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
    );
  }
}
