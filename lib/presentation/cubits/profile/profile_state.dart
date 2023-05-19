part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String country;
  final String birthday;
  final String level;
  final String avatar;
  final List<Specialities>? specialities;
  final formzSubmissionStatus;
  final DioError? error;

  @override
  List<Object?> get props =>
      [
        name,
        email,
        phone,
        country,
        birthday,
        level,
        specialities,
        avatar,
        formzSubmissionStatus,
        error,
      ];

  const ProfileState({
    required this.name,
    required this.email,
    required this.phone,
    required this.country,
    required this.birthday,
    required this.level,
    required this.avatar,
    this.specialities,
    this.formzSubmissionStatus = FormzSubmissionStatus.initial,
    this.error,
  });
}

class ProfileInitial extends ProfileState {
  const ProfileInitial(
      {name, avatar, email, phone, country, birthday, level, specialities})
      : super(
    name: name ?? '',
    email: email ?? '',
    phone: phone ?? '',
    country: country ?? '',
    birthday: birthday ?? '',
    level: level ?? '',
    avatar: avatar ?? '',
    specialities: specialities ?? const [],
  );
}

class ProfileInProgress extends ProfileState {
  const ProfileInProgress(
      {name, avatar, email, phone, country, birthday, level, specialities})
      : super(
    name: name,
    email: email,
    phone: phone,
    country: country,
    birthday: birthday,
    level: level,
    specialities: specialities,
    avatar: avatar,
    formzSubmissionStatus: FormzSubmissionStatus.inProgress,
  );
}

class ProfileSubmitSuccess extends ProfileState {
  const ProfileSubmitSuccess(
      {name, avatar, email, phone, country, birthday, level, specialities})
      : super(
      name: name,
      email: email,
      phone: phone,
      country: country,
      birthday: birthday,
      level: level,
      specialities: specialities,
      avatar: avatar,
      formzSubmissionStatus: FormzSubmissionStatus.success);
}

class ProfileSubmitFailure extends ProfileState {
  const ProfileSubmitFailure(
      {name, avatar, email, phone, country, birthday, level, specialities, error})
      : super(
      name: name,
      email: email,
      phone: phone,
      country: country,
      birthday: birthday,
      level: level,
      specialities: specialities,
      avatar: avatar,
      error: error,
      formzSubmissionStatus: FormzSubmissionStatus.failure);
}
