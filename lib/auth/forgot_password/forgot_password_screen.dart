import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/auth/verify_code/verify_code_screen.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_textstyles.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController findYourAccountController=Get.put(ForgotPasswordController());
    return Scaffold(
      backgroundColor: AppColors.white1Color,
      appBar: AppBar(
        backgroundColor: AppColors.white1Color,
        titleSpacing:-8.0.w,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: (){
            Get.back();
          },
          child: Container(
            padding: EdgeInsetsGeometry.only(left: 24.w,top: 20.h,bottom: 20.h,right: 10.w),
            decoration: BoxDecoration(
            // color: Colors.red,
              borderRadius: BorderRadius.circular(44.r)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back,size: 16.r,),
                SizedBox(width: 8.w,),
                Text('back',style:AppTextStyles.r400black14),
              ],
            ),
          ),
        ),
        // leading: InkWell(
        //     onTap: (){
        //       Get.back();
        //     },
        //     child: Container(
        //         color:Colors.red,child: Icon(Icons.arrow_back,size: 16.r,))),
        // title: Container(
        //     color: Colors.red,
        //     child: Text('back',style:AppTextStyles.r400black14)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 42.0.h),
                child: Text('Find Your Account',style: AppTextStyles.m500black24,),
              ),
              SizedBox(height: 8.h,),
              Text('Enter you email address to receive a verification code.',style: AppTextStyles.r400grey12,),
              SizedBox(height: 16.h,),
              Text("Email",
                style: AppTextStyles.m400black14.copyWith(
                  fontSize: 16.sp
                ),),
              SizedBox(height: 2.h,),
              Container(
                height: 49.h,
                child: CustomTextField(
                  hintText: 'example@gmail.com',
                  type: TextInputType.emailAddress,
                  controller: findYourAccountController.emailController,
                ),
              ),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      onPress: (){
                        Get.to(VerifyCodeScreen());
                      },
                      title: 'Continue',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}