import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_app/config/router/router.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:timeago/timeago.dart' as timeago;

void pushNamedAndRemoveUntilHome(BuildContext context, {String? newRoute}) {
  int reachedHome = 0;
  Navigator.pushNamedAndRemoveUntil(context, newRoute ?? MyRouter.tutors,
      (route) {
    if (reachedHome == 1) {
      return true;
    } else {
      if (route.settings.name == MyRouter.tutors) {
        reachedHome++;
        //If want to keep home before this newRoute screen -> newRoute not null
        if (newRoute != null && newRoute != MyRouter.tutors) return true;
      }
      return false;
    }
  });
}

double getMaxLineHeightByLines(BuildContext context, int lines) {
  double textHeight =
      Theme.of(context).textTheme.bodyLarge?.fontSize?.toDouble() ?? 14;
  return textHeight * 1.5 * lines + 16 * 2;
}

String formatMinusFrom2Timestamp(int t1, int t2) {
  var from = DateTime.fromMillisecondsSinceEpoch(t1);
  var to = DateTime.fromMillisecondsSinceEpoch(t2);

  return '${to.difference(from).inMinutes}';
}

String formatHourAndMinuteFromTimestamp(int timestamp) {
  return DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(timestamp));
}

String formatDayOfWeekAndDateFromTimestamp(int timestamp) {
  return DateFormat('EEEE, d MMM, yy')
      .format(DateTime.fromMillisecondsSinceEpoch(timestamp));
}

String timeUntil(DateTime date) {
  return timeago.format(date, locale: 'vi', allowFromNow: true);
}

String formatYearMonthDayFromDateTime(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime);
}

DateTime parseStringToDateTime(String string) {
  return DateFormat('yyyy-MM-dd').parse(string);
}

String formatTotalLessonHour(int minutes) {
  int hour = minutes ~/ 60;
  int minute = minutes - hour * 60;
  return "$hour hours $minute minutes";
}

format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

String formatFullTimeFromSeconds(int value) {
  int h, m, s;

  h = value ~/ 3600;

  m = ((value - h * 3600)) ~/ 60;

  s = value - (h * 3600) - (m * 60);

  return format(Duration(hours: h, minutes: m, seconds: s));
}

TextStyle? headLineSmall(BuildContext context) {
  return Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w500,
      height: 1.5,
      color: primaryColor,
      backgroundColor: primaryColor);
}
