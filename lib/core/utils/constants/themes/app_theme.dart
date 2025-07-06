import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppTheme {
  AppTheme ._();

  static final AppTheme _instance = AppTheme._();



  static AppTheme get instance => _instance;


  ThemeData lightAppTheme (){
    return  ThemeData(
      fontFamily: "cairo",
      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: WidgetStateProperty.all(AppColors.appMainColor),
      ),
      scaffoldBackgroundColor: AppColors.appScaffold,
      colorScheme:
      ColorScheme.fromSeed(seedColor: AppColors.appMainColor),
      useMaterial3: true,
    );
  }

}