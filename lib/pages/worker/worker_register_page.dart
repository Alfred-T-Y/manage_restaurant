import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:manage_restaurant/components/my_button.dart';
import 'package:manage_restaurant/components/my_dropdownbuttonformfield.dart';
import 'package:manage_restaurant/components/my_textfield.dart';
import 'package:manage_restaurant/pages/worker/worker_home_page.dart';

class WorkerRegisterPage extends StatefulWidget {

  final void Function ()? onTap;
  const WorkerRegisterPage({super.key, required this.onTap});

  @override
  State<WorkerRegisterPage> createState() => _WorkerRegisterPageState();
}

class _WorkerRegisterPageState extends State<WorkerRegisterPage> {

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final idFocus = FocusNode();
  final passwordController = TextEditingController();
  final confirmPassWordController = TextEditingController();
  final emailFocus = FocusNode();
  final nameFocus = FocusNode();
  final passWordFocus = FocusNode();
  final confirmPassWordFocus = FocusNode();
  final focussubmission = FocusNode();
  final formkey = GlobalKey<FormState>();
  List<String> choices = ["Waiter","Kitchen manager","Deliver","Manager"];
  String? choice;
  ValueNotifier<String> choicelistener = ValueNotifier('Waiter');
  Color buttoncolor = const Color.fromARGB(255, 15, 224, 123);


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
    if(formkey.currentState!.validate() /*&& choice != null*/){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> const WorkerHomePage(),)
      );
    }
  }
  /*String lottie(){
    if (choice == null || choice == 'waiter'){
      return 'assets/server.json';
    }
    if (choice == 'Deliver'){
      return 'assets/deliver.json';
    }
    if (choice == 'Kitchen manager'){
      return 'assets/kitchen_manager.json';
    }
    return 'assets/server.json';
  }*/

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: choicelistener,
      builder:(context, animationPath, child) {
        switch(animationPath){
          case "Waiter":
            animationPath = "assets/server.json";
            buttoncolor = const Color.fromARGB(255, 15, 224, 123);
            break;
          case "Kitchen manager":
            animationPath = "assets/kitchen_manager.json";
            buttoncolor = const Color.fromARGB(255, 8, 202, 14);
            break;
          case "Deliver":
            animationPath = "assets/deliver.json";
            buttoncolor = const Color.fromARGB(255, 25, 1, 112);
            break;
          case "Manager":
            animationPath = "assets/manager.json";
            buttoncolor = const Color.fromARGB(255, 146, 144, 23);
            break;
        }
        return Scaffold(
          appBar: AppBar(
            title:Row(
              children: [
                Spacer(),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.userShield),
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  Lottie.asset(
                    animationPath,
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 25),
              
                  //app slogan
                  Text(
                    "Start working",
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
                    ),
                  SizedBox(height: 10,),
              
                  //name
                  MyTextfield(
                    hintText: "Name and Firstname", 
                    obscureText: false, 
                    controller: nameController,
                    focusNode: nameFocus,
                    focusnext: idFocus,
                    champ: "your name and firstname",
                    ),
                  SizedBox(height: 10,),
                      
                  //RoleDropdownbutton 
                  MyDropdownbuttonformfield(
                    hintText: "Role", 
                    choice: (value) {
                      setState(() {
                        choice = value;
                      });
                    },
                    champ: "Role",
                    choices: choices,
                    listener: choicelistener,
                    ),
                  SizedBox(height: 10,),
              
                  //employer's id
                  MyTextfield(
                    hintText: "Employer's ID", 
                    obscureText: false, 
                    controller: idController,
                    focusNode: idFocus,
                    focusnext: passWordFocus,
                    champ: "your employer's id",
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
                    ),
                  SizedBox(height: 10,),
                      
                  //confirm password textfield
                  MyTextfield(
                    hintText: "Confirm the password", 
                    obscureText: true, 
                    controller: confirmPassWordController,
                    focusNode: confirmPassWordFocus,
                    focusnext: focussubmission,
                    champ: "your password again",),
                  SizedBox(height: 10,),
                      
                  //sign up button
                  MyButton(
                    onTap: signup,
                    text: "Sign up",
                    color: buttoncolor,
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
        );}
    );
  }
}