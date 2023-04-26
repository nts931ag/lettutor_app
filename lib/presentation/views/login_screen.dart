// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:lettutor_app/presentation/cubits/authentication/login_cubit.dart';
import 'package:lettutor_app/presentation/widgets/authentication/login_title_area_widget.dart';
import 'package:lettutor_app/presentation/widgets/authentication/sign_up_area_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 35.h,
            ),
            Assets.images.imageLogin.image(),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 35.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoginTitleArea(),
                  SizedBox(
                    height: 15.h,
                  ),
                  /*InputFieldArea(
                    // TODO: controller to login
                    // loginController: controller,
                  ),*/
                  Column(
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
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (pre, cur) => pre.username != cur.username,
                        builder: (context, state) {
                          return BaseTextField(
                              onChanged: (value) {
                                BlocProvider.of<LoginCubit>(context)
                                    .onUsernameChanged(value);
                              },
                              controller: null,
                              hintText: 'email@example.com');
                        },
                      ),
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
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (pre, cur) => pre.password != cur.password,
                        builder: (context, state) {
                          return BaseTextField(
                              onChanged: (value) {
                                BlocProvider.of<LoginCubit>(context)
                                    .onPasswordChanged(value);
                              },
                              controller: null,
                              hintText: '',
                              icon: InkWell(
                                onTap: () {},
                                child: const Icon(Icons.visibility, size: 20),
                              ));
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          // TODO: Navigation to FORGOT PASSWORD
                          log("hello");
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgot_password,
                          style: text14.copyWith(
                              color: const Color.fromRGBO(40, 106, 210, 1)),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      LoadingButtonWidget(
                          submit: () {
                            // TODO: Navigation to DASHBOARD
                            BlocProvider.of<LoginCubit>(context).loginMannually(
                                email: "email", password: "password");
                          },
                          isLoading: false,
                          // TODO: Navigation to DASHBOARD
                          label: /*loginController.isLogin.value*/ true
                              ? AppLocalizations.of(context)!.login
                              : AppLocalizations.of(context)!.sign_up),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SignUpArea(
                      // TODO: Controller to signup
                      // loginController: controller,
                      )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
