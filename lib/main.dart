import 'package:flutter/material.dart';
import 'package:manage_restaurant/auth/admin_login_or_register.dart';
import 'package:manage_restaurant/auth/worker_login_or_register.dart';
import 'package:manage_restaurant/components/generate_qr_code_page.dart';
import 'package:manage_restaurant/components/scan_qr_code_page.dart';
import 'package:manage_restaurant/pages/admin/admin_home_page.dart';
import 'package:manage_restaurant/pages/worker/worker_home_page.dart';
import 'package:manage_restaurant/themes/theme_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings)=> Routegenerator.generateRoute(settings),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

class Routegenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context)=> AdminLoginOrRegister());
      case '/WorkerLoginOrRegister':
        return MaterialPageRoute(builder: (context)=> const WorkerLoginOrRegister());
      case '/AdminHomePage':
        return  MaterialPageRoute(builder: (context)=> const AdminHomePage());
      case '/WorkerHomePage':
        return MaterialPageRoute(builder: (context)=> const WorkerHomePage());
      case '/ScanQrCodePage':
        return MaterialPageRoute(builder: (context)=> const ScanQrCodePage());
      case '/GenerateQrCodePage':
        return MaterialPageRoute(builder: (cantext)=> const GenerateQrCodePage());

      default:
        return MaterialPageRoute(
          builder: (context)=> Scaffold(
            appBar: AppBar(title: Text("Error"), centerTitle: true,),
            body: Center(
              child: Text("Page not found")),
          ));
    }
  }
}

