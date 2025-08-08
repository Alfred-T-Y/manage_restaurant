import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manage_restaurant/components/settings_tile.dart';
import 'package:manage_restaurant/themes/theme_manager.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
        
            //Dark mode
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SettingsTile(
                    text: "Dark Mode", 
                    description: "Switch between light and dark mode", 
                    icon: FontAwesomeIcons.moon
                  ),
                ),
                CupertinoSwitch(
                  value: (ThemeManager().theme == ThemeMode.dark), 
                  onChanged: (value){
                    ThemeManager().toggleTheme();
                  },
                ),
                SizedBox(width: 10,),
              ],
            ),
        
            const Spacer(),
            
            Row(
              children: [
                Expanded(
                  child: SettingsTile(
                    text: "Delete account", 
                    description: "All your datas would be lost", 
                    icon: FontAwesomeIcons.trash,
                    onTap: () {
                      
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
        
          ],
        ),
      ),

    );
  }
}