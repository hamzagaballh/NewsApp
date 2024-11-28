import 'package:flutter/material.dart';
import 'package:flutter_application_3/config/theme/app_style.dart';
import 'package:flutter_application_3/core/colors_manager.dart';
// import 'package:flutter_application_3/my_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme{
  static final ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: ColorsManager.white
      ),
      color: ColorsManager.green,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.r))
      ),
      titleTextStyle: AppStyles.appBar
      
    )
  );
}