import 'package:flutter/material.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/colors.gen.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';

class TextContainer extends StatelessWidget {
  String title;
  double? radius;
  Color? color;
  Color? borderColor;
  Color? textColor;

  TextContainer({
    Key? key,
    required this.title,
    this.radius,
    this.color,
    this.borderColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0.w, horizontal: 10.w),
      decoration: BoxDecoration(
          color: color ?? ColorName.greyColor,
          border:
          Border.all(color: borderColor ?? color ?? ColorName.greyColor),
          borderRadius: BorderRadius.circular(radius ?? 10.0.r)),
      child: Text(
        title,
        style: text12.copyWith(color: textColor),
      ),
    );
  }
}
