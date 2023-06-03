// import 'package:flutter_tts/flutter_tts.dart';
//
// class TextToSpeech {
//   static FlutterTts _tts = FlutterTts();
//
//   static initTTS() async {
//
//     _tts.setLanguage("en-US");
//
//     _tts.setPitch(1.0);
//     _tts.setSpeechRate(0.5);
//   }
//
//   static speak(String text) async {
//     await _tts.awaitSpeakCompletion(true);
//
//     _tts.setStartHandler(() {
//       // TODO tts is started;
//     });
//
//     _tts.setCompletionHandler(() {
//       // TODO tts is completed;
//     });
//
//     _tts.setErrorHandler((msg) {
//       // TODO handle error;
//     });
//
//     _tts.speak(text);
//   }
// }
