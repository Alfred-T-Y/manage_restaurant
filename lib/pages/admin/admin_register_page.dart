import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/components/my_button.dart';
import 'package:manage_restaurant/components/my_textfield.dart';
import 'package:lottie/lottie.dart';
import 'package:manage_restaurant/routes/app_pages.dart';

class AdminRegisterPage extends StatefulWidget {

  final void Function ()? onTap;
  const AdminRegisterPage({super.key, required this.onTap});

  @override
  State<AdminRegisterPage> createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {

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
  final focussubmission = FocusNode();
  final formkey = GlobalKey<FormState>();

  void submission(){
    if(focussubmission.hasFocus){
      focussubmission.unfocus();
      signup();
    }
  }

    @override
  void initState() {
    super.initState();
    // Écouter les changements de focussubmission
    focussubmission.addListener(submission);
  }

  //signup method
  void signup(){
    //authentification

    //home page
    if(formkey.currentState!.validate()){
      Get.offAllNamed(Routes.adminHomePage);
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
              icon: FaIcon(FontAwesomeIcons.users),
              color: Theme.of(context).colorScheme.inversePrimary,
              onPressed: () {
                Get.toNamed(Routes.workerLoginorRegistration);  
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
                  'assets/admin.json',
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
                  controller: emailController,
                  focusNode: emailFocus,
                  focusnext: nameFocus,
                  champ: "your email",
                  bordercolor: Color.fromARGB(255, 5, 93, 245),
                  ),
                SizedBox(height: 10,),
            
                //Name 
                MyTextfield(
                  hintText: "Name and firstname", 
                  obscureText: false, 
                  controller: nameController,
                  focusNode: nameFocus,
                  focusnext: nameRestaurantFocus,
                  champ: 'your name and firstname',
                  bordercolor: Color.fromARGB(255, 5, 93, 245),
                ),
                SizedBox(height: 10,),
            
                //name of the restaurant
                MyTextfield(
                  hintText: "Name of your restaurant", 
                  obscureText: false, 
                  controller: nameRestaurantController,
                  focusNode: nameRestaurantFocus,
                  focusnext: passWordFocus,
                  champ: "the name of the restaurant",
                  bordercolor: Color.fromARGB(255, 5, 93, 245),
                ),
                SizedBox(height: 10,),
            
                //password textfield
                MyTextfield(
                  hintText: "Password", 
                  obscureText: true, 
                  controller: passwordController,
                  focusNode: passWordFocus,
                  focusnext: confirmPassWordFocus,
                  champ: "your password",
                  bordercolor: Color.fromARGB(255, 5, 93, 245),
                  ),
                SizedBox(height: 10,),
            
                //confirm password textfield
                MyTextfield(
                  hintText: "Confirm the password", 
                  obscureText: true, 
                  controller: confirmPassWordController,
                  focusNode: confirmPassWordFocus,
                  focusnext: focussubmission,
                  champ: "your password again",
                  bordercolor: Color.fromARGB(255, 5, 93, 245),
                  ),
                SizedBox(height: 10,),
            
                //sign up button
                MyButton(
                  onTap: signup,
                  text: "Sign up",
                  color: const Color.fromARGB(255, 5, 93, 245),
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
    );
  }
}