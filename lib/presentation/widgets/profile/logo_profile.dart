import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/widgets/commons/icon/circle_box_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/icon/circle_icon_widget.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';

class LogoProfile extends StatelessWidget {
  const LogoProfile({
    Key? key,
    this.url,
  }) : super(key: key);

  final url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleBox(
          size: 130.w,
          child: Image.network(
            url,
            errorBuilder: (context, exception, stackTrace) {
              return Assets.images.img.image(fit: BoxFit.cover);
            },
          ),
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
