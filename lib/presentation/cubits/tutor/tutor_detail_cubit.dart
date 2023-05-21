import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/presentation/cubits/base/base_cubit.dart';
import 'package:lettutor_app/presentation/cubits/tutor/tutor_list_cubit.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

part 'tutor_detail_state.dart';

class TutorDetailCubit
    extends /*BaseCubit<TutorDetailState, Tutor>*/ Cubit<TutorDetailState> {
  final ApiRepository _apiRepository;
  final TutorListCubit _tutorListCubit;

  TutorDetailCubit(this._apiRepository, this._tutorListCubit,
      {required Tutor tutor})
      : super(TutorDetailInitial(tutor: tutor));

  // Future<void> getTutorDetails() async {
  //   if (isBusy) return;
  //
  //   await run(() async {
  //     final response =
  //         await _apiRepository.getTutorDetailByTutorId(tutorId: state.tutor.id);
  //
  //     if (response is DataSuccess) {
  //       emit(TutorDetailInitial(tutor: response.data!));
  //     } else if (response is DataFailed) {
  //       // emit(TutorDetail(error: response.error));
  //     }
  //   });
  // }

  Future<void> onReportTutor(String content) async {
    // if (isBusy) return;

    // await run(() async {
    final response = await _apiRepository.reportTutor(
        tutorId: state.tutor.userId, content: content);
    if (response is DataSuccess) {
      emit(TutorDetailUpdateSuccess(tutor: state.tutor));
    } else if (response is DataFailed) {
      // emit(TutorDetail(error: response.error));
    }
    // });
  }

  Future<void> onAddTutorFavourite() async {
    // if (isBusy) return;

    // await run(() async {
    final response =
        await _apiRepository.manageFavoriteTutor(tutorId: state.tutor.userId);
    final Tutor tutorFavourite =
        state.tutor.copyWith(isFavoriteTutor: !state.tutor.isFavoriteTutor!);
    if (response is DataSuccess) {
      emit(
        TutorDetailUpdateSuccess(
          tutor: tutorFavourite,
        ),
      );
      _tutorListCubit.onAddTutorFavouriteSuccess(tutorFavourite);
    } else if (response is DataFailed) {
      // emit(TutorDetail(error: response.error));
    }
    // });
  }
}
