// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';


class HeaderItem extends StatelessWidget {
  Widget img;
  String upperContent;
  String lowerContent;
  String lowerSubContent;
  HeaderItem({
    Key? key,
    required this.img,
    required this.upperContent,
    required this.lowerContent,
    required this.lowerSubContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        img,
        SizedBox(
          height: 5.h,
        ),
        Text(
          upperContent,
          style: text28.copyWith(fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          children: [
            Container(
              width: 5.w,
              height: 120.h,
              color: Colors.grey.withOpacity(0.5),
            ),
            SizedBox(
              width: 3.w,
            ),
            SizedBox(
              width: Get.width - 50.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width - 50.w,
                    child: Text(
                      lowerContent,
                      style: text16.copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    width: Get.width - 50.w,
                    child: Text(
                      lowerSubContent,
                      style: text16.copyWith(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
