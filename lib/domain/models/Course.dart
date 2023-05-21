import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Category.dart';
import 'package:lettutor_app/domain/models/Topic.dart';

class Course extends Equatable {
  String id;
  String name;
  String description;
  String imageUrl;
  String level;
  String reason;
  String purpose;
  String otherDetails;
  int defaultPrice;
  int coursePrice;
  dynamic courseType;
  dynamic sectionType;
  bool visible;
  dynamic displayOrder;
  DateTime createdAt;
  DateTime updatedAt;
  List<Topic>? topics;
  List<Category>? categories;

  /*"TutorCourse": {
  "UserId": "f569c202-7bbf-4620-af77-ecc1419a6b28",
  "CourseId": "3476c86d-6d8c-46c9-aedd-a116a5891acb",
  "createdAt": "2023-04-13T12:39:50.892Z",
  "updatedAt": "2023-04-13T12:39:50.892Z"
  }*/

  Course({
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
    required this.topics,
    required this.categories,
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
      'topics': this.topics,
      'categories': this.categories,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      level: map['level'] as String,
      reason: map['reason'] as String,
      purpose: map['purpose'] as String,
      otherDetails:
          map['otherDetails'] != null ? map['otherDetails'] as String : '',
      defaultPrice:
          map['defaultPrice'] != null ? map['defaultPrice'] as int : 0,
      coursePrice: map['coursePrice'] != null ? map['coursePrice'] as int : 0,
      courseType: map['courseType'] as dynamic,
      sectionType: map['sectionType'] as dynamic,
      visible: map['visible'] != null ? map['visible'] as bool : false,
      displayOrder: map['displayOrder'] as dynamic,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      topics: map['topics'] != null
          ? List<Topic>.from(
              map['topics'].map<Topic>(
                (x) => Topic.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      categories: map['categories'] != null
          ? List<Category>.from(
              map['categories'].map<Category>(
                (x) => Category.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        level,
        reason,
        purpose,
        otherDetails,
        defaultPrice,
        coursePrice,
        courseType,
        sectionType,
        visible,
        displayOrder,
        createdAt,
        updatedAt
      ];
}
