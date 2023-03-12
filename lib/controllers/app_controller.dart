import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/app/app_setup.dart';
import 'package:lettutor_app/app/app_storage.dart';
import 'package:lettutor_app/res/languages/localization_service.dart';
import 'package:lettutor_app/res/theme/app_theme.dart';
import 'package:lettutor_app/res/theme/theme_service.dart';

class AppController extends GetxController {
  late Rx<Locale?> locale;
  late Rx<ThemeData?> themeData;



  init() async {
    await Future.wait([initStorage()]);
    final appStorage = Get.find<AppStorage>();

    setupApp();
    await initTheme(appStorage);
    await initLanguage();
  }

  Future<void> initStorage() async {
    await Get.put(AppStorage()).init();
  }

  Future<void> initLanguage() async {
    await Get.put(LocalizationService()).init();
    final localeService = Get.find<LocalizationService>();
    locale = localeService.getLocale.obs;

    // Listen to the change of locale
    localeService.appStorage.box.listenKey(AppStorage.APP_LANGUAGE, (value) {
      if (value != null) {

        final newLocale = Locale(value);
        locale.value = newLocale;
      }
    });
  }

  Future<void> initTheme(AppStorage storage) async {
    await Get.put(ThemeService()).init(storage);
    final themeService = Get.find<ThemeService>();
    themeData = themeService.themeData.obs;

    // Listen to the change of Theme
    storage.box.listenKey(AppStorage.APP_THEME, (value) {
      if (value != null) {
        themeData.value = appThemeData[themeService.getAppTheme(value)];
      } else {
        themeData = appThemeData[themeService.getAppTheme(value)].obs;
      }
    });
  }
}
