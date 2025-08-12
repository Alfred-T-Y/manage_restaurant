import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/routes/app_pages.dart';

class WorkerLoginPageController extends GetxController{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passWordFocus = FocusNode();
  final focussubmission = FocusNode();
  final formkey = GlobalKey<FormState>();
  final lottie = 'assets/worker_login.json';
  final color = Color.fromARGB(255, 2, 122, 64); 

  void submission(){
    if(focussubmission.hasFocus){
      login();
    }
  }

    @override
  void onInit() {
    // Écouter les changements de focussubmission
    focussubmission.addListener(submission);
    super.onInit();
  }

  //login method
  void login(){
    //authentification

    //home page
    if(formkey.currentState!.validate()){
      focussubmission.unfocus();
      Get.offAllNamed(Routes.workerHomePage);
    }
  }

}