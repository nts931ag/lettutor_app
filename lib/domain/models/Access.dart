import 'package:equatable/equatable.dart';

class Access extends Equatable {
  String token;
  String expires;

  Access({
    required this.token,
    required this.expires,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': this.token,
      'expires': this.expires,
    };
  }

  factory Access.fromMap(Map<String, dynamic> map) {
    return Access(
      token: map['token'] as String,
      expires: map['expires'] as String,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [token, expires];
}