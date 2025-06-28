import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manage_restaurant/components/my_drawer_tile.dart';
import 'package:manage_restaurant/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [

          //cutlery
          SizedBox(height: 10,),
          Center(
            child: Text(
              '🍽️',
              style: TextStyle(
                fontSize: 80,
              ),
            )
          ),
          SizedBox(height: 30,),

          MyDrawerTile(
            text: "                     Home", 
            icon: FontAwesomeIcons.house, 
            onTap: (){
              Navigator.pop(context);
            }
          ),
          SizedBox(height: 10,),

          MyDrawerTile(
            text: "                     Settings", 
            icon: FontAwesomeIcons.gear, 
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                )
              );
            }
          ),
          SizedBox(height: 10,),

          const Spacer(),

          MyDrawerTile(
            text: "                     Log out", 
            icon: FontAwesomeIcons.rightFromBracket, 
            onTap: (){}
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}