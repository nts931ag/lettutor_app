// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:lettutor_app/presentation/change_password/screen/change_password_binding.dart';
import 'package:lettutor_app/presentation/change_password/screen/change_password_screen.dart';
import 'package:lettutor_app/presentation/course/screen/course_screen.dart';
import 'package:lettutor_app/presentation/course_detail/screen/course_detail_binding.dart';
import 'package:lettutor_app/presentation/course_detail/screen/course_detail_screen.dart';
import 'package:lettutor_app/presentation/course_list/screen/course_list_binding.dart';
import 'package:lettutor_app/presentation/course_list/screen/course_list_screen.dart';
import 'package:lettutor_app/presentation/dash_board.dart/screen/dashboard_binding.dart';
import 'package:lettutor_app/presentation/dash_board.dart/screen/dashboard_screen.dart';
import 'package:lettutor_app/presentation/forgot_password/screen/forgot_password_binding.dart';
import 'package:lettutor_app/presentation/forgot_password/screen/forgot_password_screen.dart';
import 'package:lettutor_app/presentation/history/screen/history_binding.dart';
import 'package:lettutor_app/presentation/history/screen/history_page.dart';
import 'package:lettutor_app/presentation/login/screen/login_binding.dart';
import 'package:lettutor_app/presentation/login/screen/login_screen.dart';
import 'package:lettutor_app/presentation/pdf_reader/screen/pdf_reader_screen.dart';
import 'package:lettutor_app/presentation/profile/screen/profile_binding.dart';
import 'package:lettutor_app/presentation/profile/screen/profile_screen.dart';
import 'package:lettutor_app/presentation/review/screen/review_binding.dart';
import 'package:lettutor_app/presentation/review/screen/review_screen.dart';
import 'package:lettutor_app/presentation/schedule/screen/schedule_binding.dart';
import 'package:lettutor_app/presentation/schedule/screen/schedule_page.dart';
import 'package:lettutor_app/presentation/tutor_detail/screen/tutor_detail_binding.dart';
import 'package:lettutor_app/presentation/tutor_detail/screen/tutor_detail_screen.dart';
import 'package:lettutor_app/presentation/video_call/screen/video_call_screen.dart';

class AppRoutes {
  static String LOGIN = '/login';
  static String FORGOT_PASSWORD = '/forgot_password';
  static String PROFILE = '/profile';
  static String DASHBOARD = '/dashboard';
  static String CHANGE_PASSWORD = '/change_password';
  static String TUTOR_DETAIL = '/tutor_detail';
  static String COURSE = '/course';
  static String REVIEW = '/tutor_detail/review';
  static String COURSE_DETAIL = "/course/detail";
  static String SCHEDULE = '/schedule';
  static String HISTORY = '/history';
  static String VIDEO_CALL = '/video_call';
  static String DISCOVERY_COURSE = '/course/discovery';
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
        page: () => TutorDetailScreen(),
        binding: TutorDetailBinding()),
    GetPage(
        name: AppRoutes.COURSE,
        page: () => CourseListScreen(),
        binding: CourseBinding()),
    GetPage(
        name: AppRoutes.REVIEW,
        page: () => ReviewScreen(),
        binding: ReviewBinding()),
    GetPage(
        name: AppRoutes.COURSE_DETAIL,
        page: () => CourseDetailScreen(),
        binding: CourseDetailBinding()),
    GetPage(
        name: AppRoutes.SCHEDULE,
        page: () => ScheduleScreen(),
        binding: ScheduleBinding()),
    GetPage(
        name: AppRoutes.HISTORY,
        page: () => HistoryPage(),
        binding: HistoryBinding()),
    GetPage(name: AppRoutes.VIDEO_CALL, page: () => VideoCallScreen()),
    GetPage(name: AppRoutes.DISCOVERY_COURSE, page: () => CourseScreen()),
  ];
}
