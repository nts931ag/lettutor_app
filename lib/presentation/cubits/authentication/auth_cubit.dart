import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Tokens.dart';
import 'package:lettutor_app/domain/models/User.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/locator.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._apiRepository) : super(UnknownState());
  final ApiRepository _apiRepository;

  void onSuccessAuthentication(User user, Tokens tokens) {
    locator<Dio>().options.headers['Authorization'] =
        "Bearer " + tokens.access.token;
    emit(AuthenticatedState(user: user, tokens: tokens));
  }

  Future<void> onSuccessUpdateUserInformation(User updatedUser) async {
    User user = state.user!.copyWith(
      name: updatedUser.name,
      country: updatedUser.country,
      phone: updatedUser.phone,
      birthday: updatedUser.birthday,
      level: updatedUser.level,
      learnTopics: updatedUser.learnTopics,
      testPreparations: updatedUser.testPreparations,
    );
    emit(
      AuthenticatedState(user: user, tokens: state.tokens),
    );
  }

  Future<void> onSuccessUploadAvatarUser(String avatarUrl) async {
    User user = state.user!.copyWith(
      avatar: avatarUrl
    );
    emit(
      AuthenticatedState(user: user, tokens: state.tokens),
    );
  }
}
