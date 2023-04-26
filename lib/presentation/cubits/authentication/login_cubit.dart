import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
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

  LoginCubit(this._apiRepository, this._authCubit)
      : super(const LoginInitial(username: Username.pure(), password: Password.pure()), null);

  void onUsernameChanged(String value) {
    final username = Username.dirty(value);
    emit(LoginInitial(
        username: username, password: state.password));
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    emit(LoginInitial(
        username: state.username, password: password));
  }

  Future<void> loginMannually({required email, required password}) async {
    if (isBusy) return;

    await run(() async {
      if (state.username!.isValid && state.password!.isValid) {
        final response = await _apiRepository.loginManually(
            email: state.username!.value,
            password: state.password!.value);

        if (response is DataSuccess) {
          final user = response.data!;

          data = user;
          emit(LoginSubmitSuccess(username: state.username, password: state.password));
          _authCubit.onSuccessAuthentication(data!.user, data!.tokens);
        } else if (response is DataFailed) {
          emit(LoginSubmitFailure(username: state.username, password: state.password, error: response.error));
        }
      }
    });
  }
}
