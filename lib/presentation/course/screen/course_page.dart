// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_screen.dart';
import 'package:lettutor_app/presentation/course/screen/course_controller.dart';
import 'package:lettutor_app/presentation/course/widgets/information_course.dart';
import 'package:lettutor_app/presentation/course/widgets/tab_bar_view.dart';
import 'package:lettutor_app/res/dimens.dart';

class CoursePage extends BaseScreen<CourseController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25.h,
          ),
          const InformationCourse(),
          SizedBox(
            height: 20.h,
          ),
          TabBarview(
            controller: controller,
          ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
