import 'package:flutter/material.dart';
import 'package:lettutor_app/resource/colors/colors_core.dart';
import 'package:lettutor_app/resource/dimens.dart';
import 'package:lettutor_app/resource/theme/text_theme.dart';

class TextWithLink extends StatelessWidget {
  String title;
  Function onTap;
  TextWithLink({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        title,
        style: text16.copyWith(fontWeight: FontWeight.w600),
      ),
      SizedBox(
        width: 10.w,
      ),
      InkWell(
        onTap: () {
          onTap;
        },
        child: Text(
          'Link',
          style: text14.copyWith(color: primaryColor),
        ),
      ),
    ]);
  }
}
