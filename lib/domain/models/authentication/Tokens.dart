import 'Access.dart';
import 'Refresh.dart';

class Tokens {
  final Access access;
  final Refresh refresh;

  const Tokens({
    required this.access,
    required this.refresh,
  });

  Map<String, dynamic> toMap() {
    return {
      'access': this.access,
      'refresh': this.refresh,
    };
  }

  factory Tokens.fromMap(Map<String, dynamic> map) {
    return Tokens(
      access: map['access'] as Access,
      refresh: map['refresh'] as Refresh,
    );
  }
}