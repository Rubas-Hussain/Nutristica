import 'package:flutter/material.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import '../../../controllers/ai_chat_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/custom_text_field.dart';


class ChatTextField extends StatelessWidget {
  final AIChatController controller;
  const ChatTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w,vertical: 36.h),
      child: CustomTextField(
          controller: controller.chatController,
          hintText: 'Message...',
          borderRadius: BorderRadius.circular(44.r),
          contentPadding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 28.w),
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Container(
              //     height: 30.h,
              //     width: 30.h,
              //     margin: EdgeInsets.only(right: 8.w),
              //     decoration: const BoxDecoration(
              //       // color: AppColors.greenColor,
              //         shape: BoxShape.circle
              //     ),
              //     child: Center(child: Transform.rotate(
              //         angle: 0.7,
              //         child: Icon(Icons.attach_file,size: 18.sp,color: AppColors.blackColor,)))),
              // InkWell(
              //   onTap: (){
              //     controller.aiSpeakingHandler();
              //   },
              //   child: Container(
              //       height: 30.h,
              //       width: 30.h,
              //       margin: EdgeInsets.only(right: 17.w),
              //       decoration: BoxDecoration(
              //           // color: AppColors.blackColor,
              //           shape: BoxShape.circle
              //       ),
              //       child: Center(child: Icon(Icons.mic,size: 18.sp,color: AppColors.blackColor,))),
              // ),
              GestureDetector(
                onTap: (){
                  // controller.aiSpeakingHandler();
                  // controller.chatWithGemini();
                },
                child: Container(
                    height: 30.h,
                    width: 30.h,
                    margin: EdgeInsets.only(right: 17.w),
                    // padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      // color: AppColors.lightGreenColor,
                        shape: BoxShape.circle
                    ),
                    child: Icon(Icons.send,size: 22.sp,color: AppColors.blackColor,)),
              )
            ],
          ),
          // suffixIcon: GestureDetector(
          //   onTap: (){
          //     // controller.aiSpeakingHandler();
          //     // controller.chatWithGemini();
          //   },
          //   child: Container(
          //       height: 30.h,
          //       width: 30.h,
          //       margin: EdgeInsets.only(right: 17.w),
          //       padding: EdgeInsets.all(8.r),
          //       decoration: BoxDecoration(
          //         // color: AppColors.lightGreenColor,
          //           shape: BoxShape.circle
          //       ),
          //       child: Center(child: Icon(Icons.send,size: 22.sp,color: AppColors.blackColor,))),
          // )


      ),
    );
  }
}