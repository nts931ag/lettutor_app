import 'package:equatable/equatable.dart';

import 'FirstInfo.dart';

class Feedback extends Equatable {
  String id;
  String bookingId;
  String firstId;
  String secondId;
  double rating;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
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
      bookingId: map['bookingId'] ?? '',
      firstId: map['firstId'] as String,
      secondId: map['secondId'] as String,
      rating: (map['rating'] as int).toDouble(),
      content: map['content'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      firstInfo: FirstInfo.fromMap(map['firstInfo']),
    );
  }

  @override
  List<Object> get props => [];
}
