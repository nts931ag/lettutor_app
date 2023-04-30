import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/ScheduleDetailInfo.dart';

class Schedule extends Equatable {
  int createdAtTimeStamp;
  int updatedAtTimeStamp;
  String id;
  String userId;
  String scheduleDetailId;
  String tutorMeetingLink;
  String studentMeetingLink;
  String studentRequest;
  String tutorReview;
  int scoreByTutor;
  String createdAt;
  String updatedAt;
  String recordUrl;
  dynamic cancelReasonId;
  dynamic lessonPlanId;
  dynamic cancelNote;
  dynamic calendarId;
  bool isDeleted;
  ScheduleDetailInfo scheduleDetailInfo;
  dynamic classReview;
  bool showRecordUrl;
  List<dynamic> studentMaterials;

  Schedule({
    required this.createdAtTimeStamp,
    required this.updatedAtTimeStamp,
    required this.id,
    required this.userId,
    required this.scheduleDetailId,
    required this.tutorMeetingLink,
    required this.studentMeetingLink,
    required this.studentRequest,
    required this.tutorReview,
    required this.scoreByTutor,
    required this.createdAt,
    required this.updatedAt,
    required this.recordUrl,
    required this.cancelReasonId,
    required this.lessonPlanId,
    required this.cancelNote,
    required this.calendarId,
    required this.isDeleted,
    required this.scheduleDetailInfo,
    required this.classReview,
    required this.showRecordUrl,
    required this.studentMaterials,
  });

  Map<String, dynamic> toMap() {
    return {
      'createdAtTimeStamp': this.createdAtTimeStamp,
      'updatedAtTimeStamp': this.updatedAtTimeStamp,
      'id': this.id,
      'userId': this.userId,
      'scheduleDetailId': this.scheduleDetailId,
      'tutorMeetingLink': this.tutorMeetingLink,
      'studentMeetingLink': this.studentMeetingLink,
      'studentRequest': this.studentRequest,
      'tutorReview': this.tutorReview,
      'scoreByTutor': this.scoreByTutor,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'recordUrl': this.recordUrl,
      'cancelReasonId': this.cancelReasonId,
      'lessonPlanId': this.lessonPlanId,
      'cancelNote': this.cancelNote,
      'calendarId': this.calendarId,
      'isDeleted': this.isDeleted,
      'scheduleDetailInfo': this.scheduleDetailInfo,
      'classReview': this.classReview,
      'showRecordUrl': this.showRecordUrl,
      'studentMaterials': this.studentMaterials,
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      createdAtTimeStamp: map['createdAtTimeStamp'] as int,
      updatedAtTimeStamp: map['updatedAtTimeStamp'] as int,
      id: map['id'] as String,
      userId: map['userId'] as String,
      scheduleDetailId: map['scheduleDetailId'] as String,
      tutorMeetingLink: map['tutorMeetingLink'] as String,
      studentMeetingLink: map['studentMeetingLink'] as String,
      studentRequest: map['studentRequest'] as String,
      tutorReview: map['tutorReview'] as String,
      scoreByTutor: map['scoreByTutor'] as int,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      recordUrl: map['recordUrl'] as String,
      cancelReasonId: map['cancelReasonId'] as dynamic,
      lessonPlanId: map['lessonPlanId'] as dynamic,
      cancelNote: map['cancelNote'] as dynamic,
      calendarId: map['calendarId'] as dynamic,
      isDeleted: map['isDeleted'] as bool,
      scheduleDetailInfo: map['scheduleDetailInfo'] as ScheduleDetailInfo,
      classReview: map['classReview'] as dynamic,
      showRecordUrl: map['showRecordUrl'] as bool,
      studentMaterials: map['studentMaterials'] as List<dynamic>,
    );
  }

  @override
  List<Object> get props => [];
}