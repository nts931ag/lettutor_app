import 'package:equatable/equatable.dart';

class TestPreparation extends Equatable {
  int id;
  String key;
  String name;

  TestPreparation({
    required this.id,
    required this.key,
    required this.name,
  });

  @override
  List<Object> get props => [id, key, name];

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'key': this.key,
      'name': this.name,
    };
  }

  factory TestPreparation.fromMap(Map<String, dynamic> map) {
    return TestPreparation(
      id: map['id'] as int,
      key: map['key'] as String,
      name: map['name'] as String,
    );
  }
}
