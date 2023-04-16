import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/commons/widgets/text_field/label_english_type_widget.dart';
import 'package:lettutor_app/resource/colors/colors_core.dart';
import 'package:lettutor_app/resource/dimens.dart';

class WantToLearnWrap extends StatelessWidget {
  const WantToLearnWrap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0.r),
          border: Border.all(
            color: greyBorderColor,
          )),
      child: Wrap(spacing: 5.0.w, runSpacing: 5.0.w, children: [
        LabelEnglishTypeWidget(
          content: 'Business English',
        ),
        LabelEnglishTypeWidget(
          content: 'Conversational English',
        ),
      ]),
    );
  }
}
