import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/routes/app_pages.dart';
import 'package:manage_restaurant/themes/theme_manager.dart';


void main() {
  ThemeManager themeManager = Get.put(ThemeManager());
  themeManager.loadMode;
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeManager themeManager = Get.find<ThemeManager>();

    return Obx(()=> GetMaterialApp(
          theme: themeManager.theme.value,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.adminLoginorRegistration,
          getPages: AppPages.routes,
        ),
    );
  }
}


