import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  final newPassController=TextEditingController();
  final confirmNewPassController=TextEditingController();

  RxBool toggleNewPassIcon=true.obs;
  void toggleNewPass(){
    toggleNewPassIcon.value=!toggleNewPassIcon.value;
    update();
  }

  RxBool toggleconfirmnNewPassIcon=true.obs;
  void toggleConfirmnNewPass(){
    toggleconfirmnNewPassIcon.value=!toggleconfirmnNewPassIcon.value;
    update();
  }

}