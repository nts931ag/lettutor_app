import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/common/widgets/icon/circle_box_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/icon/circle_icon_widget.dart';
import 'package:lettutor_app/res/colors/colors_core.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';

class LogoProfile extends StatelessWidget {
  const LogoProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleBox(
          size: 130.w,
          child: Assets.images.img.image(fit: BoxFit.cover),
        ),
        Positioned(
          left: 90.w,
          top: 85.w,
          child: CircleIconWidget(
            backgroundColor: primaryColor,
            child: Icon(
              Icons.edit,
              size: 20.w,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}