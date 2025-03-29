import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/core/routes/app_pages.dart';
import 'package:my_expenses/app/core/utils/localization_manager_util.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final localizationManager = LocalizationManagerUtil();
  runApp(
    GetMaterialApp(
      title: "Application",
       localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: projectThemeData(),
      supportedLocales: localizationManager.localization.supportedLocales,
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
      elevation: 0,
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
