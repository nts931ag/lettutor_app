import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/resource/colors/colors_core.dart';
import 'package:lettutor_app/resource/dimens.dart';
import 'package:lettutor_app/resource/theme/text_theme.dart';


class OverViewTitle extends StatelessWidget {
  String title;
  String content;
  OverViewTitle({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.help,
          color: primaryColor,
        ),
        SizedBox(
          width: 5.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: text16.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: Get.width - 20.w - 50.w,
              child: Text(
                content,
                style: text13,
              ),
            ),
          ],
        )
      ],
    );
  }
}