import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/BookingSchedule.dart';

class BookingSchedulesDataReponse extends Equatable {
  final String message;
  final List<BookingSchedule> scheduleOfTutor;

  const BookingSchedulesDataReponse({
    required this.message,
    required this.scheduleOfTutor,
  });

  @override
  List<Object> get props => [message, scheduleOfTutor];

  Map<String, dynamic> toMap() {
    return {
      'message': this.message,
      'scheduleOfTutor': this.scheduleOfTutor,
    };
  }

  factory BookingSchedulesDataReponse.fromMap(Map<String, dynamic> map) {
    return BookingSchedulesDataReponse(
      message: map['message'] as String,
      scheduleOfTutor: List<BookingSchedule>.from(
        map['scheduleOfTutor'].map<BookingSchedule>(
          (x) => BookingSchedule.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
