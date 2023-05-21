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
  String? studentRequest;
  String? tutorReview;
  int? scoreByTutor;
  DateTime createdAt;
  DateTime updatedAt;
  String recordUrl;
  dynamic cancelReasonId;
  dynamic lessonPlanId;
  dynamic cancelNote;
  dynamic calendarId;
  bool isDeleted;
  ScheduleDetailInfo scheduleDetailInfo;
  dynamic classReview;
  bool? showRecordUrl;
  List<dynamic>? studentMaterials;

  Schedule({
    required this.createdAtTimeStamp,
    required this.updatedAtTimeStamp,
    required this.id,
    required this.userId,
    required this.scheduleDetailId,
    required this.tutorMeetingLink,
    required this.studentMeetingLink,
    this.studentRequest,
    this.tutorReview,
    this.scoreByTutor,
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
    this.showRecordUrl,
    this.studentMaterials,
  });

  Map<String, dynamic> toMap() {
    return {
      'createdAtTimeStamp': createdAtTimeStamp,
      'updatedAtTimeStamp': updatedAtTimeStamp,
      'id': id,
      'userId': userId,
      'scheduleDetailId': scheduleDetailId,
      'tutorMeetingLink': tutorMeetingLink,
      'studentMeetingLink': studentMeetingLink,
      'studentRequest': studentRequest,
      'tutorReview': tutorReview,
      'scoreByTutor': scoreByTutor,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'recordUrl': recordUrl,
      'cancelReasonId': cancelReasonId,
      'lessonPlanId': lessonPlanId,
      'cancelNote': cancelNote,
      'calendarId': calendarId,
      'isDeleted': isDeleted,
      'scheduleDetailInfo': scheduleDetailInfo,
      'classReview': classReview,
      'showRecordUrl': showRecordUrl,
      'studentMaterials': studentMaterials,
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
      studentRequest: map['studentRequest'] as String?,
      tutorReview: map['tutorReview'] as String?,
      scoreByTutor: map['scoreByTutor'] as int?,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      recordUrl: map['recordUrl'] ?? '',
      cancelReasonId: map['cancelReasonId'] as dynamic,
      lessonPlanId: map['lessonPlanId'] as dynamic,
      cancelNote: map['cancelNote'] as dynamic,
      calendarId: map['calendarId'] as dynamic,
      isDeleted: map['isDeleted'] as bool,
      scheduleDetailInfo: ScheduleDetailInfo.fromMap(map['scheduleDetailInfo']),
      classReview: map['classReview'] as dynamic,
      showRecordUrl: map['showRecordUrl'] as bool?,
      studentMaterials: map['studentMaterials'] as List<dynamic>?,
    );
  }

  @override
  List<Object?> get props => [
        createdAtTimeStamp,
        updatedAtTimeStamp,
        id,
        userId,
        scheduleDetailId,
        tutorMeetingLink,
        studentMeetingLink,
        studentRequest,
        tutorReview,
        scoreByTutor,
        createdAt,
        updatedAt,
        recordUrl,
        cancelReasonId,
        lessonPlanId,
        cancelNote,
        calendarId,
        isDeleted,
        scheduleDetailInfo,
        classReview,
        showRecordUrl,
        studentMaterials,
      ];
}
