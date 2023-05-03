import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';

class ScheduleInfo extends Equatable {
  String date;
  int startTimestamp;
  int endTimestamp;
  String id;
  String tutorId;
  String startTime;
  String endTime;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  Tutor tutorInfo;

  ScheduleInfo({
    required this.date,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.id,
    required this.tutorId,
    required this.startTime,
    required this.endTime,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.tutorInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': this.date,
      'startTimestamp': this.startTimestamp,
      'endTimestamp': this.endTimestamp,
      'id': this.id,
      'tutorId': this.tutorId,
      'startTime': this.startTime,
      'endTime': this.endTime,
      'isDeleted': this.isDeleted,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'tutorInfo': this.tutorInfo,
    };
  }

  factory ScheduleInfo.fromMap(Map<String, dynamic> map) {
    return ScheduleInfo(
      date: map['date'] as String,
      startTimestamp: map['startTimestamp'] as int,
      endTimestamp: map['endTimestamp'] as int,
      id: map['id'] as String,
      tutorId: map['tutorId'] as String,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      isDeleted: map['isDeleted'] as bool,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      tutorInfo: Tutor.fromMap(map['tutorInfo']),
    );
  }

  @override
  List<Object> get props => [];
}