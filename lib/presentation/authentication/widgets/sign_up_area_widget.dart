import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/commons/widgets/icon/circle_icon_widget.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';
import 'package:lettutor_app/utils/resource//gen/colors.gen.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpArea extends StatelessWidget {
  SignUpArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.login_continue,
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
                AppLocalizations.of(context)!.login_not_member,
                style: text14,
              ),
              SizedBox(
                width: 1.w,
              ),
              InkWell(
                onTap: () {
                  // TODO: Navigation to changeLogin();
                  // loginController.changeLogin();
                },
                child: Text(
                  "Login",
                  // TODO: Navigation to changeLogin
                  // loginController.isLogin.value
                  //     ? AppLocalizations.of(context)!.sign_up
                  //     : AppLocalizations.of(context)!.login,
                  style: text14.copyWith(color: ColorName.primaryColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
