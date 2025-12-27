import 'package:flutter/material.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

import '../../../utils/app_textstyles.dart';

class ChatBubbleContainer extends StatelessWidget {
  final Color color;
  final String text;
  final Radius? bottomLeft;
  final Radius? bottomRight;
  const ChatBubbleContainer({super.key, required this.color, required this.text, this.bottomLeft, this.bottomRight});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 37.h,
      // width: 279.w,
      constraints: BoxConstraints(
          maxWidth: 279.w,
          minWidth: 20.w
      ),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r).copyWith(bottomLeft: bottomLeft,bottomRight: bottomRight)
      ),
      padding: EdgeInsets.symmetric(vertical: 9.5.h,horizontal: 20.w),
      margin: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
      child: Text(text,style: AppTextStyles.m500black14,),
    );
  }
}