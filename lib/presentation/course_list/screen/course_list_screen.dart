// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/course_list/widgets/information_course.dart';
import 'package:lettutor_app/presentation/course_list/widgets/tab_bar_view.dart';
import 'package:lettutor_app/resource/dimens.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          TabBarview(),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
