import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/screens/ai_chat/ai_chat_screen.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/custom_button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';

class AIIntroCard extends StatelessWidget {
  const AIIntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.h),
      // decoration: BoxDecoration(
      //     color: AppColors.black2Color,
      //     borderRadius: BorderRadius.circular(18.r),
      //     border: Border.all(color: AppColors.greyColor.withOpacity(0.9),width: 1.5.w)
      // ),
      decoration: BoxDecoration(
        color: Color(0xFFEAEAde).withOpacity(0.7),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Hello Stephany!',
          //   style: AppTextStyles.m500white12.copyWith(
          //     fontSize: 20.sp,
          //     color: AppColors.black2Color,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          SizedBox(
              height: 30.h, // height to avoid layout jump
              child: DefaultTextStyle(
                style: AppTextStyles.m500white12.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.black2Color,
                  fontWeight: FontWeight.w500,
                ),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText('Hello Stephany!', speed: Duration(milliseconds: 80)),
                  ],
                ),
              )),
          // SizedBox(height: 5.h),
          Text(
            'I am your AI Nutritionist',
            style: AppTextStyles.m500white12.copyWith(
              fontSize: 20.sp,
              color: AppColors.black2Color,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 10.h),
          Text(
            'I can help you track your nutrition, suggest personalized meal plans, '
                'monitor your calorie intake, and answer any health-related questions.',
            style: AppTextStyles.r400white10.copyWith(
                fontSize: 14.sp,
                color: AppColors.blackColor
            ),
          ),
          SizedBox(height: 20.h),
          CustomButton(
            title: 'Start Chat',
            icon: Icons.arrow_forward,
            onPress: (){
              Get.to(AIChatScreen());
            },
          )
        ],
      ),
    );
  }
}
