import 'package:get/get.dart';
import 'package:manage_restaurant/themes/dark_mode.dart';
import 'package:manage_restaurant/themes/light_mode.dart';
import 'package:get_storage/get_storage.dart';

class ThemeManager extends GetxController {
  var theme = lightMode.obs;

  void loadMode() {
    final box = GetStorage();
    (box.read('mode') ?? true) ?
    (theme.value=lightMode) : (theme.value=darkMode);
  }


  void toggleTheme() {
    final box = GetStorage();
    if (box.read('mode') ?? true){
      box.write('mode', false);
      theme.value = darkMode;
    } else{
      box.write('mode', true);
      theme.value = lightMode;
    }  
  }

}