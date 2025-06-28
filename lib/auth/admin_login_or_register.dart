import 'package:flutter/material.dart';
import 'package:manage_restaurant/pages/admin/admin_login_page.dart';
import 'package:manage_restaurant/pages/admin/admin_register_page.dart';

class AdminLoginOrRegister extends StatefulWidget {
  const AdminLoginOrRegister({super.key});

  @override
  State<AdminLoginOrRegister> createState() => _AdminLoginOrRegisterState();
}

class _AdminLoginOrRegisterState extends State<AdminLoginOrRegister> {

  //initially, show login page
  bool showLoginPage = true;

  //toggle between login and register page
  void togglePage(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLoginPage ? AdminLoginPage(onTap: togglePage,) 
    : AdminRegisterPage(onTap: togglePage);
  }
}