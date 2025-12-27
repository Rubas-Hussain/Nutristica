import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

import '../utils/app_colors.dart';

class FoodLogFloatingActionButton extends StatelessWidget {
  final VoidCallback onPress;
  const FoodLogFloatingActionButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
      child: FloatingActionButton(
        onPressed: onPress,
        backgroundColor: AppColors.yellow2Color,
        shape: CircleBorder(),
        child: Icon(LucideIcons.plus,size: 28.r,color: AppColors.yellow4Color,),
        // child: Icon(LucideIcons.camera,size: 24.r,color: AppColors.yellow4Color,),
      ),
    );
  }
}
