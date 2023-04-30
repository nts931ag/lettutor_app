import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Schedule.dart';

class SchedulesDataResponse extends Equatable {
  final List<Schedule>? schedules;
  final int scheduleCount;

  const SchedulesDataResponse({
    this.schedules,
    required this.scheduleCount,
  });

  factory SchedulesDataResponse.fromMap(Map<String, dynamic> map) {
    return SchedulesDataResponse(
      schedules: List<Schedule>.from(
        map['data']['rows'].map<Schedule>(
              (x) => Schedule.fromMap(x as Map<String, dynamic>),
        ),
      ),
      scheduleCount: map['data']['count'] as int,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [this.schedules, this.scheduleCount];
}
