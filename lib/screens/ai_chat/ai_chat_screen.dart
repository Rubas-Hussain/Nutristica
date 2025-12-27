import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/controllers/ai_chat_controller.dart';
import 'package:nutritionist_app/screens/ai_chat/widgets/chat_bubble_container.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../models/ai_models/ai_chat_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_textstyles.dart';
import 'widgets/chat_text_field.dart';

class AIChatScreen extends StatelessWidget {
  const AIChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AIChatController controller=Get.put(AIChatController());
    return Scaffold(
        backgroundColor: AppColors.offWhiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.yellow2Color,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: AppColors.blackColor),
          centerTitle: true,
          title: Text(
            'Chat with Zemo',
            style: AppTextStyles.m500black24.copyWith(fontSize: 20.sp),
          ),
        ),
        body:
        GetBuilder<AIChatController>(
            builder: (_){
              if(controller.chats.isEmpty){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: AppColors.yellow2Color,
                      size: 24.sp,
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Center(
                        child: Text(
                          "Start with Zemo",
                          style: AppTextStyles.m500black24
                        )),
                  ],
                );
              }else if(controller.chats.isNotEmpty){
                return ListView.builder(
                    itemCount: controller.chats.length,
                    // itemCount: 10,
                    reverse: true,
                    itemBuilder: (context,index){
                      List<AIChatModel> chat=controller.chats.reversed.toList();

                      if(controller.isLoading.value == true &&
                          index == chat.indexOf(chat.first) &&
                          chat[index].sentByMe == false){

                        return Align(
                          alignment:(chat[index].sentByMe ?? false) ?
                          Alignment.centerLeft:
                          Alignment.centerRight,
                          child: Obx(()=>Skeletonizer(
                            enabled:controller.isLoading.value,
                            child: ChatBubbleContainer(
                              color:(chat[index].sentByMe  == false) ?
                              Color(0xFFEAEAde).withOpacity(0.8)
                                  :
                              AppColors.greyColor.withOpacity(0.7),
                              // text: 'Hi, How can I help You? $index',
                              text: chat[index].text ?? '',
                              bottomLeft:(chat[index].sentByMe ?? false) ? Radius.zero : null,
                              bottomRight:(chat[index].sentByMe ?? false) ? null : Radius.zero,
                            ),
                          )),
                        );
                      }else {
                        return Align(
                          alignment:(chat[index].sentByMe == false) ?
                          Alignment.centerLeft:
                          Alignment.centerRight,
                          child: ChatBubbleContainer(
                            color:(chat[index].sentByMe==false) ?
                            AppColors.yellow2Color.withOpacity(1)
                                :
                            // Color(0xFFf2f2f2).withOpacity(0.8),
                            Color(0xFFEAEAde).withOpacity(0.8),
                            // AppColors.greyColor.withOpacity(0.7),
                            // text: 'Hi, How can I help You? $index',
                            text: chat[index].text ?? '',
                            bottomLeft:(chat[index].sentByMe == false) ? Radius.zero : null,
                            bottomRight:(chat[index].sentByMe == false) ? null : Radius.zero,
                          ),
                        );
                      }
                    });
              }else{
                return SizedBox();
              }
            }),
      bottomNavigationBar: AnimatedPadding(
        duration: const Duration(milliseconds: 0),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ChatTextField(controller: controller),
      ),

    );

  }
}