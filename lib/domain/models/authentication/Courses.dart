import 'TutorCourse.dart';

class Courses {

  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String level;
  final String reason;
  final String purpose;
  final String otherDetails;
  final int defaultPrice;
  final int coursePrice;
  dynamic courseType;
  dynamic sectionType;
  final bool visible;
  dynamic displayOrder;
  final String createdAt;
  final String updatedAt;
  final TutorCourse tutorCourse;

  Courses({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.level,
    required this.reason,
    required this.purpose,
    required this.otherDetails,
    required this.defaultPrice,
    required this.coursePrice,
    required this.courseType,
    required this.sectionType,
    required this.visible,
    required this.displayOrder,
    required this.createdAt,
    required this.updatedAt,
    required this.tutorCourse,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'imageUrl': this.imageUrl,
      'level': this.level,
      'reason': this.reason,
      'purpose': this.purpose,
      'otherDetails': this.otherDetails,
      'defaultPrice': this.defaultPrice,
      'coursePrice': this.coursePrice,
      'courseType': this.courseType,
      'sectionType': this.sectionType,
      'visible': this.visible,
      'displayOrder': this.displayOrder,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'tutorCourse': this.tutorCourse,
    };
  }

  factory Courses.fromMap(Map<String, dynamic> map) {
    return Courses(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      level: map['level'] as String,
      reason: map['reason'] as String,
      purpose: map['purpose'] as String,
      otherDetails: map['otherDetails'] as String,
      defaultPrice: map['defaultPrice'] as int,
      coursePrice: map['coursePrice'] as int,
      courseType: map['courseType'] as dynamic,
      sectionType: map['sectionType'] as dynamic,
      visible: map['visible'] as bool,
      displayOrder: map['displayOrder'] as dynamic,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      tutorCourse: map['tutorCourse'] as TutorCourse,
    );
  }
}