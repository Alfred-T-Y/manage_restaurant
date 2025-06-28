import 'package:flutter/material.dart';
import 'package:manage_restaurant/pages/worker/worker_login_page.dart';
import 'package:manage_restaurant/pages/worker/worker_register_page.dart';


class WorkerLoginOrRegister extends StatefulWidget {
  const WorkerLoginOrRegister({super.key});

  @override
  State<WorkerLoginOrRegister> createState() => _WorkerLoginOrRegisterState();
}

class _WorkerLoginOrRegisterState extends State<WorkerLoginOrRegister> {

  //initially, show login page
  bool workerLoginPage = true;

  //toggle between login and register page
  void togglePage(){
    setState(() {
      workerLoginPage = !workerLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return workerLoginPage ? WorkerLoginPage(onTap: togglePage,) 
    : WorkerRegisterPage(onTap: togglePage);
  }
}