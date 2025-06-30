import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manage_restaurant/components/lottie_listener.dart';
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
  final passwordController = TextEditingController();
  final confirmPassWordController = TextEditingController();
  final emailFocus = FocusNode();
  final nameFocus = FocusNode();
  final passWordFocus = FocusNode();
  final confirmPassWordFocus = FocusNode();
  final focussubmission = FocusNode();
  final formkey = GlobalKey<FormState>();
  List<String> choices = ["waiter","Kitchen manager", "Deliver"];
  final String? choice = null;
  ValueNotifier<String> choicelistener = ValueNotifier('assets/server.json');

  void submission(){
    if(focussubmission.hasFocus){
      if(formkey.currentState!.validate()){
        focussubmission.unfocus();
        (){};
      }
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> const WorkerHomePage(),)
    );
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
    return Scaffold(
        appBar: AppBar(
        title:Row(
          children: [
            Spacer(),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.user),
              color: Theme.of(context).colorScheme.inversePrimary,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 5,)
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          LottiListener(
            listener:choicelistener, 
            height: 200, 
            width: 200),
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
            focusnext: passWordFocus,
            ),
          SizedBox(height: 10,),

          //RoleDropdownbutton 
          MyDropdownbuttonformfield(
            hintText: "Choose a role", 
            choice: choice, 
            champ: "Role",
            choices: choices,
            listener: choicelistener,),
          SizedBox(height: 10,),

          //password textfield
          MyTextfield(
            hintText: "Password", 
            obscureText: true, 
            controller: passwordController,
            focusNode: passWordFocus,
            focusnext: confirmPassWordFocus,
            ),
          SizedBox(height: 10,),

          //Name of fastfood
          MyTextfield(
            hintText: "Enter the name of your restaurant", 
            obscureText: false, 
            controller: nameController,
            focusNode: nameFocus,
            focusnext: passWordFocus,
          ),
          SizedBox(height: 10,),

          //confirm password textfield
          MyTextfield(
            hintText: "Confirm the password", 
            obscureText: true, 
            controller: confirmPassWordController,
            focusNode: confirmPassWordFocus,),
          SizedBox(height: 10,),

          //sign up button
          MyButton(
            onTap: signup,
            text: "Sign up",
            color: Colors.greenAccent,
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
          )
        ],
      ),
    );
  }
}