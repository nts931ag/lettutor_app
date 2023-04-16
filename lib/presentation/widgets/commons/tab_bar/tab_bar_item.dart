// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';


class TabBarItem extends StatelessWidget {
  String title;
  bool isSelecting;
  Function()? onTap;
  TabBarItem({
    Key? key,
    required this.title,
    required this.isSelecting,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: SizedBox(
        height: 30.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: text15.copyWith(color: isSelecting ? primaryColor : null),
            ),
            Container(
              height: 2.0.h,
              width: 45.w,
              color: isSelecting ? primaryColor : null,
            )
          ],
        ),
      ),
    );
  }
}
