import 'package:lettutor_app/domain/models/Course.dart';
import 'package:lettutor_app/domain/models/Feedback.dart';
import 'package:lettutor_app/domain/models/Schedule.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/presentation/cubits/tutor/tutor_list_cubit.dart';

class TutorDetailArguments {
  final Tutor tutor;
  final TutorListCubit tutorListCubit;

  const TutorDetailArguments(
      {required this.tutor, required this.tutorListCubit});
}

class ReviewsArguments {
  final String tutorId;
  final ApiRepository apiRepository;

  const ReviewsArguments({
    required this.tutorId,
    required this.apiRepository,
  });
}

class CourseDetailArguments {
  final Course course;

  const CourseDetailArguments({
    required this.course,
  });
}

class PdfReaderArguments {
  final String nameFile;
  final String name;

  const PdfReaderArguments({
    required this.nameFile,
    required this.name,
  });
}

class MeetingArguments {
  final String studentMeetingLink;

  const MeetingArguments({
    required this.studentMeetingLink,
  });
}
