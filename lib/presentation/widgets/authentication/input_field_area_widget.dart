import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';

class InputFieldArea extends StatelessWidget {
  InputFieldArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Text(
          AppLocalizations.of(context)!.email_title,
          style: text14.copyWith(color: greyColor),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 8.h,
        ),
        baseTextField(
            onChanged: (value) {},
            controller: null,
            hintText: 'email@example.com'),
        SizedBox(
          height: 15.h,
        ),
        Text(
          AppLocalizations.of(context)!.password_title,
          style: text14.copyWith(color: greyColor),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 8.h,
        ),
        baseTextField(
            onChanged: (value) {},
            controller: null,
            hintText: '',
            icon: InkWell(
              onTap: () {},
              child: const Icon(Icons.visibility, size: 20),
            )),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {
            // TODO: Navigation to FORGOT PASSWORD
          },
          child: Text(
            AppLocalizations.of(context)!.forgot_password,
            style:
                text14.copyWith(color: const Color.fromRGBO(40, 106, 210, 1)),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        LoadingButtonWidget(
            submit: () {
              // TODO: Navigation to DASHBOARD
            },
            isLoading: false,
            // TODO: Navigation to DASHBOARD
            label: /*loginController.isLogin.value*/ true
                ? AppLocalizations.of(context)!.login
                : AppLocalizations.of(context)!.sign_up),
      ],
    );
  }
}
