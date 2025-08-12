import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/auth/admin_login_or_register.dart';
import 'package:manage_restaurant/auth/worker_login_or_register.dart';
import 'package:manage_restaurant/components/error_page.dart';
import 'package:manage_restaurant/components/generate_qr_code_page.dart';
import 'package:manage_restaurant/components/scan_qr_code_page.dart';
import 'package:manage_restaurant/modules/views/admin/admin_home_page.dart';
import 'package:manage_restaurant/modules/views/admin/personnels_page.dart';
import 'package:manage_restaurant/modules/views/settings_page.dart';
import 'package:manage_restaurant/modules/views/worker/worker_home_page.dart';

part 'app_routes.dart';


class AppPages {
  static final routes = [
    GetPage(
      name: Routes.adminLoginorRegistration, 
      page: ()=>AdminLoginOrRegister()
    ),
    GetPage(
      name: Routes.workerLoginorRegistration, 
      page: ()=>WorkerLoginOrRegister()
    ),
    GetPage(
      name: Routes.adminHomePage, 
      page: ()=>AdminHomePage()
    ),
    GetPage(
      name: Routes.workerHomePage, 
      page: ()=>WorkerHomePage()
    ),
    GetPage(
      name: Routes.scanQrCodePage, 
      page: () {
        final color = Get.arguments as Color; // récupère l'argument ici
        return ScanQrCodePage(color: color);
      },
    ),
    GetPage(
      name: Routes.generateQrCodePage, 
      page: ()=>GenerateQrCodePage()
    ),
    GetPage(
      name: Routes.personnelsPage, 
      page: ()=>PersonnelsPage()
    ),
    GetPage(
      name: Routes.settingsPage, 
      page: ()=>SettingsPage()
    ),
    GetPage(
      name: Routes.errorPage, 
      page: ()=>ErrorPage()
    ),
  ];
}