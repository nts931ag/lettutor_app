import 'package:flutter/material.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class LoginTitleArea extends StatelessWidget {
  const LoginTitleArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0.w),
          child: Text(
            LocalString.loginTitle,
            style: text28.copyWith(
                color: const Color.fromRGBO(0, 113, 240, 1),
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          LocalString.loginSubTitle,
          style: text16.copyWith(
              color: const Color.fromRGBO(42, 52, 83, 1),
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
