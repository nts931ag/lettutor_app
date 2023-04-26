import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Tokens.dart';
import 'package:lettutor_app/domain/models/User.dart';

class UserDataResponse extends Equatable {

  final User user;
  final Tokens tokens;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  const UserDataResponse({
    required this.user,
    required this.tokens,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': this.user,
      'tokens': this.tokens,
    };
  }

  factory UserDataResponse.fromMap(Map<String, dynamic> map) {
    return UserDataResponse(
      user:  User.fromMap(map['user']),
      tokens: Tokens.fromMap(map['tokens']),
    );
  }
}