// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/colors.gen.dart';


class BoxShadowContainer extends StatelessWidget {
  Widget child;
  EdgeInsetsGeometry? padding;
  BorderRadiusGeometry? borderRadius;
  Color? borderColor;
  double width;
  BoxShadowContainer({
    Key? key,
    required this.child,
    required this.width,
    this.padding,
    this.borderRadius,
    this.borderColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        padding: padding ?? EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 4, 
              ),
            ],
            borderRadius: borderRadius ?? BorderRadius.circular(20.r),
            border: Border.all(color: borderColor ?? ColorName.greyColor)),
        child: child);
  }
}
