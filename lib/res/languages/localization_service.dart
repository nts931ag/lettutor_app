// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/app/app_storage.dart';
import 'package:lettutor_app/res/languages/en_us.dart';
import 'package:lettutor_app/res/languages/vi_vn.dart';

class LocalizationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {"vi": viVN, "en": enUS};

  final appStorage = Get.find<AppStorage>();

  static const VI_VN = "vi";
  static const EN_US = "en";

  static const supportLocale = [
    Locale(VI_VN),
    Locale(EN_US),
  ];

  String _language = VI_VN;

  String get currentLanguage => _language;

  init() {
    loadLanguage();
  }

  Future<void> loadLanguage() async {
    _language = await appStorage.getLanguage();
  }

  Locale? get getLocale {
    return Locale(_language);
  }

  Future<void> updateLanguage(String value) async {
    _language = value;
    await appStorage.setLanguage(value);
    if (getLocale != null) {
      Get.updateLocale(getLocale!);

    }
  }
}
