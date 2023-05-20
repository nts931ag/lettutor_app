import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';

class FavouriteTutorReponse extends Equatable {
  final message;
  final result;

  const FavouriteTutorReponse({
    required this.message,
    required this.result,
  });

  factory FavouriteTutorReponse.fromMap(Map<String, dynamic> map) {
    return FavouriteTutorReponse(
      result: Tutor.fromMap(map['result']),
      message: map['message'] as String,
    );
  }

  @override
  List<Object> get props => [message, result];
}
