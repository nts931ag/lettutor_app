import 'package:equatable/equatable.dart';

class Topic extends Equatable {
  String id;
  String courseId;
  int orderCourse;
  String name;
  String nameFile;
  dynamic numberOfPages;
  String description;
  dynamic videoUrl;
  dynamic type;
  DateTime createdAt;
  DateTime updatedAt;

  Topic({
    required this.id,
    required this.courseId,
    required this.orderCourse,
    required this.name,
    required this.nameFile,
    required this.numberOfPages,
    required this.description,
    required this.videoUrl,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'courseId': this.courseId,
      'orderCourse': this.orderCourse,
      'name': this.name,
      'nameFile': this.nameFile,
      'numberOfPages': this.numberOfPages,
      'description': this.description,
      'videoUrl': this.videoUrl,
      'type': this.type,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
    };
  }

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      id: map['id'] as String,
      courseId: map['courseId'] as String,
      orderCourse: map['orderCourse'] as int,
      name: map['name'] as String,
      nameFile: map['nameFile'] as String,
      numberOfPages: map['numberOfPages'] as dynamic,
      description: map['description'] as String,
      videoUrl: map['videoUrl'] as dynamic,
      type: map['type'] as dynamic,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        courseId,
        orderCourse,
        name,
        nameFile,
        numberOfPages,
        description,
        videoUrl,
        type,
        createdAt,
        updatedAt
      ];
}
