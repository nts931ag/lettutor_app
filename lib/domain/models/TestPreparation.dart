import 'package:equatable/equatable.dart';
import 'package:lettutor_app/utils/constant/const_value.dart';

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

  Map<String, dynamic> toCustomMap() {
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

  Specialities toSpecialities() {
    return Specialities(id: id, key: key, title: name, group: SpecialitiesGroup.testPreparation);
  }
}
