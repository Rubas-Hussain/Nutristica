import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/controllers/progress_controller.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';

class BMICardWidget extends StatelessWidget {
  final ProgressController controller;
  const BMICardWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
  double bmiPosition() {
    final double minBmi = 15;
    final double maxBmi = 40;

    double normalized =
    ((22.6 - minBmi) / (maxBmi - minBmi)).clamp(0.0, 1.0);

    return normalized * context.width;
  }
    return Container(
      // height: 126.h,
      width: context.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
      decoration: BoxDecoration(
          color: AppColors.black2Color,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: AppColors.greyColor.withOpacity(0.9),width: 1.5.w)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Your BMI is ',style: AppTextStyles.m500white12.copyWith(fontSize: 20.sp),),
              Text('22.6',style: AppTextStyles.m500white12.copyWith(fontSize: 24.sp,fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 5.h,),
          Text('Weight: 65 Kg',style: AppTextStyles.r400white10.copyWith(fontSize: 16.sp),),
          SizedBox(height: 5.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Your weight is ',style: AppTextStyles.r400white10.copyWith(fontSize: 16.sp),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.h,vertical: 2.h),
                decoration: BoxDecoration(
                  color: Color(0xff218F24),
                  borderRadius: BorderRadius.circular(12.r)
                ),
                child: Center(child: Text('Healthy',style: AppTextStyles.r400white10.copyWith(fontSize: 14.sp),)),
              )
            ],
          ),
          SizedBox(height: 15.h,),

          // BMI Health Bar
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Gradient Bar
                  Container(
                    height: 8.h,
                    width: context.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.lightBlueColor,   // Underweight
                          AppColors.darkGreenColor,   // Healthy
                          AppColors.lightOrangeColor, // Overweight
                          AppColors.redColor,         // Obese
                        ],
                        stops: [0.0, 0.4, 0.7, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),

                  // BMI Indicator
                  Positioned(
                    left: bmiPosition(),
                    top: -6.h,
                    child: Container(
                      height: 20.h,
                      width: 2.w,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),


          // SizedBox(height: 10.h,),
          // BMI Health Keys
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(controller.bmiHealthBarConfigs.length, (i){
              return SizedBox(
                height: 20.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 9.h,
                      width: 9.w,
                      decoration: BoxDecoration(
                        color: controller.bmiHealthBarConfigs[i]['color'],
                        shape: BoxShape.circle
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    Text(controller.bmiHealthBarConfigs[i]['color_key'],
                      style: AppTextStyles.r400black14.copyWith(
                          color: AppColors.offWhiteColor,fontSize: 12.sp),)
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: 5.h,)
        ],
      ),
    );
  }
}
