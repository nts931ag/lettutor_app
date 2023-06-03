// import 'dart:ffi';
//
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:voice_chat_gpt/models/chat_model.dart';
//
// class SharedPreferencesService {
//   static SharedPreferences? _prefs;
//
//   static Future init() async => _prefs = await SharedPreferences.getInstance();
//
//   static Future removeChatMessageList() async {
//     await _prefs!.remove('chatMessageList');
//   }
//
//   static Future setChatMessageList(List<ChatModel> chatModels) async {
//     await _prefs!.setString('chatMessageList', ChatModel.encode(chatModels));
//   }
//
//   static List<ChatModel>? getChatMessageList() {
//     final String? chatModels = _prefs!.getString('chatMessageList');
//     if (chatModels != null) {
//       return ChatModel.decode(chatModels);
//     }
//     return null;
//   }
//
//   static Future setCurrentLocale(String value) async =>
//       await _prefs!.setString('currentLocale', value);
//
//   static String? getCurrentLocale() => _prefs!.getString('currentLocale');
//
//   static Future setSeenOnboard(bool value) async =>
//       await _prefs!.setBool('seenOnboard', value);
//
//   static bool? getSeenOnboard() => _prefs!.getBool('seenOnboard');
//
//   static Future setIsDarkTheme(bool value) async =>
//       await _prefs!.setBool('darkTheme', value);
//
//   static bool? getIsDarkTheme() => _prefs!.getBool('darkTheme');
//
//   static Future setAutoVoice(bool value) async =>
//       await _prefs!.setBool('autoVoice', value);
//
//   static bool? getAutoVoice() => _prefs!.getBool('autoVoice');
// }
