import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class ThemeController extends SimpleNotifier{
  ThemeMode _mode = ThemeMode.light; 
  ThemeMode get mode => _mode;
  bool get isDark => _mode == ThemeMode.dark;

  void toggle(){
    if(_mode == ThemeMode.light){
      _mode = ThemeMode.dark;
    }else{
      _mode = ThemeMode.light;
    }
    notify();
  }
}

extension ThemeContextExtension on BuildContext{
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}

final themeProvider = SimpleProvider(
  (_) => ThemeController(),
  autoDispose: false
);
