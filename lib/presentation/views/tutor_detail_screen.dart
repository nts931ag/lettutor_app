// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/config/router/router.dart';
import 'package:lettutor_app/config/router/router_arguments.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/locator.dart';
import 'package:lettutor_app/presentation/cubits/schedule/schedule_list_cubit.dart';
import 'package:lettutor_app/presentation/cubits/schedule/upcoming_schedule_cubit.dart';
import 'package:lettutor_app/presentation/cubits/tutor/tutor_detail_cubit.dart';
import 'package:lettutor_app/presentation/cubits/tutor/tutor_list_cubit.dart';
import 'package:lettutor_app/presentation/widgets/base/base_scaffold_custom_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/base_infor_tutor.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/tutor_main_detail.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/tutor_video.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';

class TutorDetailScreen extends StatelessWidget {
  const TutorDetailScreen(
      {Key? key,
      required this.tutor,
      required this.tutorListCubit,
      required this.scheduleListCubit, required this.upcomingScheduleCubit})
      : super(key: key);
  final Tutor tutor;
  final TutorListCubit tutorListCubit;
  final ScheduleListCubit scheduleListCubit;
  final UpcomingScheduleCubit upcomingScheduleCubit;

  @override
  Widget build(BuildContext context) {
    /*ValueNotifier<VideoPlayerController> videoControllerState =
        useState<VideoPlayerController>(VideoPlayerController.network(tutor.video ?? ""));

    useEffect(() {
      videoControllerState.value.addListener(() {
        // setState(() {});
      });
      videoControllerState.value.setLooping(true);
      // videoController.value.initialize().then((_) => setState(() {}));
      videoControllerState.value.play();
    }, const []);*/
    return BlocProvider(
      create: (context) => TutorDetailCubit(
          locator<ApiRepository>(), tutorListCubit,
          tutor: tutor),
      child: SafeArea(
        child: BaseScaffoldWidgetCustom(
          ishaveTrailing: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseInforTutor(
                  tutor: tutor,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TutorVideo(
                  tutor: tutor,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TutorMainDetail(tutor: tutor),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                  child: LoadingButtonWidget(
                    submit: () {
                      Navigator.pushNamed(
                        context,
                        MyRouter.booking,
                        arguments: BookingScreenArguments(
                            scheduleListCubit: scheduleListCubit,
                            tutorId: tutor.userId,
                            upcomingScheduleCubit: upcomingScheduleCubit),
                      );
                    },
                    isLoading: false,
                    height: 35.h,
                    textColor: whiteColor,
                    primaryColor: primaryColor,
                    label: "Booking",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
