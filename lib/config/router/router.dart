import 'package:flutter/material.dart';
import 'package:lettutor_app/config/router/error_page.dart';
import 'package:lettutor_app/presentation/views/base_screen.dart';
import 'package:lettutor_app/presentation/views/course_list_screen.dart';
import 'package:lettutor_app/presentation/views/history_screen.dart';
import 'package:lettutor_app/presentation/views/schedule_screen.dart';
import 'package:lettutor_app/presentation/views/settings_screen.dart';
import 'package:lettutor_app/presentation/views/tutor_list_screen.dart';

class MyRouter {
  // Base
  static const String baseScreen = "BaseScreen";

  static const String home = 'Homepage';

  //Courses
  static const String courses = 'Online Courses';
  static const String courseDetail = 'Course Details';
  static const String lessonDetail = 'Lesson Details';

  //Authentication
  static const String forgotPassword = 'Forgot Password';
  static const String login = 'Login';
  static const String signUp = 'Sign up';

  //Selector
  static const String selectTutorOrCourse = 'Study';

  //Tutors
  static const String tutors = 'Online Tutors';
  static const String tutorDetail = 'Tutor Details';
  static const String bookingDetail = 'Booking Details';

  //Schedule
  static const String schedule = 'Schedule';
  static const String learningHistory = 'Learning History';
  static const String analysis = 'Analysis';
  static const String joinMeeting = 'Join Meeting';

  //Settings
  static const String setting = 'Settings';
  static const String becomeTutor = 'Become A Tutor';
  static const String account = 'Edit Account';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case baseScreen:
        return successRoute(const BaseScreen(), settings);
      case tutors:
        return successRoute(const TutorListScreen(), settings);
      case courses:
        return successRoute(const CourseListScreen(), settings);
      case learningHistory:
        return successRoute(const HistoryScreen(), settings);
      case schedule:
        return successRoute(const ScheduleScreen(), settings);
      case setting:
        return successRoute(const SettingsScreen(), settings);
      default:
        return successRoute(const TutorListScreen(), settings);
    }
  }

  static Route<dynamic> errorRoute(String errorMsg, RouteSettings settings) {
    print('Error: $errorMsg');
    return MaterialPageRoute(
        settings: settings,
        builder: (_) => ErrorPage(
              screenName: settings.name,
            ));
  }

  static PageRouteBuilder successRoute(Widget w, RouteSettings settings) {
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => w,
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (_, a, __, c) => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(a),
              child: c,
            ));
  }
}
