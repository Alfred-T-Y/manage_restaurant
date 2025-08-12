import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/routes/app_pages.dart';

class AdminLoginPageController extends GetxController {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passWordFocus = FocusNode();
  var focussubmission = FocusNode();
  final formkey = GlobalKey<FormState>();
  final color = Color.fromARGB(255, 5, 93, 245);
  

  @override
  void onInit(){
    // Écouter les changements de focussubmission
    focussubmission.addListener(submission);
    super.onInit();
  }

  void submission(){
    if(focussubmission.hasFocus){
      login();
    }
  }

  //login method
  void login(){
    //authentification

    //home page
    if(formkey.currentState!.validate()){
      focussubmission.unfocus();
      Get.offAllNamed(Routes.adminHomePage);
    }
  }

}