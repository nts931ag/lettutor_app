// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_screen.dart';
import 'package:lettutor_app/presentation/common/widgets/box_shadow_container.dart';
import 'package:lettutor_app/presentation/common/widgets/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/course_item.dart';
import 'package:lettutor_app/presentation/course_detail/screen/course_detail_controller.dart';
import 'package:lettutor_app/presentation/course_detail/widgets/overview_title.dart';
import 'package:lettutor_app/res/colors/colors_core.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class CourseDetailScreen extends BaseScreen<CourseDetailController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: BoxShadowContainer(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 20.h),
              child: CourseItem(
                mainTitle: 'Life in the Internet Age',
                subTitle:
                    'Lets discuss how technology is changing the way we live',
                bottomWidget: LoadingButtonWidget(
                    submit: () {},
                    isLoading: false,
                    label: LocalString.courseDetailDiscover),
                image: Assets.images.imgCourse1.image(fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SectionCourseDetail(
            title: LocalString.overview,
            children: [
              OverViewTitle(
                title: 'Why take this course',
                content:
                    'Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.',
              ),
              SizedBox(
                height: 10.h,
              ),
              OverViewTitle(
                title: 'What will you be able to do',
                content:
                    'You will learn vocabulary related to timely topics like remote work, artificial intelligence, online privacy, and more. In addition to discussion questions, you will practice intermediate level speaking tasks such as using data to describe trends.',
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          SectionCourseDetail(
            title: LocalString.courseDetailExlv,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.group_add,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Intermediate',
                    style: text15.copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          SectionCourseDetail(
            title: LocalString.courseDetailCourseLen,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.book,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '9 Topics',
                    style: text15.copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          ),
          SectionCourseDetail(
            title: LocalString.courseDetailCourseLen,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                child: Wrap(
                  spacing: 6.w,
                  runSpacing: 5.w,
                  children: [
                    ...[1, 2, 3, 4].map((e) => BoxShadowContainer(
                          borderRadius: BorderRadius.circular(3.r),
                          width: Get.width / 2 - 28.w,
                          child: Column(
                            children: [
                              Text(
                                e.toString(),
                                style: text14.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor),
                              ),
                              Text(
                                'Artificial Intelligence (AI)',
                                style: text14.copyWith(
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}

class SectionCourseDetail extends StatelessWidget {
  String title;
  List<Widget> children;
  SectionCourseDetail({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: text20.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10.h,
        ),
        ...children
      ],
    );
  }
}
