import 'package:flutter/material.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';

class CircleIconWidget extends StatelessWidget {
  Widget child;
  Color backgroundColor;
  Color borderColor;
  double width;
  double? padding;
  Function? onTap;

  CircleIconWidget(
      {Key? key,
      required this.child,
      this.backgroundColor = whiteColor,
      this.borderColor = primaryColor,
      this.padding,
      this.onTap,
      this.width = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 40.w,
        width: 40.w,
        padding: padding == null ? null : EdgeInsets.all(padding!),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            border: Border.all(color: borderColor, width: width)),
        child: ClipRRect(
          child: child,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
