class Refresh {
  final String token;
  final String expires;

  const Refresh({
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
}
