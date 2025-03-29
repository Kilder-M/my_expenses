import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/core/routes/app_pages.dart';
import 'package:my_expenses/app/core/utils/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      supportedLocales: L10n.allLanguage,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      // theme: getProjectThemeData(),
    ),
  );
}
