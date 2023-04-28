import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';

class TutorsDataResponse extends Equatable {
  final List<Tutor>? tutors;
  final int tutorCount;
  final String? favoriteTutor;

  const TutorsDataResponse({
    this.tutors,
    required this.tutorCount,
    required this.favoriteTutor,
  });

  factory TutorsDataResponse.fromMap(Map<String, dynamic> map) {
    return TutorsDataResponse(
      tutors: List<Tutor>.from(
        map['tutor']['rows'].map<Tutor>(
          (x) => Tutor.fromMap(x as Map<String, dynamic>),
        ),
      ),
      tutorCount: map['tokens'] as int,
      favoriteTutor: map['favorite'] as String,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
