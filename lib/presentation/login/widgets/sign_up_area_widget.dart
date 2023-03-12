import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/common/widgets/icon/circle_icon_widget.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';
import 'package:lettutor_app/res/gen/colors.gen.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class SignUpArea extends StatelessWidget {
  const SignUpArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            LocalString.loginContinueWith,
            style: text16,
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleIconWidget(
                borderColor: ColorName.primaryColor,
                child: Assets.svg.login.iconFacebook.svg(),
              ),
              SizedBox(
                width: 15.w,
              ),
              CircleIconWidget(
                borderColor: ColorName.primaryColor,
                child: Assets.svg.login.iconGoogle.svg(),
              ),
              SizedBox(
                width: 15.w,
              ),
              CircleIconWidget(
                borderColor: ColorName.primaryColor,
                backgroundColor: Colors.white,
                width: 1.0.r,
                child: const Icon(Icons.smartphone),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocalString.loginNotAMember,
                style: text14,
              ),
              SizedBox(
                width: 1.w,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  LocalString.signUp,
                  style: text14.copyWith(color: ColorName.primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
