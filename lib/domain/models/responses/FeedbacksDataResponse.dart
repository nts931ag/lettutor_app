import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Feedback.dart';

class FeedbacksDataResponse extends Equatable {
  final int count;
  final List<Feedback> feedbacks;

  const FeedbacksDataResponse({
    required this.count,
    required this.feedbacks,
  });

  @override
  List<Object> get props => [count, feedbacks];

  Map<String, dynamic> toMap() {
    return {
      'count': this.count,
      'feedbacks': this.feedbacks,
    };
  }

  factory FeedbacksDataResponse.fromMap(Map<String, dynamic> map) {
    return FeedbacksDataResponse(
      count: map['data']['count'] as int,
      feedbacks: List<Feedback>.from(
        map['data']['rows'].map<Feedback>(
          (x) => Feedback.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
