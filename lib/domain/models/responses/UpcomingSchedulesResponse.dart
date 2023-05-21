import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Schedule.dart';

class UpcomingSchedulesResponse extends Equatable {
  final List<Schedule> schedules;

  Map<String, dynamic> toMap() {
    return {
      'schedules': this.schedules,
    };
  }

  factory UpcomingSchedulesResponse.fromMap(Map<String, dynamic> map) {
    return UpcomingSchedulesResponse(
      schedules: List<Schedule>.from(
        map['data'].map<Schedule>(
          (x) => Schedule.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  const UpcomingSchedulesResponse({
    required this.schedules,
  });

  @override
  List<Object> get props => [schedules];
}
