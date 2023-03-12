// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:lettutor_app/presentation/dash_board.dart/screen/dashboard_binding.dart';
import 'package:lettutor_app/presentation/dash_board.dart/screen/dashboard_screen.dart';
import 'package:lettutor_app/presentation/forgot_password/screen/forgot_password_binding.dart';
import 'package:lettutor_app/presentation/forgot_password/screen/forgot_password_screen.dart';
import 'package:lettutor_app/presentation/login/screen/login_binding.dart';
import 'package:lettutor_app/presentation/login/screen/login_screen.dart';
import 'package:lettutor_app/presentation/profile/screen/profile_binding.dart';
import 'package:lettutor_app/presentation/profile/screen/profile_screen.dart';

class AppRoutes {
  static String LOGIN = '/login';
  static String FORGOT_PASSWORD = '/forgot_password';
  static String PROFILE = '/profile';
  static String DASHBOARD = '/dashboard';
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: AppRoutes.FORGOT_PASSWORD,
        page: () => ForgotPasswordScreen(),
        binding: ForgotPasswordBinding()),
    GetPage(
        name: AppRoutes.PROFILE,
        page: () => ProfileScreen(),
        binding: ProfileBinding()),
    GetPage(
        name: AppRoutes.DASHBOARD,
        page: () => DashboardScreen(),
        binding: DashBoardBinding())
  ];
}
