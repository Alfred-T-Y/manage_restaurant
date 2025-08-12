import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/components/my_button.dart';
import 'package:manage_restaurant/components/my_textfield.dart';
import 'package:lottie/lottie.dart';
import 'package:manage_restaurant/modules/controllers/worker_login_page_controller.dart';

class WorkerLoginPageView extends StatefulWidget {
  final void Function()? onTap;

  const WorkerLoginPageView({super.key, required this.onTap});

  @override
  State<WorkerLoginPageView> createState() => _WorkerLoginPageViewState();
}

class _WorkerLoginPageViewState extends State<WorkerLoginPageView> {

  final controller = Get.put(WorkerLoginPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title:Row(
          children: [
            Spacer(),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.userShield),
              color: Theme.of(context).colorScheme.inversePrimary,
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  "Food Delivery App",
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
                  color: controller.color,
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
    );
  }
}