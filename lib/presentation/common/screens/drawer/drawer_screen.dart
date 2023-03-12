// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/app/app_pages.dart';
import 'package:lettutor_app/presentation/common/widgets/icon/circle_box_widget.dart';
import 'package:lettutor_app/res/colors/colors_core.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 250.h,
      padding: EdgeInsets.only(top: 20.h),
      child:
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
          onTap: () {
            Get.offNamed(AppRoutes.PROFILE);
          },
          child: Row(
            children: [
              CircleBox(size: 25, child: Assets.images.img.image()),
              SizedBox(
                width: 15.w,
              ),
              Text(
                'Long Long',
                style: text18.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        listTitle(
            iconData: Icons.book,
            title: LocalString.drawerBuyLessons,
            named: ''),
        listTitle(
            iconData: Icons.key,
            title: LocalString.drawerChangePassword,
            named: AppRoutes.CHANGE_PASSWORD),
        listTitle(
            iconData: Icons.contacts,
            title: LocalString.drawerTutor,
            named: AppRoutes.DASHBOARD),
        listTitle(
            iconData: Icons.event_available,
            title: LocalString.drawerSchedule,
            named: ''),
        listTitle(
            iconData: Icons.history,
            title: LocalString.drawerHistory,
            named: ''),
        listTitle(
            iconData: Icons.school,
            title: LocalString.drawerCourses,
            named: ''),
        listTitle(
            iconData: Icons.import_contacts,
            title: LocalString.drawerMyCourse,
            named: ''),
        listTitle(
            iconData: Icons.hail,
            title: LocalString.drawerBecomeAtutor,
            named: ''),
        listTitle(iconData: Icons.logout, title: LocalString.logout, named: ''),
      ]),
    );
  }

  Widget listTitle(
      {required IconData iconData,
        required String title,
        required String named}) {
    return InkWell(
      onTap: () {
        Get.offNamed(named);
      },
      child: Row(
        children: [
          Icon(
            iconData,
            color: primaryColor,
            size: 25,
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            title,
            style: text18.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

}
