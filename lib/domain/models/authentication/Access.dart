class Access {
  final String token;
  final String expires;

  const Access({
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
}