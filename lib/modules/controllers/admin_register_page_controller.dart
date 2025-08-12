import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/routes/app_pages.dart';

class AdminRegisterPageController extends GetxController{

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final nameRestaurantController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassWordController = TextEditingController();
  final emailFocus = FocusNode();
  final nameFocus = FocusNode();
  final nameRestaurantFocus = FocusNode();
  final passWordFocus = FocusNode();
  final confirmPassWordFocus = FocusNode();
  var focussubmission = FocusNode();
  final formkey = GlobalKey<FormState>();
  final String lottie = 'assets/admin.json';
  final color = Color.fromARGB(255, 5, 93, 245);

  void submission(){
    if(focussubmission.hasFocus){
      focussubmission.unfocus();
      signup();
    }
  }

    @override
  void onInit() {
    // Écouter les changements de focussubmission
    focussubmission.addListener(submission);
    super.onInit();
  }

  //signup method
  void signup(){
    //authentification

    //home page
    if(formkey.currentState!.validate()){
      Get.offAllNamed(Routes.adminHomePage);
    }
  }

}