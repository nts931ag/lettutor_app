import 'package:equatable/equatable.dart';

class BookingInfo extends Equatable {
  int createdAtTimeStamp;
  int updatedAtTimeStamp;
  String id;
  bool isDeleted;
  String createdAt;
  String scheduleDetailId;
  String updatedAt;
  int? cancelReasonId;
  String userId;

  BookingInfo({
    required this.createdAtTimeStamp,
    required this.updatedAtTimeStamp,
    required this.id,
    required this.isDeleted,
    required this.createdAt,
    required this.scheduleDetailId,
    required this.updatedAt,
    required this.cancelReasonId,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'createdAtTimeStamp': createdAtTimeStamp,
      'updatedAtTimeStamp': updatedAtTimeStamp,
      'id': id,
      'isDeleted': isDeleted,
      'createdAt': createdAt,
      'scheduleDetailId': scheduleDetailId,
      'updatedAt': updatedAt,
      'cancelReasonId': cancelReasonId,
      'userId': userId,
    };
  }

  factory BookingInfo.fromMap(Map<String, dynamic> map) {
    return BookingInfo(
      createdAtTimeStamp: map['createdAtTimeStamp'] as int,
      updatedAtTimeStamp: map['updatedAtTimeStamp'] as int,
      id: map['id'] as String,
      isDeleted: map['isDeleted'] as bool,
      createdAt: map['createdAt'] as String,
      scheduleDetailId: map['scheduleDetailId'] as String,
      updatedAt: map['updatedAt'] as String,
      cancelReasonId: map['cancelReasonId'] as int?,
      userId: map['userId'] as String,
    );
  }

  @override
  List<Object?> get props => [
        createdAtTimeStamp,
        updatedAtTimeStamp,
        id,
        isDeleted,
        createdAt,
        scheduleDetailId,
        updatedAt,
        cancelReasonId,
        userId,
      ];
}
