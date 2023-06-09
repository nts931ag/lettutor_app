// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:lettutor_app/domain/models/Password.dart';
import 'package:lettutor_app/presentation/cubits/authentication/login_cubit.dart';
import 'package:lettutor_app/presentation/widgets/authentication/login_title_area_widget.dart';
import 'package:lettutor_app/presentation/widgets/authentication/sign_up_area_widget.dart';
import 'package:lettutor_app/presentation/widgets/base/base_scaffold_custom_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/icon/circle_icon_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/utils/resource/gen/colors.gen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<LoginCubit>(context)
    //     .onUsernameChanged('student@lettutor.com');
    // BlocProvider.of<LoginCubit>(context).onPasswordChanged('123456');
    // BlocProvider.of<LoginCubit>(context).loginManually();
    return SafeArea(
      child: BaseScaffoldWidgetCustom(
        resizeToAvoidBottomInset: true,
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
                      height: 25.h,
                    ),
                    /*InputFieldArea(
                      // TODO: controller to login
                      // loginController: controller,
                    ),*/
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
                          errorText: state.username.isPure
                              ? null
                              : state.username.getMessageError(),
                          textInputType: TextInputType.emailAddress,
                          controller: BlocProvider.of<LoginCubit>(context)
                              .emailTextController,
                          hintText: 'email@example.com',
                        );
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
                            controller: BlocProvider.of<LoginCubit>(context)
                                .passwordTextController,
                            isObscure: true,
                            errorText: state.password.isPure
                                ? null
                                : state.password.getMessageError(),
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
                      onTap: () {},
                      child: Text(
                        AppLocalizations.of(context)!.forgot_password,
                        style: text14.copyWith(
                            color: const Color.fromRGBO(40, 106, 210, 1)),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      buildWhen: (pre, cur) =>
                          pre.authenticationType != cur.authenticationType,
                      builder: (context, state) {
                        return LoadingButtonWidget(
                            submit: () {
                              // TODO: Navigation to DASHBOARD
                              final cubit =
                                  BlocProvider.of<LoginCubit>(context);
                              state.authenticationType ==
                                      AuthenticationType.Login
                                  ? cubit.loginManually()
                                  : cubit.registerManually();
                            },
                            isLoading: false,
                            // TODO: Navigation to DASHBOARD
                            label: state.authenticationType ==
                                    AuthenticationType.Login
                                ? AppLocalizations.of(context)!.login
                                : AppLocalizations.of(context)!.sign_up);
                      },
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    /*SignUpArea(
                        // TODO: Controller to signup
                        // loginController: controller,
                        )*/
                    Center(
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
                          BlocBuilder<LoginCubit, LoginState>(
                            buildWhen: (pre, cur) =>
                                pre.authenticationType !=
                                cur.authenticationType,
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    BlocProvider.of<LoginCubit>(context)
                                                .state
                                                .authenticationType !=
                                            AuthenticationType.Signup
                                        ? AppLocalizations.of(context)!
                                            .login_not_member
                                        : AppLocalizations.of(context)!
                                            .login_already_have_account,
                                    style: text14,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      final cubit =
                                          BlocProvider.of<LoginCubit>(context);
                                      cubit.onTypeAuthenticationChanged(
                                          cubit.state.authenticationType ==
                                                  AuthenticationType.Login
                                              ? AuthenticationType.Signup
                                              : AuthenticationType.Login);
                                    },
                                    child: Text(
                                      BlocProvider.of<LoginCubit>(context)
                                                  .state
                                                  .authenticationType !=
                                              AuthenticationType.Signup
                                          ? AppLocalizations.of(context)!
                                              .sign_up
                                          : AppLocalizations.of(context)!.login,
                                      style: text14.copyWith(
                                          color: ColorName.primaryColor),
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
