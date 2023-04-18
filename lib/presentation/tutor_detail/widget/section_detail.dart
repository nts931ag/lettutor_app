// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/resource/dimens.dart';
import 'package:lettutor_app/resource/theme/text_theme.dart';


class SectionTutorDetail extends StatelessWidget {
  String title;
  Widget child;
  SectionTutorDetail({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: text18.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0.w),
          child: child,
        )
      ],
    );
  }
}
