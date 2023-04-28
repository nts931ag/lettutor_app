part of 'tutor_list_cubit.dart';

abstract class TutorListState extends Equatable {
  final List<Tutor> tutors;
  final bool noMoreData;
  final DioError? error;

  const TutorListState({
    this.tutors = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [tutors, noMoreData, error];
}

class TutorListLoading extends TutorListState {
  const TutorListLoading();
}

class TutorListSuccess extends TutorListState {
  const TutorListSuccess({super.tutors, super.noMoreData});
}

class TutorListFailed extends TutorListState {
  const TutorListFailed({super.error});
}
