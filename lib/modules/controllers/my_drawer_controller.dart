import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/modules/models/drawertile_model.dart';
import 'package:manage_restaurant/routes/app_pages.dart';

class MyDrawerController extends GetxController{

  final head = Text(
    '🍽️',
    style: TextStyle(
      fontSize: 80,
    ),
  );

  final List<DrawertileModel> drawertilelist = [
    
    DrawertileModel("Home", 
      FontAwesomeIcons.house, 
      ()=> Get.back()
    ),
    DrawertileModel("QR code", 
      FontAwesomeIcons.qrcode, 
      ()=> Get.toNamed(Routes.generateQrCodePage)
    ),
    DrawertileModel("Settings", 
      FontAwesomeIcons.gear, 
      (){
        Get.back();
        Get.toNamed(Routes.settingsPage);
      }
    ),
    DrawertileModel("Log out", 
      FontAwesomeIcons.rightFromBracket, 
      ()=> Get.offAllNamed(Routes.adminLoginorRegistration),
    )

  ];

}