
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nutritionist_app/auth/verify_code/verify_code_controller.dart';
import 'package:nutritionist_app/auth/verify_code/verify_code_controller.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_textstyles.dart';
import '../change_password/change_password_screen.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    VerifyCodeController controller=Get.put(VerifyCodeController());
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
                padding: EdgeInsets.only(top: 40.0.h),
                child: Text('Verify Code',style: AppTextStyles.m500black24,),
              ),
              SizedBox(height:10.h),
              RichText(
                  text: TextSpan(
                      style: AppTextStyles.l300grey12,
                      children: <TextSpan>[
                        const TextSpan(text: "Please enter the code we just sent to\n"),
                        TextSpan(
                            text: 'example@gmail.com',
                            style: AppTextStyles.m500black12)
                      ])),
              SizedBox(height: 16.h,),
              Pinput(
                controller: controller.otpController,
                length: 5,
                cursor: Padding(
                  padding:EdgeInsets.symmetric(vertical: 8.0.h),
                  child: VerticalDivider(
                    thickness: 1.w,
                    color: AppColors.greyColor,
                  ),
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                defaultPinTheme:PinTheme(
                    width: 52.6.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color:AppColors.blackColor,
                          width: 1,
                        )
                    )
                ),
                focusedPinTheme: PinTheme(
                    width: 52.6.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color:AppColors.yellow4Color,
                          width: 1,
                        )
                    )
                ),
                errorPinTheme: PinTheme(
                    width: 52.6.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.zero,
                        border: Border.all(
                          color:AppColors.blackColor,
                          width: 1,
                        )
                    )
                ),
              ),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text("Didn’t receive the OTP?",style: AppTextStyles.r400grey12,)),
                  SizedBox( width: 10.w,),
                  InkWell(
                    onTap: (){},
                    child: Text("resend code",style: AppTextStyles.m500black12,),
                  ),
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      onPress: (){
                        // Get.to(AccountManagementView());
                        Get.to(ChangePasswordScreen());
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
