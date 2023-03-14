import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_screen.dart';
import 'package:lettutor_app/presentation/common/widgets/box_shadow_container.dart';
import 'package:lettutor_app/presentation/common/widgets/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/course_item.dart';
import 'package:lettutor_app/presentation/course_detail/screen/course_detail_screen.dart';
import 'package:lettutor_app/presentation/course_list/screen/course_list_controller.dart';
import 'package:lettutor_app/presentation/pdf_reader/screen/pdf_reader_screen.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';

class CourseScreen extends BaseScreen<CourseListController> {
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
                bottomWidget: SectionCourseDetail(
                  title: LocalString.courseDetailTopics,
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
