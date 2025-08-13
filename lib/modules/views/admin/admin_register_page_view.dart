import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/components/my_button.dart';
import 'package:manage_restaurant/components/my_sliver_appbar.dart';
import 'package:manage_restaurant/components/my_textfield.dart';
import 'package:lottie/lottie.dart';
import 'package:manage_restaurant/modules/controllers/admin_register_page_controller.dart';

class AdminRegisterPageView extends StatefulWidget {

  final void Function ()? onTap;
  const AdminRegisterPageView({super.key, required this.onTap});

  @override
  State<AdminRegisterPageView> createState() => _AdminRegisterPageViewState();
}

class _AdminRegisterPageViewState extends State<AdminRegisterPageView> {

  final controller = Get.put(AdminRegisterPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySliverAppbar(
              icon: controller.iconmysilserappbar,
            )
          ],
          body: SingleChildScrollView(
            child: Form(
              key: controller.formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  Lottie.asset(
                    controller.lottie,
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
              
                  const SizedBox(height: 25),
              
                  //app slogan
                  Text(
                    "Create a new account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
              
                  const SizedBox(height: 25),
                  
                  //emailtextfield
                  MyTextfield(
                    hintText: "Email", 
                    obscureText: false, 
                    controller: controller.emailController,
                    focusNode: controller.emailFocus,
                    focusnext: controller.nameFocus,
                    champ: "your email",
                    bordercolor: controller.color,
                    ),
                  SizedBox(height: 10,),
              
                  //Name 
                  MyTextfield(
                    hintText: "Name and firstname", 
                    obscureText: false, 
                    controller: controller.nameController,
                    focusNode: controller.nameFocus,
                    focusnext: controller.nameRestaurantFocus,
                    champ: 'your name and firstname',
                    bordercolor: controller.color,
                  ),
                  SizedBox(height: 10,),
              
                  //name of the restaurant
                  MyTextfield(
                    hintText: "Name of your restaurant", 
                    obscureText: false, 
                    controller: controller.nameRestaurantController,
                    focusNode: controller.nameRestaurantFocus,
                    focusnext: controller.passWordFocus,
                    champ: "the name of the restaurant",
                    bordercolor: controller.color,
                  ),
                  SizedBox(height: 10,),
              
                  //password textfield
                  MyTextfield(
                    hintText: "Password", 
                    obscureText: true, 
                    controller: controller.passwordController,
                    focusNode: controller.passWordFocus,
                    focusnext: controller.confirmPassWordFocus,
                    champ: "your password",
                    bordercolor: controller.color,
                    ),
                  SizedBox(height: 10,),
              
                  //confirm password textfield
                  MyTextfield(
                    hintText: "Confirm the password", 
                    obscureText: true, 
                    controller: controller.confirmPassWordController,
                    focusNode: controller.confirmPassWordFocus,
                    focusnext: controller.focussubmission,
                    champ: "your password again",
                    bordercolor: controller.color,
                    ),
                  SizedBox(height: 10,),
              
                  //sign up button
                  MyButton(
                    onTap: controller.signup,
                    text: "Sign up",
                    color: controller.color,
                    ),
                  SizedBox(height: 20,),
              
                  //Log in
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have a account?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text("Log in",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}