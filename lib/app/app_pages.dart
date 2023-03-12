// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:lettutor_app/presentation/login/screen/login_screen.dart';

class AppRoutes {
  static String LOGIN = '/login';
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginScreen(),
    ),
  ];
}
