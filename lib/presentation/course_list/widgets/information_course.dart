// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/common/widgets/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/presentation/course_list/widgets/header_course.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

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
          LocalString.courseContent,
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
                      hintText: LocalString.courseLevel,
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
                      hintText: LocalString.courseSortlv,
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
                  hintText: LocalString.courseCategory,
                  icon: const Icon(Icons.expand_more)),
            ),
          ],
        )
      ],
    );
  }
}