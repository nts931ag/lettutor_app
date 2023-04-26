import 'package:equatable/equatable.dart';

class Refresh extends Equatable{
  String token;
  String expires;

  Refresh({
    required this.token,
    required this.expires,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': this.token,
      'expires': this.expires,
    };
  }

  factory Refresh.fromMap(Map<String, dynamic> map) {
    return Refresh(
      token: map['token'] as String,
      expires: map['expires'] as String,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [token, expires];
}