import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:lettutor_app/domain/models/LearnTopic.dart';
import 'package:lettutor_app/domain/models/TestPreparation.dart';
import 'package:lettutor_app/domain/models/User.dart';
import 'package:lettutor_app/domain/models/responses/UserDataResponse.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/presentation/cubits/authentication/auth_cubit.dart';
import 'package:lettutor_app/presentation/cubits/base/base_cubit.dart';
import 'package:lettutor_app/utils/constant/const_value.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

part 'profile_state.dart';

class ProfileCubit extends BaseCubit<ProfileState, UserDataResponse> {
  final ApiRepository _apiRepository;
  final AuthCubit _authCubit;

  ProfileCubit(this._apiRepository, this._authCubit)
      : super(ProfileInitial(), null);

  void onUsernameChanged(String value) {
    emit(ProfileInitial(
      name: value,
      email: state.email,
      phone: state.phone,
      level: state.level,
      birthday: state.birthday,
      country: state.country,
      specialities: state.specialities,
      avatar: state.avatar,
    ));
  }

  void onEmailChanged(String value) {
    emit(ProfileInitial(
      name: state.name,
      email: value,
      phone: state.phone,
      level: state.level,
      birthday: state.birthday,
      country: state.country,
      specialities: state.specialities,
      avatar: state.avatar,
    ));
  }

  void onPhoneChanged(String value) {
    emit(ProfileInitial(
      name: state.name,
      email: state.email,
      phone: value,
      level: state.level,
      birthday: state.birthday,
      country: state.country,
      specialities: state.specialities,
      avatar: state.avatar,
    ));
  }

  void onLevelChanged(String value) {
    emit(ProfileInitial(
      name: state.name,
      email: state.level,
      phone: state.phone,
      level: value,
      birthday: state.birthday,
      country: state.country,
      specialities: state.specialities,
      avatar: state.avatar,
    ));
  }

  void onBirthdayChanged(String value) {
    emit(ProfileInitial(
      name: state.name,
      email: state.email,
      phone: state.phone,
      level: state.level,
      birthday: value,
      country: state.country,
      specialities: state.specialities,
      avatar: state.avatar,
    ));
  }

  void onCountryChanged(String value) {
    emit(ProfileInitial(
      name: state.name,
      email: state.email,
      phone: state.phone,
      level: state.level,
      birthday: state.birthday,
      country: value,
      specialities: state.specialities,
      avatar: state.avatar,
    ));
  }

  void onSpecialitiesChanged(List<Specialities> value) {
    emit(ProfileInitial(
      name: state.name,
      email: state.email,
      phone: state.phone,
      level: state.level,
      birthday: state.birthday,
      country: state.country,
      specialities: value,
      avatar: state.avatar,
    ));
  }

  void onSpecialitiesRemoved(Specialities? removedObj) {
    state.specialities!.remove(removedObj);
    emit(ProfileInitial(
      name: state.name,
      email: state.email,
      phone: state.phone,
      level: state.level,
      birthday: state.birthday,
      country: state.country,
      specialities: state.specialities!,
      avatar: state.avatar,
    ));
  }

  void getInformationOfCurrentUser() {
    User currentUser = _authCubit.state.user!;

    List<Specialities> specialitiesInitial = [];

    if (currentUser.testPreparations != null &&
        currentUser.testPreparations!.isNotEmpty) {
      specialitiesInitial.addAll(currentUser.testPreparations!
          .map((e) => e.toSpecialities())
          .toList());
    }

    if (currentUser.learnTopics != null &&
        currentUser.learnTopics!.isNotEmpty) {
      specialitiesInitial.addAll(
          currentUser.learnTopics!.map((e) => e.toSpecialities()).toList());
    }

    emit(ProfileInitial(
        name: currentUser.name,
        email: currentUser.email,
        phone: currentUser.phone,
        level: currentUser.level,
        birthday: currentUser.birthday,
        country: currentUser.country,
        specialities: specialitiesInitial,
        avatar: currentUser.avatar));
  }

  Future<void> onUploadAvatar(String avatarUpload) async {
    if (isBusy) return;

    await run(() async {

      final response = await _apiRepository.uploadAvatar(avatarUpload);

      if (response is DataSuccess) {
        final updatedUser = response.data!;
        emit(
          ProfileSubmitSuccess(
            name: state.name,
            email: state.email,
            phone: state.phone,
            birthday: state.birthday,
            country: state.country,
            level: state.level,
            avatar: updatedUser.avatar,
          ),
        );
        await _authCubit.onSuccessUploadAvatarUser(updatedUser.avatar!);
      }
    });
  }

  Future<void> onEditUserInformation() async {
    if (isBusy) return;

    await run(() async {
      // if (state.username!.isValid && state.password!.isValid) {
      //   final response = await _apiRepository.edi(
      //       email: state.username!.value,
      //       password: state.password!.value);
      //
      //   if (response is DataSuccess) {
      //     final user = response.data!;
      //
      //     data = user;
      //     emit(LoginSubmitSuccess(username: state.username, password: state.password));
      //     _authCubit.onSuccessAuthentication(data!.user, data!.tokens!);
      //   } else if (response is DataFailed) {
      //     emit(LoginSubmitFailure(username: state.username, password: state.password, error: response.error));
      //   }
      // }

      final response = await _apiRepository.updateUserInformation(
          User(
            name: state.name,
            country: state.country,
            phone: state.phone,
            birthday: state.birthday,
            level: state.level,
          ),
          state.specialities!);

      if (response is DataSuccess) {
        final updatedUser = response.data!.user;

        emit(
          ProfileSubmitSuccess(
            name: updatedUser.name,
            email: updatedUser.email,
            phone: updatedUser.phone,
            birthday: updatedUser.birthday,
            country: updatedUser.country,
            level: updatedUser.level,
            avatar: state.avatar,
          ),
        );
        _authCubit.onSuccessUpdateUserInformation(updatedUser);
      }
    });
  }
}
