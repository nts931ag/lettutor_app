import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/commons/widgets/box_shadow_container.dart';
import 'package:lettutor_app/presentation/commons/widgets/course_item.dart';
import 'package:lettutor_app/presentation/course_overall/screen/course_detail_screen.dart';
import 'package:lettutor_app/presentation/pdf_reader/screen/pdf_reader_screen.dart';
import 'package:lettutor_app/resource/dimens.dart';
import 'package:lettutor_app/resource/gen/assets.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                bottomWidget: SectionCourseOverall(
                  title: AppLocalizations.of(context)!.course_detail_topics,
                  children: [
                    ListTile(
                      leading: Text('1'),
                      title: Text('Topic 1'),
                    ),
                    ListTile(
                      leading: Text('2'),
                      title: Text('Topic 2'),
                    ),
                    ListTile(
                      leading: Text('3'),
                      title: Text('Topic 3'),
                    ),
                    ListTile(
                      leading: Text('4'),
                      title: Text('Topic 4'),
                    ),
                    ListTile(
                      leading: Text('5'),
                      title: Text('Topic 5'),
                    ),
                  ],
                ),
                image: Assets.images.imgCourse1.image(fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          PdfReaderScreen(),
        ],
      ),
    );
  }
}
