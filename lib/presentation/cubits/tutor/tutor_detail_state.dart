part of 'tutor_detail_cubit.dart';

abstract class TutorDetailState extends Equatable {
  final Tutor tutor;
  final DioError? error;

  const TutorDetailState({required this.tutor, this.error});

  @override
  List<Object?> get props => [tutor, error];
}

class TutorDetailInitial extends TutorDetailState {
  const TutorDetailInitial({required super.tutor});
}

class TutorDetailUpdateSuccess extends TutorDetailState {
  const TutorDetailUpdateSuccess({required super.tutor});
}

class TutorDetailUpdateFail extends TutorDetailState {
  const TutorDetailUpdateFail({required super.tutor, super.error});
}
