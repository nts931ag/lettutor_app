import 'package:flutter/material.dart';
// import 'package:voice_chat_gpt/services/shared_preferences_service.dart';

class LanguageProvider with ChangeNotifier {
  // Locale _currentLocale = new Locale(SharedPreferencesService.getCurrentLocale() ?? 'en');

  // Locale get currentLocale => _currentLocale;

  void changeLocale(Locale newLocale) {
    // this._currentLocale = newLocale;
    // SharedPreferencesService.setCurrentLocale(newLocale.toString());
    notifyListeners();
  }
}
