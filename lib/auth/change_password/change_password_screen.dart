import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/auth/login/login_screen.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_textstyles.dart';
import '../../utils/assets.dart';
import 'change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChangePasswordController controller=Get.put(ChangePasswordController());

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
                child: Text('Change Password',style: AppTextStyles.m500black24,),
              ),
              SizedBox(height: 10.h,),
              Text('Create a new password for your account.',style: AppTextStyles.r400grey12,),
              SizedBox(height: 16.h,),
              Text("New Password",
                style: AppTextStyles.m400black14.copyWith(fontSize: 16.sp),),
              SizedBox(height: 2.h,),
              Obx(()=>Container(
                height: 49.h,
                child: CustomTextField(
                  contentPadding: EdgeInsets.symmetric(vertical:15.h,horizontal: 15.w),
                  controller: controller.newPassController,
                  hintText: '********',
                  obscureText: controller.toggleNewPassIcon.value,
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 12.0.h),
                    child: InkWell(
                        onTap: () {
                          controller.toggleNewPass();
                        },
                        child:(controller.toggleNewPassIcon.value)
                            ? SvgPicture.asset(Assets.eyeCloseIcon)
                            : SvgPicture.asset(Assets.eyeOpenIcon),),
                  ),
                ),
              ),),
              SizedBox(height: 12.h,),
              Text("Confirm New Password",
                style: AppTextStyles.m400black14.copyWith(fontSize: 16.sp),),
              SizedBox(height: 2.h,),
              Obx(()=>Container(
                height: 49.h,
                child: CustomTextField(
                  contentPadding: EdgeInsets.symmetric(vertical:15.h,horizontal: 15.w),
                  controller: controller.confirmNewPassController,
                  hintText: '********',
                  obscureText: controller.toggleconfirmnNewPassIcon.value,
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 12.0.h),
                    child: InkWell(
                        onTap: () {
                          controller.toggleConfirmnNewPass();
                        },
                        child:(controller.toggleconfirmnNewPassIcon.value)
                            ? SvgPicture.asset(Assets.eyeCloseIcon)
                            : SvgPicture.asset(Assets.eyeOpenIcon),
                        ),
                  ),
                ),
              ),),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      onPress: (){
                        Get.offAll(LoginScreen());
                      },
                      title: 'Change Password',
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