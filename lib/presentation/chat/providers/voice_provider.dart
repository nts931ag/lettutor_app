import 'package:flutter/material.dart';
// import 'package:voice_chat_gpt/services/shared_preferences_service.dart';

class VoiceProvider with ChangeNotifier {
  // bool autoVoice = SharedPreferencesService.getAutoVoice() ?? false;

  void enableAutoVoice(bool value) {
    // autoVoice = value;
    // SharedPreferencesService.setAutoVoice(value);
    notifyListeners();
  }
}