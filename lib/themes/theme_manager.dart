import 'package:get/get.dart';
import 'package:manage_restaurant/themes/dark_mode.dart';
import 'package:manage_restaurant/themes/light_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager extends GetxController {

  var theme = lightMode.obs;

  void loadMode() async {
    final prefs = await SharedPreferences.getInstance();
    (prefs.getBool('mode') ?? true) ?
    (theme.value=lightMode) : (theme.value=darkMode);
  }


  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('mode')!){
      prefs.setBool('mode', false);
      theme.value = darkMode;
    } else{
      prefs.setBool('mode', true);
      theme.value = lightMode;
    }  
  }

}