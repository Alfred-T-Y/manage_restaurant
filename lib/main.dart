import 'package:flutter/material.dart';
import 'package:manage_restaurant/auth/admin_login_or_register.dart';
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
      home: AdminLoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}


