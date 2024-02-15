import 'package:flutter/material.dart';

class  ThemeProvider extends ChangeNotifier{
  ThemeData currentTheme;

//Provider para el cambio de tema
  ThemeProvider({ required bool isDarkMode} )
   : currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

   setLightMode(){
    currentTheme = ThemeData.light();
    notifyListeners();
   }

   setDarkMode(){
    currentTheme = ThemeData.dark();
    notifyListeners();
   }
}