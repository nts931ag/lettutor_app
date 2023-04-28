import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Tokens.dart';
import 'package:lettutor_app/domain/models/User.dart';
import 'package:lettutor_app/locator.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(UnknownState());

  void onSuccessAuthentication(User user, Tokens tokens) {
    locator<Dio>().options.headers['Authorization'] = "Bearer " + tokens.access.token;
    emit(AuthenticatedState(user: user, tokens: tokens));
  }
}
