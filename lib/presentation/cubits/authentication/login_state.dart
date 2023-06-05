part of 'login_cubit.dart';

enum AuthenticationType {
  Login,
  Signup,
}

abstract class LoginState extends Equatable {
  final formzSubmissionStatus;
  final Username username;
  final Password password;
  final DioError? error;
  final AuthenticationType authenticationType;

  @override
  List<Object?> get props =>
      [formzSubmissionStatus, username, password, authenticationType];

  const LoginState(
      {this.formzSubmissionStatus = FormzSubmissionStatus.initial,
      required this.username,
      required this.password,
      this.authenticationType = AuthenticationType.Login,
      this.error});
}

class LoginInitial extends LoginState {
  const LoginInitial({username, password, authenticationType})
      : super(
            username: username,
            password: password,
            formzSubmissionStatus: FormzSubmissionStatus.initial,
            authenticationType: authenticationType);
}

class LoginInProgress extends LoginState {
  const LoginInProgress({username, password, authenticationType})
      : super(
            username: username,
            password: password,
            authenticationType: authenticationType,
            formzSubmissionStatus: FormzSubmissionStatus.inProgress);
}

class LoginSubmitSuccess extends LoginState {
  const LoginSubmitSuccess({username, password, authenticationType})
      : super(
            username: username,
            password: password,
            authenticationType: authenticationType,
            formzSubmissionStatus: FormzSubmissionStatus.success);
}

class LoginSubmitFailure extends LoginState {
  const LoginSubmitFailure({username, password, authenticationType, error})
      : super(
            username: username,
            password: password,
            authenticationType: authenticationType,
            error: error,
            formzSubmissionStatus: FormzSubmissionStatus.failure);
}
