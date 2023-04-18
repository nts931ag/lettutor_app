// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/widgets/commons/box_shadow_container.dart';
import 'package:lettutor_app/presentation/widgets/commons/course_item.dart';
import 'package:lettutor_app/presentation/widgets/commons/tab_bar/tab_bar_item.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TabBarview extends StatelessWidget {
  TabBarview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TabBarItem(
              // onTap: () {
              //   controller.onTapInDexTabBar(0);
              // },
              // title: LocalString.course,
              // isSelecting: 0 == controller.index.value,
              title: AppLocalizations.of(context)!.course,
              isSelecting: true,
            ),
            SizedBox(width: 20.w),
            TabBarItem(
              // onTap: () {
              //   controller.onTapInDexTabBar(1);
              // },
              // title: LocalString.eBook,
              // isSelecting: 1 == controller.index.value,
              title: AppLocalizations.of(context)!.e_book,
              isSelecting: true,
            ),
            SizedBox(width: 20.w),
            TabBarItem(
              // onTap: () {
              //   controller.onTapInDexTabBar(2);
              // },
              // title: LocalString.ieBook,
              // isSelecting: 2 == controller.index.value,
              title: AppLocalizations.of(context)!.i_e_book,
              isSelecting: true,
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'EngLish For Traveling',
              style: text26,
            ),
            SizedBox(
              height: 20.h,
            ),
            BoxShadowContainer(
              onTap: () {
                // TODO: Navigation to COURSE OVERALL SCREEN
                // Get.toNamed(AppRoutes.COURSE_DETAIL);
              },
              width: 280.w,
              padding: EdgeInsets.only(bottom: 20.h),
              child: CourseItem(
                mainTitle: 'Life in the Internet Age',
                subTitle:
                    'Lets discuss how technology is changing the way we live',
                bottomWidget: Text(
                  'Intermediate 9 lessons',
                  style: text14,
                ),
                image: Assets.images.imgCourse1.image(fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            BoxShadowContainer(
              onTap: () {
                // TODO: Navigation to COURSE OVERALL SCREEN
                // Get.toNamed(AppRoutes.COURSE_DETAIL);
              },
              width: 280.w,
              padding: EdgeInsets.only(bottom: 20.h),
              child: CourseItem(
                mainTitle: 'Life in the Internet Age',
                subTitle:
                    'Lets discuss how technology is changing the way we live',
                bottomWidget: Text(
                  'Intermediate 9 lessons',
                  style: text14,
                ),
                image: Assets.images.imgCourse2.image(fit: BoxFit.cover),
              ),
            ),
          ],
        )
      ],
    );
  }
}
