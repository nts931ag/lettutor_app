part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String country;
  final String birthday;
  final String level;
  final List<Specialities>? specialies;
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
        specialies,
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
    this.specialies,
    this.formzSubmissionStatus = FormzSubmissionStatus.initial,
    this.error,
  });
}

class ProfileInitial extends ProfileState {
  const ProfileInitial(
      {name, email, phone, country, birthday, level, specialies, learnTopic})
      : super(
    name: name ?? '',
    email: email ?? '',
    phone: phone ?? '',
    country: country ?? '',
    birthday: birthday ?? '',
    level: level ?? '',
    specialies: specialies ?? const [],
  );
}

class ProfileInProgress extends ProfileState {
  const ProfileInProgress(
      {name, email, phone, country, birthday, level, specialies, learnTopic})
      : super(
    name: name,
    email: email,
    phone: phone,
    country: country,
    birthday: birthday,
    level: level,
    specialies: specialies,
    formzSubmissionStatus: FormzSubmissionStatus.inProgress,
  );
}

class ProfileSubmitSuccess extends ProfileState {
  const ProfileSubmitSuccess(
      {name, email, phone, country, birthday, level, specialies, learnTopic})
      : super(
      name: name,
      email: email,
      phone: phone,
      country: country,
      birthday: birthday,
      level: level,
      specialies: specialies,
      formzSubmissionStatus: FormzSubmissionStatus.success);
}

class ProfileSubmitFailure extends ProfileState {
  const ProfileSubmitFailure(
      {name, email, phone, country, birthday, level, specialies, learnTopic, error})
      : super(
      name: name,
      email: email,
      phone: phone,
      country: country,
      birthday: birthday,
      level: level,
      specialies: specialies,
      error: error,
      formzSubmissionStatus: FormzSubmissionStatus.failure);
}
