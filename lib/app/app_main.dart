import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/app/app_pages.dart';
import 'package:lettutor_app/controllers/app_controller.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/languages/localization_service.dart';

class LettutorApp extends GetWidget<AppController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            title: LocalString.appName,
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            getPages: AppPages.pages,
            translations: Get.find<LocalizationService>(),
            locale: controller.locale.value,
            theme: controller.themeData.value,
            initialRoute: AppRoutes.LOGIN,
            defaultTransition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 200),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            fallbackLocale: const Locale('en'),
            supportedLocales: LocalizationService.supportLocale,
          ),
        );
      },
    );
  }
}
