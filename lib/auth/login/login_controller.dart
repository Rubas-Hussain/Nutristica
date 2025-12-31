import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  RxBool togglePassIcon = true.obs;

  void togglePass() {
    togglePassIcon.value = !togglePassIcon.value;
    update();
  }

  // RxBool toggleconfirmPassIcon = true.obs;
  //
  // void toggleconfirmPass() {
  //   toggleconfirmPassIcon.value = !toggleconfirmPassIcon.value;
  //   update();
  // }

  // fieldsValidation() {
  //   String? error
  //   if (passwordController.text.isEmpty) {
  //     error = "Please input password";
  //   } else if (passController.text != confirmPassController.text) {
  //     error = "Confirm password does not match"
  //   }
  //   return error
  // }

  // void signIn() {
  //   if (emailController.text == 'new') {
  //     Get.to(() => CreatePasswordView());
  //   } else if (emailController.text == "resident") {
  //     Get.offAll(() => ResidentsHomeView());
  //   } else if (emailController.text == "staff") {
  //     Get.offAll(() => StaffNavigationBar());
  //   } else if (emailController.text == "family") {
  //     Get.offAll(() => FamilyNavigationBar());
  //   }
  //
  //   //   var error = fieldsValidation();
  //   //   if (error != null) {
  //   //     Fluttertoast.showToast(msg: error);
  //   //     return;
  //   //   }
  //   //   final user =  await AuthServices.signIn(
  //   //     email: email,
  //   //     password: password
  //   //   )
  //   //   if user.role == "staff" {
  //   //     Get.to(StaffScreen())
  //   //   }
  //   // }
  // }
}