import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';

class TutorsDataResponse extends Equatable {
  final List<Tutor>? tutors;
  final int tutorCount;
  final String? favoriteTutor;

  const TutorsDataResponse({
    this.tutors,
    required this.tutorCount,
    this.favoriteTutor,
  });

  factory TutorsDataResponse.fromMap(Map<String, dynamic> map) {
    return TutorsDataResponse(
      tutors: List<Tutor>.from(
        map['rows'].map<Tutor>(
          (x) => Tutor.fromMap(x as Map<String, dynamic>),
        ),
      ),
      tutorCount: map['count'] as int,
    );
  }

  /*factory TutorsDataResponse.fromMap(Map<String, dynamic> map) {
    return TutorsDataResponse(
      tutors: List<Tutor>.from(
        map['tutors']['rows'].map<Tutor>(
              (x) => Tutor.fromMap(x as Map<String, dynamic>),
        ),
      ),
      tutorCount: map['tutors']['count'] as int,
    );
  }
*/
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
