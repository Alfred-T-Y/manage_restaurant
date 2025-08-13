import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/routes/app_pages.dart';

class AdminLoginPageController extends GetxController {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passWordFocus = FocusNode();
  var focussubmission = FocusNode();
  final formkey = GlobalKey<FormState>();
  final String lottie = 'assets/admin.json';
  final color = Color.fromARGB(255, 5, 93, 245);

  
  final iconmysilverappbar = IconButton(
    onPressed: () {
      Get.toNamed(Routes.workerLoginorRegistration);
    }, 
    icon: FaIcon(FontAwesomeIcons.users), 
  );
  

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