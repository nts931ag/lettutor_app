import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lettutor_app/constant/const_value.dart';
import 'package:lettutor_app/providers/bottom_bar_provider.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/routes/router.dart';
import 'package:lettutor_app/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class BottomBarCustomWidget extends StatelessWidget {
  const BottomBarCustomWidget(
      {Key? key, required this.selectedIndex, required this.context})
      : super(key: key);
  final int selectedIndex;
  final BuildContext context;

  void _onItemTapped(int index) {
    switch (index) {
      case NavigationIndex.tutorListScreen:
        pushNamedAndRemoveUntilHome(context, newRoute: MyRouter.tutors);
        break;
      case NavigationIndex.courseListScreen:
        pushNamedAndRemoveUntilHome(context, newRoute: MyRouter.courses);
        break;
      case NavigationIndex.scheduleScreen:
        pushNamedAndRemoveUntilHome(context, newRoute: MyRouter.schedule);
        break;
      case NavigationIndex.historyScreen:
        pushNamedAndRemoveUntilHome(context,
            newRoute: MyRouter.learningHistory);
        break;
      case NavigationIndex.settingsScreen:
        pushNamedAndRemoveUntilHome(context,
            newRoute: MyRouter.setting);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomBarProvider = Provider.of<BottomBarProvider>(
      context,
    );
    return SalomonBottomBar(
      currentIndex: selectedIndex,
      onTap: _onItemTapped,
      items: [
        SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.users,
              size: 16.w,
            ),
            title: Text(AppLocalizations.of(context)!.bottom_bar_tutors)),
        SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.book,
              size: 16.w,
            ),
            title: Text(AppLocalizations.of(context)!.bottom_bar_courses)),
        SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.calendarDays,
              size: 16.w,
            ),
            title: Text(AppLocalizations.of(context)!.bottom_bar_schedule)),
        SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.history,
              size: 16.w,
            ),
            title: Text(AppLocalizations.of(context)!.bottom_bar_history)),
        SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.gears,
              size: 16.w,
            ),
            title: Text(AppLocalizations.of(context)!.bottom_bar_settings))
      ],
      margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
      selectedItemColor: blueColor,
      unselectedItemColor: blueColor.withOpacity(0.2),
    );
  }
}
