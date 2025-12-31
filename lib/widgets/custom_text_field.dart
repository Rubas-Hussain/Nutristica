import 'package:flutter/material.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import '../utils/app_colors.dart';
import '../utils/app_textstyles.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? type;
  final bool? obscureText;
  final bool? expands;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final bool? enabled;
  final bool? filled;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;

  const CustomTextField(
      {super.key,
        required this.controller,
        required this.hintText,
        this.type,
        this.obscureText,
        this.suffixIcon, this.contentPadding, this.expands, this.maxLines, this.prefixIcon, this.borderRadius, this.enabled, this.filled, this.enabledBorder, this.focusedBorder, this.fillColor});

  @override
  Widget build(BuildContext context) {
    return TextField(

      enabled: enabled ?? true,
      // clipBehavior: Clip.hardEdge,
      textAlign: TextAlign.left,
      expands: expands ?? false,
      controller: controller,
      cursorColor: AppColors.black2Color,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: AppTextStyles.m500black14,
      keyboardType: type,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          isDense: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding:contentPadding ?? EdgeInsets.symmetric(vertical:18.h,horizontal: 15.w),
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: AppTextStyles.r400black14.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 12.sp,
              color: AppColors.blackColor.withOpacity(0.7)),
          fillColor: Color(0xfff2f2f2),
          // fillColor:fillColor ?? Color(0xFFEAEAde).withOpacity(0.7),
          filled:filled ?? true,
          enabledBorder:enabledBorder ?? OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius:borderRadius ?? BorderRadius.circular(12.r)),
          focusedBorder:focusedBorder ?? OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius:borderRadius ?? BorderRadius.all(Radius.circular(12.r))),

          enabled: true),
      mouseCursor: WidgetStateMouseCursor.clickable,
    );
  }
}