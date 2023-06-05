import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/config/router/error_page.dart';
import 'package:lettutor_app/config/router/router_arguments.dart';
import 'package:lettutor_app/presentation/chat/chat_screen.dart';
import 'package:lettutor_app/presentation/chat/providers/chats_provider.dart';
import 'package:lettutor_app/presentation/cubits/tutor/feedback_list_cubit.dart';
import 'package:lettutor_app/presentation/views/base_screen.dart';
import 'package:lettutor_app/presentation/views/booking_screen.dart';
import 'package:lettutor_app/presentation/views/course_list_screen.dart';
import 'package:lettutor_app/presentation/views/course_overall_screen.dart';
import 'package:lettutor_app/presentation/views/history_screen.dart';
import 'package:lettutor_app/presentation/views/meeting_screen.dart';
import 'package:lettutor_app/presentation/views/pdf_reader_screen.dart';
import 'package:lettutor_app/presentation/views/profile_screen.dart';
import 'package:lettutor_app/presentation/views/review_screen.dart';
import 'package:lettutor_app/presentation/views/schedule_screen.dart';
import 'package:lettutor_app/presentation/views/settings_screen.dart';
import 'package:lettutor_app/presentation/views/tutor_detail_screen.dart';
import 'package:lettutor_app/presentation/views/tutor_list_screen.dart';
import 'package:lettutor_app/presentation/widgets/base/base_scaffold_custom_widget.dart';
import 'package:provider/provider.dart';

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
  static const String reviews = 'Review';

  //Schedule
  static const String schedule = 'Schedule';
  static const String learningHistory = 'Learning History';
  static const String analysis = 'Analysis';
  static const String joinMeeting = 'Join Meeting';

  //Settings
  static const String setting = 'Settings';
  static const String becomeTutor = 'Become A Tutor';
  static const String account = 'Edit Account';

  static const String profile = 'profile';
  static const String pdfReader = 'PDF reader';
  static const String booking = "Booking";
  static const String chatGPT = "ChatGPT";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case baseScreen:
        return successRoute(const BaseScreen(), settings);
      case tutorDetail:
        if (args is TutorDetailArguments) {
          return successRoute(
              TutorDetailScreen(
                tutor: args.tutor,
                tutorListCubit: args.tutorListCubit,
                scheduleListCubit: args.scheduleListCubit,
                upcomingScheduleCubit: args.upcomingScheduleCubit,
              ),
              settings);
        } else {
          return errorRoute(
              'Input for Tutor detail page is not TutorDetailArguments',
              settings);
        }
      case tutors:
        return successRoute(const TutorListScreen(), settings);
      case courses:
        return successRoute(const CourseListScreen(), settings);
      case courseDetail:
        if (args is CourseDetailArguments) {
          return successRoute(
              CourseOverallScreen(course: args.course), settings);
        } else {
          return errorRoute(
              'Input for Tutor detail page is not TutorDetailArguments',
              settings);
        }
      case pdfReader:
        if (args is PdfReaderArguments) {
          return successRoute(
              PdfReaderScreen(
                name: args.name,
                nameFile: args.nameFile,
              ),
              settings);
        } else {
          return errorRoute(
              'Input for Tutor detail page is not TutorDetailArguments',
              settings);
        }

      case learningHistory:
        return successRoute(const HistoryScreen(), settings);
      case schedule:
        return successRoute(const ScheduleScreen(), settings);
      case setting:
        return successRoute(const SettingsScreen(), settings);
      case profile:
        return successRoute(const ProfileScreen(), settings);
      case booking:
        if (args is BookingScreenArguments) {
          return successRoute(
              BookingScreen(
                tutorId: args.tutorId,
                scheduleListCubit: args.scheduleListCubit,
                upcomingScheduleCubit: args.upcomingScheduleCubit,
              ),
              settings);
        } else {
          return errorRoute(
              'Input for Tutor detail page is not TutorDetailArguments',
              settings);
        }
      case chatGPT:
        return successRoute(
            ChangeNotifierProvider(
                create: (_) => ChatProvider(), child: const ChatScreen()),
            settings);

      case joinMeeting:
        if (args is MeetingArguments) {
          return successRoute(
              Meeting(studentMeetingLink: args.studentMeetingLink), settings);
        } else {
          return errorRoute(
              'Input for Tutor detail page is not TutorDetailArguments',
              settings);
        }
      case reviews:
        if (args is ReviewsArguments) {
          return successRoute(
              BlocProvider(
                create: (context) => FeedbackListCubit(args.apiRepository)
                  ..getFeedbackTutorWithTutorId(tutorId: args.tutorId),
                child: SafeArea(
                  child: BaseScaffoldWidgetCustom(
                    ishaveTrailing: true,
                    body: ReviewScreen(
                      tutorId: args.tutorId,
                    ),
                  ),
                ),
              ),
              settings);
        } else {
          return errorRoute(
              'Input for Tutor detail page is not TutorDetailArguments',
              settings);
        }
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
