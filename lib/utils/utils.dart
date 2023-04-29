import 'package:flutter/material.dart';
import 'package:lettutor_app/config/router/router.dart';
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

String timeUntil(DateTime date) {
  return timeago.format(date, locale: 'vi', allowFromNow: true);
}
