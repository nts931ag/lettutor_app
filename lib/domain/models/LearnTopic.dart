import 'package:equatable/equatable.dart';
import 'package:lettutor_app/utils/constant/const_value.dart';

class LearnTopic extends Equatable{
  int id;
  String key;
  String name;

  LearnTopic({
    required this.id,
    required this.key,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'key': this.key,
      'name': this.name,
    };
  }

  factory LearnTopic.fromMap(Map<String, dynamic> map) {
    return LearnTopic(
      id: map['id'] as int,
      key: map['key'] as String,
      name: map['name'] as String,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, key, name];

  Specialities toSpecialities() {
    return Specialities(id: id, key: key, title: name, group: SpecialitiesGroup.topic);
  }
}