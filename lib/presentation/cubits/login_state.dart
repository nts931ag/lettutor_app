part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, fail }

abstract class LoginState extends Equatable {
  final String? email;
  final String? password;
  final LoginStatus status = LoginStatus.initial;
  final DioError? dioError;




  @override
  List<Object?> get props => [email, password, status, dioError];

  const LoginState({
    this.email,
    this.password,
    this.dioError,
  });
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginSubmitting extends LoginState {
  const LoginSubmitting({required super.email, required super.password});
}

class LoginSuccess extends LoginState {
  const LoginSuccess({required super.email, required super.password});
}

class LoginFail extends LoginState {
  const LoginFail({required super.email, required super.password});
}




