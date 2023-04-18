// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/commons/widgets/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/presentation/widgets/course_list/header_course.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';

class InformationCourse extends StatelessWidget {
  const InformationCourse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderCourse(),
        SizedBox(
          height: 20.h,
        ),
        Text(
          AppLocalizations.of(context)!.course_content,
          style: text15,
        ),
        SizedBox(
          height: 14.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  width: Get.width / 2 - 25.w,
                  child: baseTextField(
                      onChanged: (value) {},
                      controller: null,
                      hintText: AppLocalizations.of(context)!.course_level,
                      icon: const Icon(Icons.expand_more)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: Get.width / 2 - 25.w,
                  child: baseTextField(
                      onChanged: (value) {},
                      controller: null,
                      hintText: AppLocalizations.of(context)!.course_sort_lv,
                      icon: const Icon(Icons.expand_more)),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: Get.width / 2 - 25.w,
              child: baseTextField(
                  onChanged: (value) {},
                  controller: null,
                  hintText: AppLocalizations.of(context)!.course_category,
                  icon: const Icon(Icons.expand_more)),
            ),
          ],
        )
      ],
    );
  }
}
