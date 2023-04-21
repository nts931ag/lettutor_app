import 'User.dart';
import 'Tokens.dart';

class UserData {
  final User user;
  final Tokens tokens;

  const UserData({
    required this.user,
    required this.tokens,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': this.user,
      'tokens': this.tokens,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      user: map['user'] as User,
      tokens: map['tokens'] as Tokens,
    );
  }
}