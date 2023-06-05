part of 'auth_cubit.dart';

enum AuthStatus { Unknown, Authenticated }

abstract class AuthState extends Equatable {
  final authStatus;
  final User? user;
  final Tokens? tokens;

  @override
  List<Object?> get props => [user, tokens, authStatus];

  const AuthState({
    this.authStatus = AuthStatus.Unknown,
    this.user,
    this.tokens,
  });
}

class UnknownState extends AuthState {
  const UnknownState({user, tokens, authStatus = AuthStatus.Unknown})
      : super(user: user, tokens: tokens, authStatus: authStatus);
}

class AuthenticatedState extends AuthState {
  const AuthenticatedState(
      {required super.user,
      required super.tokens,
      super.authStatus = AuthStatus.Authenticated});
}
