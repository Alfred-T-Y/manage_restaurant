import 'package:flutter/material.dart';
import 'package:manage_restaurant/themes/dark_mode.dart';
import 'package:manage_restaurant/themes/light_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeProvider extends ChangeNotifier{


 bool? _isLightMode;  // Variable d'instance pour stocker l'état du mode

  ThemeProvider() {
    _loadMode();  // Charger l'état au démarrage
  }

  // Charger le mode (fonction asynchrone)
  Future<void> _loadMode() async {
    final prefs = await SharedPreferences.getInstance();
    _isLightMode = prefs.getBool('mode') ?? true;  // Si la valeur est null, on suppose le mode clair par défaut
    notifyListeners();  // Notifier les écouteurs lorsque l'état change
  }

  // Récupérer le thème en fonction du mode
  ThemeData get themeData {
    if (_isLightMode == true) {
      return lightMode;  // Mode clair
    } else {
      return darkMode;  // Mode sombre
    }
  }

  // Vérifier si c'est en mode sombre
  bool get isDarkMode => _isLightMode == false;

  // Changer le mode de thème
  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isLightMode = !_isLightMode!;  // Inverser le mode
    prefs.setBool('mode', _isLightMode!);  // Sauvegarder la nouvelle valeur dans SharedPreferences
    notifyListeners();  // Notifier les écouteurs
  }

}