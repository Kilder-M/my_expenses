import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/core/utils/localization_manager_util.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final localizationManager = LocalizationManagerUtil();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: projectThemeData(),
      supportedLocales: localizationManager.localization.supportedLocales,
      localizationsDelegates: localizationManager.localization.localizationsDelegates,
    ),
  );
  
}

ThemeData projectThemeData() {
  return ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.deepPurpleAccent,
    ),
    scaffoldBackgroundColor: Colors.grey[200],
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.grey[200],
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.deepPurple,
    ),
  );
}
