import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:manage_restaurant/components/my_button.dart';
import 'package:manage_restaurant/components/my_dropdownbuttonformfield.dart';
import 'package:manage_restaurant/components/my_textfield.dart';
import 'package:manage_restaurant/modules/controllers/worker_register_page_controller.dart';

class WorkerRegisterPageView extends StatefulWidget {

  final void Function ()? onTap;
  const WorkerRegisterPageView({super.key, required this.onTap});

  @override
  State<WorkerRegisterPageView> createState() => _WorkerRegisterPageViewState();
}

class _WorkerRegisterPageViewState extends State<WorkerRegisterPageView> {

  final controller = Get.put(WorkerRegisterPageController());

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
                  controller.animationPath!,
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
                  controller: controller.emailController,
                  focusNode: controller.emailFocus,
                  focusnext: controller.nameFocus,
                  champ: "your email",
                  bordercolor: controller.pagecolor,
                  ),
                SizedBox(height: 10,),
            
                //name
                MyTextfield(
                  hintText: "Name and Firstname", 
                  obscureText: false, 
                  controller: controller.nameController,
                  focusNode: controller.nameFocus,
                  focusnext: controller.phonenumberFocus,
                  champ: "your name and firstname",
                  bordercolor: controller.pagecolor,
                  ),
                SizedBox(height: 10,),
        
                //phone number
                Row(
                  children: [
                    SizedBox(width: 25,),
                    SizedBox(
                      width: 130,
                      child: MyDropdownbuttonformfield(
                        choices: controller.countryPhoneCodes, 
                        valueStart: '🇨🇲 +237',
                        radius: 0,
                        padding: 0,
                        onChanged: (value)=> setState(() {
                          controller.code = value;
                        }),),
                    ),
                
                    SizedBox(width: 10,),
                
                    Expanded(
                      child: MyTextfield(
                        hintText: "Phonenumber", 
                        obscureText: false, 
                        controller: controller.phonenumberController,
                        focusNode: controller.phonenumberFocus,
                        focusnext: controller.idFocus,
                        bordercolor: controller.pagecolor,
                        padding: 0,
                      ),
                    ),
                    SizedBox(width: 25,)
                  ],
                ),
                SizedBox(height: 10,),
                    
                //RoleDropdownbutton 
                MyDropdownbuttonformfield(
                  hintText: "Role", 
                  champ: "Role",
                  choices: controller.choices,
                  onChanged: (value)=> setState(() {
                    controller.choice.value = value;
                  }),
                  ),
                SizedBox(height: 10,),
            
                //employer's id
                Row(
                  children: [
                    SizedBox(width: 25,),
                    Expanded(
                      child: MyTextfield(
                        hintText: "Employer's ID", 
                        obscureText: false, 
                        controller: controller.idController,
                        focusNode: controller.idFocus,
                        focusnext: controller.passWordFocus,
                        champ: "your employer's id",
                        bordercolor: controller.pagecolor,
                        padding: 0,
                      ),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      child: Icon(
                        FontAwesomeIcons.qrcode,
                        color: Theme.of(context).colorScheme.primary,
                        size: 42,
                        ),
                      onTap: () async {
                          var result = await Get.toNamed(
                            '/ScanQrCodePage',
                            arguments: controller.pagecolor,
                          );
                          if (result != null) {
                            setState(() {
                              controller.idController.text = result.toString();
                            });
                          }
                        },
                    ),
                    SizedBox(width: 25,)
                  ],
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
                  bordercolor: controller.pagecolor,
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
                  bordercolor: controller.pagecolor,
                  ),
                SizedBox(height: 10,),
                    
                //sign up button
                MyButton(
                  onTap: controller.signup,
                  text: "Sign up",
                  color: controller.pagecolor!,
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
    );}

  }
  