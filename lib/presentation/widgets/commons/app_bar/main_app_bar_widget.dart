import 'package:flutter/material.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    required this.actions,
    required this.isHaveTrailing,
  }) : super(key: key);

  final List<Widget> actions;
  final bool isHaveTrailing;

  @override
  Size get preferredSize => Size.fromHeight(80.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5.r,
            blurRadius: 7.r,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (isHaveTrailing)
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        Container(
            height: 40.h,
            width: 170.w,
            color: Colors.white,
            child: Assets.svg.app.logoApp.svg(height: 40.h, width: 170.w)),
        const Spacer(),
        ...actions
      ]),
    );
  }
}
