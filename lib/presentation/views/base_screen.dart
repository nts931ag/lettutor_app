import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lettutor_app/presentation/views/course_list_screen.dart';
import 'package:lettutor_app/presentation/views/history_screen.dart';
import 'package:lettutor_app/presentation/views/schedule_screen.dart';
import 'package:lettutor_app/presentation/views/settings_screen.dart';
import 'package:lettutor_app/presentation/views/tutor_list_screen.dart';
import 'package:lettutor_app/presentation/widgets/base/base_scaffold_custom_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/icon/circle_icon_widget.dart';
import 'package:lettutor_app/providers/bottom_bar_provider.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';
import 'package:lettutor_app/utils/resource/gen/colors.gen.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    final bottomBarProvider = Provider.of<BottomBarProvider>(
      context,
    );
    // return Scaffold(
    //   backgroundColor: whiteColor,
    //   body: IndexedStack(
    //     index: bottomBarProvider.selectedIndex,
    //     children: [
    //       TutorListScreen(),
    //       CourseListScreen(),
    //       ScheduleScreen(),
    //       HistoryScreen(),
    //       SettingsScreen(),
    //     ],
    //   ),
    //   bottomNavigationBar: SalomonBottomBar(
    //     currentIndex: bottomBarProvider.selectedIndex,
    //     onTap: (i) {
    //       bottomBarProvider.selectedIndex = i;
    //     },
    //     items: [
    //       SalomonBottomBarItem(
    //           icon: Icon(
    //             FontAwesomeIcons.users,
    //             size: 16.w,
    //           ),
    //           title: Text(AppLocalizations.of(context)!.bottom_bar_tutors)),
    //       SalomonBottomBarItem(
    //           icon: Icon(
    //             FontAwesomeIcons.book,
    //             size: 16.w,
    //           ),
    //           title: Text(AppLocalizations.of(context)!.bottom_bar_courses)),
    //       SalomonBottomBarItem(
    //           icon: Icon(
    //             FontAwesomeIcons.calendarDays,
    //             size: 16.w,
    //           ),
    //           title: Text(AppLocalizations.of(context)!.bottom_bar_schedule)),
    //       SalomonBottomBarItem(
    //           icon: Icon(
    //             FontAwesomeIcons.history,
    //             size: 16.w,
    //           ),
    //           title: Text(AppLocalizations.of(context)!.bottom_bar_history)),
    //       SalomonBottomBarItem(
    //           icon: Icon(
    //             FontAwesomeIcons.gears,
    //             size: 16.w,
    //           ),
    //           title: Text(AppLocalizations.of(context)!.bottom_bar_settings))
    //     ],
    //     margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
    //     selectedItemColor: blueColor,
    //     unselectedItemColor: blueColor.withOpacity(0.2),
    //   ),
    // );
    return BaseScaffoldWidgetCustom(
      resizeToAvoidBottomInset: true,
      actions: [
        circleIconNation(),
        // if (controller.isHaveDrawer)
        //   SizedBox(
        //     width: 15.w,
        //   ),
        // if (controller.isHaveDrawer)
        //   CircleIconWidget(
        //     backgroundColor: ColorName.disabledColor,
        //     borderColor: ColorName.disabledColor,
        //     padding: 10.w,
        //     onTap: () {
        //       controller.handleOnTapDrawer();
        //     },
        //     child: Icon(
        //       Icons.list,
        //       size: 20.w,
        //     ),
        //   )
      ],
      body: IndexedStack(
        index: bottomBarProvider.selectedIndex,
        children: const [
          TutorListScreen(),
          CourseListScreen(),
          ScheduleScreen(),
          HistoryScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: bottomBarProvider.selectedIndex,
        onTap: (i) {
          bottomBarProvider.selectedIndex = i;
        },
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
      ),
    );
  }

  CircleIconWidget circleIconNation() {
    // return ((controller.locale.value?.languageCode ??
    //     LocalizationService.EN_US) !=
    //     LocalizationService.EN_US)
    //     ? CircleIconWidget(
    //   backgroundColor: ColorName.disabledColor,
    //   borderColor: ColorName.disabledColor,
    //   padding: 10.w,
    //   onTap: () {
    //     controller.changeNation(LocalizationService.EN_US);
    //   },
    //   child: Assets.svg.common.iconVn.svg(),
    // )
    //     : CircleIconWidget(
    //   backgroundColor: ColorName.disabledColor,
    //   borderColor: ColorName.disabledColor,
    //   padding: 10.w,
    //   onTap: () {
    //     controller.changeNation(LocalizationService.VI_VN);
    //   },
    //   child: Assets.svg.common.iconUs.svg(),
    // );

    return CircleIconWidget(
      backgroundColor: ColorName.disabledColor,
      borderColor: ColorName.disabledColor,
      padding: 10.w,
      onTap: () {
        // TODO: action to change language.
        // controller.changeNation(LocalizationService.EN_US);
      },
      child: Assets.svg.common.iconVn.svg(),
    );
  }
}
