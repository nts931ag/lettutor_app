// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';


class InformationArea extends StatelessWidget {
  Widget child;
  Widget img;
  String name;
  String nation;
  InformationArea({
    Key? key,
    required this.child,
    required this.img,
    required this.name,
    required this.nation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: text18.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            img,
            SizedBox(width: 5.w),
            Text(
              nation,
              style: text16,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        child
      ],
    );
  }
}
