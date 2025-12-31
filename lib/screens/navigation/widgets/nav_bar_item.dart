import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';
import '../../../utils/assets.dart';

class NavBarItem extends StatelessWidget {
  final String? svgIconPath;
  final IconData? iconData;
  final String title;
  final bool isSelected;
  final VoidCallback onPress;

  const NavBarItem({
    super.key,
    this.svgIconPath,
    required this.title,
    required this.isSelected,
    this.iconData,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
        customBorder: CircleBorder(),
        // splashColor: Colors.blue,
        splashColor: AppColors.greyColor.withOpacity(0.1),
        highlightColor: AppColors.greyColor.withOpacity(0.1),
        child: Container(
          width: context.width*0.19,
          height: 70.h,
          decoration: BoxDecoration(
          // color: Colors.red,
          //   shape: BoxShape.circle
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (svgIconPath != null)
                SvgPicture.asset(
                  svgIconPath ?? '',
                  color: isSelected
                      ? AppColors.blackColor
                      : AppColors.yellow4Color,
                  height: 26.h,
                  width: 26.w,
                )
              else if (iconData != null)
                Icon(
                  iconData,
                  color: isSelected
                      ? AppColors.blackColor
                      : AppColors.yellow4Color,
                  size: 26.sp,
                ),
              Text(
                title,
                style: AppTextStyles.m500black14.copyWith(
                  fontSize: 12.sp,
                  color: isSelected
                      ? AppColors.blackColor
                      : AppColors.yellow4Color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
