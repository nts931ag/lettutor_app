// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/resource/languages/en_us.dart';
import 'package:lettutor_app/resource/languages/vi_vn.dart';

class LocalizationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {"vi": viVN, "en": enUS};


  static const VI_VN = "vi";
  static const EN_US = "en";

  static const supportLocale = [
    Locale(VI_VN),
    Locale(EN_US),
  ];

  String _language = VI_VN;

  String get currentLanguage => _language;
}
