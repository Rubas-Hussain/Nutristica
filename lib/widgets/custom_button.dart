import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

import '../utils/app_colors.dart';
import '../utils/app_textstyles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback onPress;
  const CustomButton({super.key, required this.title, this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      // splashColor: AppColors.greyColor,
      // highlightColor: AppColors.greyColor,
      child: Container(
        height: 50.h,
        width: context.width,
        decoration: BoxDecoration(
          color: AppColors.yellow2Color,
          // border: Border.all(color: AppColors.yellow4Color.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child:icon!=null ?
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              title,
              style: AppTextStyles.m500black14.copyWith(
                fontSize: 16.sp,
              ),
            ),
            // Spacer(),
            SizedBox(width: 10.w,),
            Icon(icon,color: AppColors.blackColor,size: 25.r,),
            Spacer(),
          ],
        )
            :
        Center(
          child: Text(
            title,
            style: AppTextStyles.m500black14.copyWith(
              fontSize: 16.sp,
            ),
                ),
        ),
    ));
  }
}
