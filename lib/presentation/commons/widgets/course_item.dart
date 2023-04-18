import 'package:flutter/material.dart';
import 'package:lettutor_app/resource/dimens.dart';
import 'package:lettutor_app/resource/theme/text_theme.dart';

class CourseItem extends StatelessWidget {
  Widget image;
  String mainTitle;
  String subTitle;
  Widget bottomWidget;
  CourseItem({
    Key? key,
    required this.image,
    required this.mainTitle,
    required this.subTitle,
    required this.bottomWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        image,
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainTitle,
                style: text16.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                subTitle,
                style: text14.copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: 15.h,
              ),
              bottomWidget,
            ],
          ),
        )
      ],
    );
  }
}
