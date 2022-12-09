import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLocale = 'en';
  ThemeMode appMode =ThemeMode.light;

  void ChangeLocale(String newLocale){
    if(appLocale == newLocale){
      return;
    }
    appLocale =newLocale;
    notifyListeners();
  }

  void ChangeTheme(ThemeMode newMode){
    if(appMode == newMode){
      return;
    }
    appMode = newMode;
    notifyListeners();
  }
}