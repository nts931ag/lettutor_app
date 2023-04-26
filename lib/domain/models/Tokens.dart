import 'package:equatable/equatable.dart';

import 'Access.dart';
import 'Refresh.dart';

class Tokens extends Equatable{

  Access access;
  Refresh refresh;

  Tokens({
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
      access: Access.fromMap(map['access']),
      refresh: Refresh.fromMap(map['refresh']),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [access, refresh];


}