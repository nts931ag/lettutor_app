import 'package:equatable/equatable.dart';

import 'ScheduleDetails.dart';

class BookingSchedule extends Equatable {
  String id;
  String tutorId;
  String startTime;
  String endTime;
  int startTimestamp;
  int endTimestamp;
  String createdAt;
  bool isBooked;
  List<ScheduleDetails> scheduleDetails;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tutorId': tutorId,
      'startTime': startTime,
      'endTime': endTime,
      'startTimestamp': startTimestamp,
      'endTimestamp': endTimestamp,
      'createdAt': createdAt,
      'isBooked': isBooked,
      'scheduleDetails': scheduleDetails,
    };
  }

  factory BookingSchedule.fromMap(Map<String, dynamic> map) {
    return BookingSchedule(
      id: map['id'] as String,
      tutorId: map['tutorId'] as String,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      startTimestamp: map['startTimestamp'] as int,
      endTimestamp: map['endTimestamp'] as int,
      createdAt: map['createdAt'] as String,
      isBooked: map['isBooked'] as bool,
      scheduleDetails: List<ScheduleDetails>.from(
        map['scheduleDetails'].map<ScheduleDetails>(
          (x) => ScheduleDetails.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  BookingSchedule({
    required this.id,
    required this.tutorId,
    required this.startTime,
    required this.endTime,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.createdAt,
    required this.isBooked,
    required this.scheduleDetails,
  });

  @override
  List<Object> get props => [
        id,
        tutorId,
        startTime,
        endTime,
        startTimestamp,
        endTimestamp,
        createdAt,
        isBooked,
        scheduleDetails,
      ];
}
