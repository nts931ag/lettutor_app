import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lettutor_app/domain/models/authentication/UserData.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/presentation/cubits/base/base_cubit.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState, UserData> {
  final ApiRepository _apiRepository;
  LoginCubit(this._apiRepository) : super(LoginInitial(), null);

  Future<void> loginMannually({required email, required password}) async {
    if (isBusy) return;

    await run(() async {
      final response =
      await _apiRepository.loginManually(email: email, password: password);

      if (response is DataSuccess) {
        final userData = response.data!;

        data = userData;

        // emit(Login(userData: data, authState: AuthState.Authenticated));
      } else if (response is DataFailed) {
        // emit(AuthenticationFailed(error: response.error));
      }
    });
  }
}
