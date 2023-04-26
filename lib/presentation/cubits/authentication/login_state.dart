part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final formzSubmissionStatus;
  final Username username;
  final Password password;
  final DioError? error;

  @override
  List<Object?> get props => [formzSubmissionStatus, username, password];

  const LoginState(
      {this.formzSubmissionStatus = FormzSubmissionStatus.initial,
      required this.username,
      required this.password,
      this.error});
}

class LoginInitial extends LoginState {
  const LoginInitial({username, password})
      : super(
            username: username,
            password: password,
            formzSubmissionStatus: FormzSubmissionStatus.initial);
}

class LoginInProgress extends LoginState {
  const LoginInProgress({username, password})
      : super(
            username: username,
            password: password,
            formzSubmissionStatus: FormzSubmissionStatus.inProgress);
}

class LoginSubmitSuccess extends LoginState {
  const LoginSubmitSuccess({username, password})
      : super(
            username: username,
            password: password,
            formzSubmissionStatus: FormzSubmissionStatus.success);
}

class LoginSubmitFailure extends LoginState {
  const LoginSubmitFailure({username, password, error})
      : super(
            username: username,
            password: password,
            error: error,
            formzSubmissionStatus: FormzSubmissionStatus.failure);
}
