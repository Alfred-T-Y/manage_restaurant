import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/components/my_button.dart';
import 'package:manage_restaurant/components/my_sliver_appbar.dart';
import 'package:manage_restaurant/components/my_textfield.dart';
import 'package:lottie/lottie.dart';
import 'package:manage_restaurant/modules/controllers/admin_login_page_controller.dart';


class AdminLoginPageView extends StatefulWidget {
  final void Function()? onTap;

  const AdminLoginPageView({super.key, required this.onTap});

  @override
  State<AdminLoginPageView> createState() => _AdminLoginPageViewState();
}

class _AdminLoginPageViewState extends State<AdminLoginPageView> {

  final controller = Get.put(AdminLoginPageController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySliverAppbar(
              icon: controller.iconmysilverappbar,
            ),
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
                    "Manage your restaurant",
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
                    focusnext: controller.passWordFocus,
                    champ: "your email",
                    bordercolor: controller.color,
                    ),
                  SizedBox(height: 10,),
              
                  //password textfield
                  MyTextfield(
                    hintText: "Password", 
                    obscureText: true, 
                    controller: controller.passwordController,
                    focusNode: controller.passWordFocus,
                    focusnext: controller.focussubmission,
                    champ: "your password",
                    bordercolor: controller.color,
                    ),
                  SizedBox(height: 10,),
              
                  //sign in button
                  MyButton(
                    onTap: controller.login,
                    text: "Log in",
                    color: Colors.blue,
                    ),
                  SizedBox(height: 20,),
              
                  //register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Not a member?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text("Register now",
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