import 'package:lettutor_app/domain/models/Course.dart';
import 'package:lettutor_app/domain/models/Feedback.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';

class TutorDetailArguments {
  final Tutor tutor;

  const TutorDetailArguments({
    required this.tutor,
  });
}


class ReviewsArguments {
  final List<Feedback>? feedbacks;

  const ReviewsArguments({
    required this.feedbacks,
  });
}


class CourseDetailArguments {
  final Course course;

  const CourseDetailArguments({
    required this.course,
  });
}
