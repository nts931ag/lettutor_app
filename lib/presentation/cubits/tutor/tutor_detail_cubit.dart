import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/presentation/cubits/tutor/tutor_list_cubit.dart';

part 'tutor_detail_state.dart';

class TutorDetailCubit extends Cubit<TutorDetailState> {
  final ApiRepository _apiRepository;
  final TutorListCubit _tutorListCubit;

  TutorDetailCubit(this._apiRepository, this._tutorListCubit,
      {required Tutor tutor})
      : super(TutorDetailInitial(tutor: tutor));


  Future<void> onReportTutor(String message) async {

  }

  Future<void> onAddTutorFavourite() async {

  }

}
