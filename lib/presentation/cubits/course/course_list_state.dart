part of 'course_list_cubit.dart';

abstract class CourseListState extends Equatable {
  final List<Course> courses;
  final bool noMoreData;
  final DioError? error;

  const CourseListState({
    this.courses = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [courses, noMoreData, error];
}

class CourseListLoading extends CourseListState {
  const CourseListLoading();
}

class CourseListSuccess extends CourseListState {
  const CourseListSuccess({super.courses, super.noMoreData});
}

class CourseListEmptySuccess extends CourseListState {
  const CourseListEmptySuccess();
}


class CourseListFailed extends CourseListState {
  const CourseListFailed({super.error});
}


