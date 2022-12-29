import 'package:flutter_localization/flutter_localization.dart';

class LocalizationManagerUtil {
  final localization = FlutterLocalization.instance;

  LocalizationManagerUtil(){
    _initLocalization();
  }
  

  _initLocalization(){
    localization.init(mapLocales: [ const MapLocale('pt',AppLocale.pt),], initLanguageCode: 'pt');
  }
  
}

mixin AppLocale {
  static const String title = 'title';
  static const Map<String, dynamic> pt = {title: 'Localização'};
}