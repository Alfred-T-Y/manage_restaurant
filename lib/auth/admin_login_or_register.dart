import 'package:flutter/material.dart';
import 'package:manage_restaurant/modules/views/admin/admin_login_page_view.dart';
import 'package:manage_restaurant/modules/views/admin/admin_register_page_view.dart';

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
    return showLoginPage ? AdminLoginPageView(onTap: togglePage,) 
    : AdminRegisterPageView(onTap: togglePage);
  }
}