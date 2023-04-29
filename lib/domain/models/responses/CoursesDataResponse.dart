import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Course.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';

class CoursesDataResponse extends Equatable {
  final List<Course>? courses;
  final int courseCount;

  const CoursesDataResponse({
    this.courses,
    required this.courseCount,
  });

  factory CoursesDataResponse.fromMap(Map<String, dynamic> map) {
    return CoursesDataResponse(
      courses: List<Course>.from(
        map['data']['rows'].map<Course>(
              (x) => Course.fromMap(x as Map<String, dynamic>),
        ),
      ),
      courseCount: map['data']['count'] as int,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [this.courses, this.courseCount];
}
