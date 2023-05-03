// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/domain/models/Course.dart';
import 'package:lettutor_app/presentation/widgets/base/base_scaffold_custom_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/box_shadow_container.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/course_item.dart';
import 'package:lettutor_app/presentation/widgets/course_overall/overview_title.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';

class CourseOverallScreen extends StatelessWidget {
  const CourseOverallScreen({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BaseScaffoldWidgetCustom(
        body: SingleChildScrollView(
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
                    mainTitle: course.name,
                    subTitle: course.description,
                    bottomWidget: LoadingButtonWidget(
                        submit: () {
                          // TODO: Navigation to discovery course
                          // Get.toNamed(AppRoutes.DISCOVERY_COURSE);
                        },
                        isLoading: false,
                        label:
                            AppLocalizations.of(context)!.course_detail_discover),
                    image: Image.network(
                      course.imageUrl,
                      errorBuilder: (context, exception, stackTrace) {
                        return Assets.images.imgCourse1.image(fit: BoxFit.cover);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SectionCourseOverall(
                title: AppLocalizations.of(context)!.overview,
                children: [
                  OverViewTitle(
                      title: 'Why take this course', content: course.reason),
                  SizedBox(
                    height: 10.h,
                  ),
                  OverViewTitle(
                    title: 'What will you be able to do',
                    content: course.purpose
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              SectionCourseOverall(
                title: AppLocalizations.of(context)!.course_detail_ex_lv,
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
              SectionCourseOverall(
                title: AppLocalizations.of(context)!.course_detail_len,
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
                        course.topics!.length.toString(),
                        style: text15.copyWith(fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
              SectionCourseOverall(
                title: AppLocalizations.of(context)!.course_detail_topics,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                    child: Wrap(
                      spacing: 6.w,
                      runSpacing: 5.w,
                      children: [
                        ...course.topics!.map((e) => BoxShadowContainer(
                              borderRadius: BorderRadius.circular(3.r),
                              width: MediaQuery.of(context).size.width / 2 - 28.w,
                              child: Column(
                                children: [
                                  Text(
                                    e.name,
                                    style: text14.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor),
                                  ),
                                  Text(
                                    1.toString(),
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
        ),
      ),
    );
  }
}

class SectionCourseOverall extends StatelessWidget {
  String title;
  List<Widget> children;

  SectionCourseOverall({
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
