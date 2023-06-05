import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:lettutor_app/domain/models/Password.dart';
import 'package:lettutor_app/domain/models/Username.dart';
import 'package:lettutor_app/domain/models/responses/UserDataResponse.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/presentation/cubits/base/base_cubit.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

import 'auth_cubit.dart';

part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState, UserDataResponse> {
  final ApiRepository _apiRepository;
  final AuthCubit _authCubit;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  LoginCubit(this._apiRepository, this._authCubit)
      : super(
            const LoginInitial(
                username: Username.pure(),
                password: Password.pure(),
                authenticationType: AuthenticationType.Login),
            null);

  void onUsernameChanged(String value) {
    final username = Username.dirty(value);
    emit(LoginInitial(
        username: username,
        password: state.password,
        authenticationType: state.authenticationType));
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    emit(LoginInitial(
        username: state.username,
        password: password,
        authenticationType: state.authenticationType));
  }

  void onTypeAuthenticationChanged(AuthenticationType authenticationType) {
    emailTextController.clear();
    passwordTextController.clear();
    emit(LoginInitial(
        username: const Username.pure(),
        password: const Password.pure(),
        authenticationType: authenticationType));
  }

  Future<void> loginManually() async {
    if (isBusy) return;

    await run(() async {
      if (state.username!.isValid && state.password!.isValid) {
        final response = await _apiRepository.loginManually(
            email: state.username!.value, password: state.password!.value);

        if (response is DataSuccess) {
          final user = response.data!;

          data = user;
          emit(LoginSubmitSuccess(
              username: state.username,
              password: state.password,
              authenticationType: state.authenticationType));
          _authCubit.onSuccessAuthentication(data!.user, data!.tokens!);
        } else if (response is DataFailed) {
          emit(LoginSubmitFailure(
              username: state.username,
              password: state.password,
              authenticationType: state.authenticationType,
              error: response.error));
        }
      }
    });
  }

  Future<void> registerManually() async {
    if (isBusy) return;

    await run(() async {
      if (state.username!.isValid && state.password!.isValid) {
        final response = await _apiRepository.registerAccount(
            email: state.username!.value, password: state.password!.value);

        if (response is DataSuccess) {
          final user = response.data!;

          data = user;
          onTypeAuthenticationChanged(AuthenticationType.Login);
        } else if (response is DataFailed) {
          emit(LoginSubmitFailure(
              username: state.username,
              password: state.password,
              authenticationType: state.authenticationType,
              error: response.error));
        }
      }
    });
  }
}
