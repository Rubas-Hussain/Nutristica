import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/utils/app_colors.dart';

class DecoratedBackgroundContainer extends StatelessWidget {
  final Widget? child;
  const DecoratedBackgroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      decoration: BoxDecoration(
        // color: Color(0xfff78f5d),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,

          colors: [
            // Color(0xfff78f5d).withOpacity(0.2),
            // Color(0xffdbf547),
            AppColors.yellow2Color.withOpacity(1),
            // AppColors.yellow2Color.withOpacity(0.2),
            AppColors.yellow3Color,
            // Color(0xfffdeee8),


            AppColors.offWhiteColor,
            AppColors.offWhiteColor,
            AppColors.offWhiteColor,
            AppColors.offWhiteColor,
          ],
        ),
      ),
      child: child,
    );
  }
}
