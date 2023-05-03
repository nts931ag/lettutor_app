import 'package:equatable/equatable.dart';

import 'ScheduleInfo.dart';

class ScheduleDetailInfo extends Equatable {
  int startPeriodTimestamp;
  int endPeriodTimestamp;
  String id;
  String scheduleId;
  String startPeriod;
  String endPeriod;
  String createdAt;
  String updatedAt;
  ScheduleInfo scheduleInfo;

  ScheduleDetailInfo({
    required this.startPeriodTimestamp,
    required this.endPeriodTimestamp,
    required this.id,
    required this.scheduleId,
    required this.startPeriod,
    required this.endPeriod,
    required this.createdAt,
    required this.updatedAt,
    required this.scheduleInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'startPeriodTimestamp': this.startPeriodTimestamp,
      'endPeriodTimestamp': this.endPeriodTimestamp,
      'id': this.id,
      'scheduleId': this.scheduleId,
      'startPeriod': this.startPeriod,
      'endPeriod': this.endPeriod,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'scheduleInfo': this.scheduleInfo,
    };
  }

  factory ScheduleDetailInfo.fromMap(Map<String, dynamic> map) {
    return ScheduleDetailInfo(
      startPeriodTimestamp: map['startPeriodTimestamp'] as int,
      endPeriodTimestamp: map['endPeriodTimestamp'] as int,
      id: map['id'] as String,
      scheduleId: map['scheduleId'] as String,
      startPeriod: map['startPeriod'] as String,
      endPeriod: map['endPeriod'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      scheduleInfo: ScheduleInfo.fromMap(map['scheduleInfo']),
    );
  }

  @override
  List<Object> get props => [];
}