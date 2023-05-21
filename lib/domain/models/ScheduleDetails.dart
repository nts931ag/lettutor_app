import 'package:equatable/equatable.dart';

import 'BookingInfo.dart';

class ScheduleDetails extends Equatable {
  int startPeriodTimestamp;
  int endPeriodTimestamp;
  String id;
  String scheduleId;
  String startPeriod;
  String endPeriod;
  String createdAt;
  String updatedAt;
  List<BookingInfo> bookingInfo;
  bool isBooked;

  Map<String, dynamic> toMap() {
    return {
      'startPeriodTimestamp': startPeriodTimestamp,
      'endPeriodTimestamp': endPeriodTimestamp,
      'id': id,
      'scheduleId': scheduleId,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'bookingInfo': bookingInfo,
      'isBooked': isBooked,
    };
  }

  factory ScheduleDetails.fromMap(Map<String, dynamic> map) {
    return ScheduleDetails(
      startPeriodTimestamp: map['startPeriodTimestamp'] as int,
      endPeriodTimestamp: map['endPeriodTimestamp'] as int,
      id: map['id'] as String,
      scheduleId: map['scheduleId'] as String,
      startPeriod: map['startPeriod'] as String,
      endPeriod: map['endPeriod'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      bookingInfo: List<BookingInfo>.from(
        map['bookingInfo'].map<BookingInfo>(
          (x) => BookingInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isBooked: map['isBooked'] as bool,
    );
  }

  ScheduleDetails({
    required this.startPeriodTimestamp,
    required this.endPeriodTimestamp,
    required this.id,
    required this.scheduleId,
    required this.startPeriod,
    required this.endPeriod,
    required this.createdAt,
    required this.updatedAt,
    required this.bookingInfo,
    required this.isBooked,
  });

  @override
  List<Object> get props => [
        startPeriodTimestamp,
        endPeriodTimestamp,
        id,
        scheduleId,
        startPeriod,
        endPeriod,
        createdAt,
        updatedAt,
        bookingInfo,
        isBooked,
      ];
}
