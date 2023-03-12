// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:lettutor_app/presentation/forgot_password/screen/forgot_password_binding.dart';
import 'package:lettutor_app/presentation/forgot_password/screen/forgot_password_page.dart';
import 'package:lettutor_app/presentation/login/screen/login_binding.dart';
import 'package:lettutor_app/presentation/login/screen/login_screen.dart';
import 'package:lettutor_app/presentation/profile/screen/profile_binding.dart';
import 'package:lettutor_app/presentation/profile/screen/profile_page.dart';

class AppRoutes {
  static String LOGIN = '/login';
  static String FORGOT_PASSWORD = '/forgot_password';
  static String PROFILE = '/profile';
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginScreen(),
      binding:LoginBinding(),
    ),
    GetPage(
        name: AppRoutes.FORGOT_PASSWORD,
        page: () => ForgotPasswordPage(),
        binding: ForgotPasswordBinding()),
    GetPage(
        name: AppRoutes.PROFILE,
        page: () => ProfilePage(),
        binding: ProfileBinding())
  ];
}
