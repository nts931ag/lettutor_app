import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/authentication/UserData.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/presentation/cubits/base/base_cubit.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends BaseCubit<AuthenticationState, UserData> {
  final ApiRepository _apiRepository;

  AuthenticationCubit(this._apiRepository)
      : super(AuthenticationUnknown(), null);

  Future<void> loginMannually({required email, required password}) async {
    if (isBusy) return;

    await run(() async {
      // final response =
      //     await _apiRepository.loginManually(email: email, password: password);
      //
      // if (response is DataSuccess) {
      //   final userData = response.data!;
      //
      //   data = userData;
      //
      //   emit(AuthenticationSuccess(userData: data, authState: AuthState.Authenticated));
      // } else if (response is DataFailed) {
      //   emit(AuthenticationFailed(error: response.error));
      // }
      emit(AuthenticationSuccess(userData: data, authState: AuthState.Authenticated));

    });
  }
}
