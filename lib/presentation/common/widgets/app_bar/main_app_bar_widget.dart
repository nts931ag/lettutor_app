import 'package:flutter/material.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MainAppBar({
    Key? key,
    required this.actions,
  }) : super(key: key);

  final List<Widget> actions;

  @override
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        top: 30.h,
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 39.h,
                width: 170.w,
                color: Colors.white,
                child: Assets.svg.app.logoApp.svg(height: 39.h, width: 170.w)),
            ...actions
          ]),
    );
  }

}
