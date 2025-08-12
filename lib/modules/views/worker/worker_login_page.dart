import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:manage_restaurant/components/my_button.dart';
import 'package:manage_restaurant/components/my_textfield.dart';
import 'package:lottie/lottie.dart';
import 'package:manage_restaurant/routes/app_pages.dart';

class WorkerLoginPage extends StatefulWidget {
  final void Function()? onTap;

  const WorkerLoginPage({super.key, required this.onTap});

  @override
  State<WorkerLoginPage> createState() => _WorkerLoginPageState();
}

class _WorkerLoginPageState extends State<WorkerLoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passWordFocus = FocusNode();
  final focussubmission = FocusNode();
  final formkey = GlobalKey<FormState>();

  void submission(){
    if(focussubmission.hasFocus){
      login();
    }
  }

    @override
  void initState() {
    super.initState();
    // Écouter les changements de focussubmission
    focussubmission.addListener(submission);
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
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Lottie.asset(
                  'assets/worker_login.json',
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
                  controller: emailController,
                  focusNode: emailFocus,
                  focusnext: passWordFocus,
                  champ: "your email",
                  bordercolor: Color.fromARGB(255, 2, 122, 64),
                  ),
                SizedBox(height: 10,),
            
                //password textfield
                MyTextfield(
                  hintText: "Password", 
                  obscureText: true, 
                  controller: passwordController,
                  focusNode: passWordFocus,
                  focusnext: focussubmission,
                  champ: "your password",
                  bordercolor: Color.fromARGB(255, 2, 122, 64),
                  ),
                SizedBox(height: 10,),
            
                //sign in button
                MyButton(
                  onTap: login,
                  text: "Log in",
                  color: const Color.fromARGB(255, 2, 122, 64),
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