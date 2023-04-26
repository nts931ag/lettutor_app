import 'package:bloc/bloc.dart';
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
      : super(LoginInitial(), null);

  void onUsernameChanged(String value) {
    final username = Username.dirty(value);
    emit(LoginInitial(username: username));
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    emit(LoginInitial(password: password));
  }

  Future<void> loginMannually({required email, required password}) async {
    if (isBusy) return;

    await run(() async {
      final response =
          await _apiRepository.loginManually(email: state.username.toString(), password: state.password.toString());

      if (response is DataSuccess) {
        final user = response.data!;

        data = user;

        // emit(AuthenticationSuccess(user: data, authState: AuthState.Authenticated));
      } else if (response is DataFailed) {
        // emit(AuthenticationFailed(error: response.error));
      }
    });
  }
}
