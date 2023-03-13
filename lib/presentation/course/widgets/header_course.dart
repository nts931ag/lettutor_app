import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/common/widgets/icon/circle_box_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';


class HeaderCourse extends StatelessWidget {
  const HeaderCourse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleBox(
            size: 110.w, child: Assets.svg.course.iconCourse.svg()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              LocalString.courseTitle,
              style: text26.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              width: 200.w,
              child: baseTextField(
                  onChanged: (value) {},
                  controller: null,
                  hintText: 'Course',
                  icon: Icon(
                    Icons.search,
                    size: 15.w,
                  )),
            )
          ],
        )
      ],
    );
  }
}