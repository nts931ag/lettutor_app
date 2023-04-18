import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/presentation/commons/widgets/icon/circle_box_widget.dart';
import 'package:lettutor_app/presentation/commons/widgets/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';

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
            size: 80.w, child: Assets.svg.course.iconCourse.svg()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.course_title,
              style: text24.copyWith(fontWeight: FontWeight.w700),
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