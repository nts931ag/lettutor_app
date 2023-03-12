// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:lettutor_app/presentation/change_password/screen/change_password_binding.dart';
import 'package:lettutor_app/presentation/change_password/screen/change_password_page.dart';
import 'package:lettutor_app/presentation/dash_board.dart/screen/dashboard_binding.dart';
import 'package:lettutor_app/presentation/dash_board.dart/screen/dashboard_screen.dart';
import 'package:lettutor_app/presentation/forgot_password/screen/forgot_password_binding.dart';
import 'package:lettutor_app/presentation/forgot_password/screen/forgot_password_screen.dart';
import 'package:lettutor_app/presentation/login/screen/login_binding.dart';
import 'package:lettutor_app/presentation/login/screen/login_screen.dart';
import 'package:lettutor_app/presentation/profile/screen/profile_binding.dart';
import 'package:lettutor_app/presentation/profile/screen/profile_screen.dart';
import 'package:lettutor_app/presentation/tutor_detail/screen/tutor_detail_binding.dart';
import 'package:lettutor_app/presentation/tutor_detail/screen/tutor_detail_page.dart';

class AppRoutes {
  static String LOGIN = '/login';
  static String FORGOT_PASSWORD = '/forgot_password';
  static String PROFILE = '/profile';
  static String DASHBOARD = '/dashboard';
  static String CHANGE_PASSWORD = '/change_password';
  static String TUTOR_DETAIL = '/tutor_detail';
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
        binding: DashBoardBinding()),
    GetPage(
        name: AppRoutes.CHANGE_PASSWORD,
        page: () => ChangePasswordScreen(),
        binding: ChangePasswordBinding()),
    GetPage(
        name: AppRoutes.TUTOR_DETAIL,
        page: () => TutorDetailPage(),
        binding: TutorDetailBinding()),

  ];
}
