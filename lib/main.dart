import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/routes/app_pages.dart';
import 'package:manage_restaurant/themes/dark_mode.dart';
import 'package:manage_restaurant/themes/light_mode.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.adminLoginorRegistration,
      getPages: AppPages.routes,
    );
  }
}


