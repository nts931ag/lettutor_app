import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/controllers/app_controller.dart';
import 'package:lettutor_app/res/languages/localization_service.dart';

abstract class BaseController<C> extends GetxController {
  final _localizationService = Get.find<LocalizationService>();
  final _appController = Get.find<AppController>();
  late Rx<Locale?> locale;

  bool isLoading = false;

  bool isHaveDrawer = true;

  Rx<int> currentIndex = 1.obs;

  void onReloadData();

  @override
  void onInit() {
    super.onInit();
    locale = _localizationService.getLocale.obs;
  }

  Future<void> changeNation(String languageCode) async {
    await _localizationService.updateLanguage(languageCode);
    locale.value = _localizationService.getLocale;
  }

  handleOnTapDrawer() {
    currentIndex.value = 1 - currentIndex.value;
  }
}
