import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/auth/forgot_password/forgot_password_screen.dart';
import 'package:nutritionist_app/auth/login/login_controller.dart';
import 'package:nutritionist_app/auth/login/login_controller.dart';
import 'package:nutritionist_app/screens/navigation/navigation.dart';
import 'package:nutritionist_app/utils/assets.dart';
import 'package:nutritionist_app/utils/assets.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';
import 'package:nutritionist_app/widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_textstyles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.put(LoginController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1Color,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 114.h,
                  ),
                  Image.asset(
                    'assets/logo/wise.png',
                    width: 61.w,
                    height: 55.h,
                  ),
                  // SvgPicture.asset('assets/images/Icons.svg',width:61.w,height:55.h),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Sign In',
                    style: AppTextStyles.m500black24,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Hi Welcome back, you’ve been missed',
                    style: AppTextStyles.r400grey12,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(right: 20.w, top: 5.h),
                    child: Text(
                      "Email",
                      style: AppTextStyles.m400black14.copyWith(fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 49.h,
                    child: CustomTextField(
                      hintText: 'example@gmail.com',
                      type: TextInputType.emailAddress,
                      controller: controller.emailController,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(right: 20.w, top: 5.h),
                    child: Text(
                      "Password",
                      style: AppTextStyles.m400black14.copyWith(fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Obx(()=>Container(
                    height: 49.h,
                    child: CustomTextField(
                      hintText: '********',
                      controller: controller.passController,
                      obscureText: controller.togglePassIcon.value,
                      contentPadding: EdgeInsets.symmetric(vertical:15.h,horizontal: 15.w),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 12.0.h),
                        child: InkWell(
                            onTap: () {
                              controller.togglePass();
                            },
                            child: (controller.togglePassIcon.value)
                                ? SvgPicture.asset(Assets.eyeCloseIcon)
                                  : SvgPicture.asset(Assets.eyeOpenIcon),
                            ),
                      ),
                    ),
                  ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                          Get.to(ForgotPasswordScreen());
                        },
                      child: Container(
                        decoration: BoxDecoration(
                        // color: Colors.red,
                          borderRadius: BorderRadius.circular(12.r)
                        ),
                          padding: EdgeInsets.only(top: 5.h,bottom: 15.h,left: 20.w),
                          child: Text(
                            "forgot password?",
                            style: AppTextStyles.m500black10.copyWith(
                              fontFamily: 'POP-R',
                              fontSize: 11.sp
                            ),
                          ),
                        ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomButton(
                            onPress: () {
                              // controller.signIn();
                              Get.offAll(Navigation());
                            },
                            title: 'Sign In',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}