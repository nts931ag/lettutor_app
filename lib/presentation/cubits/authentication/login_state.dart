part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final formzSubmissionStatus;
  final Username? username;
  final Password? password;

  @override
  List<Object?> get props => [formzSubmissionStatus, username, password];

  const LoginState({
    this.formzSubmissionStatus = FormzSubmissionStatus.initial,
    this.username,
    this.password,
  });
}

class LoginInitial extends LoginState {
  const LoginInitial({username, password}) : super(username: username,
      password: password,
      formzSubmissionStatus: FormzSubmissionStatus.initial);
}


class LoginSuccess extends LoginState {
  const LoginSuccess({username, password})
      : super(username: username,
      password: password,
      formzSubmissionStatus: FormzSubmissionStatus.success);
}


class LoginFail extends LoginState {
  const LoginFail({username, password})
      : super(username: username,
      password: password,
      formzSubmissionStatus: FormzSubmissionStatus.failure);
}