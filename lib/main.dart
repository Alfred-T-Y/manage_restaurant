import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:manage_restaurant/routes/app_pages.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.adminLoginorRegistration,
      getPages: AppPages.routes,
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}


