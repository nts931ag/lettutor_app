// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';


class IconText extends StatelessWidget {
  String title;
  IconData iconData;
  Color? colorIcon;
  Color? colorText;
  IconText({
    Key? key,
    required this.title,
    required this.iconData,
    this.colorIcon,
    this.colorText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 30,
          color: colorIcon??primaryColor,
        ),
        Text(
          title,
          style: text16.copyWith(color: colorText ?? primaryColor),
        )
      ],
    );
  }
}
