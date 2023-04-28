import 'package:equatable/equatable.dart';

import 'FirstInfo.dart';

class Feedback extends Equatable {
  String id;
  String bookingId;
  String firstId;
  String secondId;
  int rating;
  String content;
  String createdAt;
  String updatedAt;
  FirstInfo firstInfo;

  Feedback({
    required this.id,
    required this.bookingId,
    required this.firstId,
    required this.secondId,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.firstInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'bookingId': this.bookingId,
      'firstId': this.firstId,
      'secondId': this.secondId,
      'rating': this.rating,
      'content': this.content,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'firstInfo': this.firstInfo,
    };
  }

  factory Feedback.fromMap(Map<String, dynamic> map) {
    return Feedback(
      id: map['id'] as String,
      bookingId: map['bookingId'] as String,
      firstId: map['firstId'] as String,
      secondId: map['secondId'] as String,
      rating: map['rating'] as int,
      content: map['content'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      firstInfo: map['firstInfo'] as FirstInfo,
    );
  }

  @override
  List<Object> get props => [];
}