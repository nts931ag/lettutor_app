// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/colors.gen.dart';


class BoxShadowContainer extends StatelessWidget {
  Widget child;
  EdgeInsetsGeometry? padding;
  BorderRadiusGeometry? borderRadius;
  Color? borderColor;
  double width;

  Function()? onTap;
  BoxShadowContainer({
    Key? key,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.onTap,
    required this.width,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width,
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          padding: padding ?? EdgeInsets.only(bottom: 20.h),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
              borderRadius: borderRadius ?? BorderRadius.circular(20.r),
              border: Border.all(color: borderColor ?? ColorName.greyColor)),
          child: child),
    );
  }
}
