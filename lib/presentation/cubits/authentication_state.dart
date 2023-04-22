part of 'authentication_cubit.dart';

enum AuthState {Unknown, Authenticated, UnAuthenticated}

abstract class AuthenticationState extends Equatable {
  final UserData? userData;
  final AuthState authState;
  final DioError? error;

  const AuthenticationState({
    this.userData,
    this.authState = AuthState.Unknown,
    this.error,
  });

  @override
  List<Object?> get props => [userData, authState, error];
}

class AuthenticationUnknown extends AuthenticationState {
  const AuthenticationUnknown();
}

class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess({super.userData, super.authState});
}

class AuthenticationFailed extends AuthenticationState {
  const AuthenticationFailed({super.error});
}
