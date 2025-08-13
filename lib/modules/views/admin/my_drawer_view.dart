import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:manage_restaurant/components/my_drawer_tile.dart';
import 'package:manage_restaurant/modules/controllers/my_drawer_controller.dart';
import 'package:manage_restaurant/routes/app_pages.dart';

class MyDrawerView extends StatelessWidget {
  const MyDrawerView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(MyDrawerController());

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [

          //cutlery
          SizedBox(height: 10,),
          Center(
            child: controller.head,
          ),
          SizedBox(height: 30,),

          Expanded(
            child: ListView.builder(
              itemCount: controller.drawertilelist.length-1,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MyDrawerTile(text: controller.drawertilelist[index].text, 
                    icon: controller.drawertilelist[index].icon, 
                    onTap: controller.drawertilelist[index].onTap),
                );
              }
            ),
          ),

          const Spacer(),

          MyDrawerTile(
            text: "Log out", 
            icon: FontAwesomeIcons.rightFromBracket, 
            onTap: (){
              Get.offAllNamed(Routes.adminLoginorRegistration);
            }
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}