import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lettutor_app/domain/models/Feedback.dart' as FeedBack;
import 'package:lettutor_app/presentation/cubits/tutor/feedback_list_cubit.dart';
import 'package:lettutor_app/presentation/widgets/review/comment_item.dart';
import 'package:lettutor_app/utils/extensions/scroll_controller_extensions.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';

class ReviewScreen extends HookWidget {
  ReviewScreen({Key? key, required this.tutorId}) : super(key: key);
  final String tutorId;

  @override
  Widget build(BuildContext context) {
    final feedbackListcubit = BlocProvider.of<FeedbackListCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListener(() {
        feedbackListcubit.getFeedbackTutorWithTutorId(tutorId: tutorId);
      });

      return scrollController.dispose;
    }, const []);

    {
      return _buildCommonCustomScrollView(context, scrollController);
    }
  }

  Widget _buildCommonCustomScrollView(
    BuildContext context,
    ScrollController scrollController,
  ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              // const InformationCourse(),
              // HeaderItem(
              //   img: Assets.svg.schedule.iconSchedule
              //       .svg(height: 80.w, width: 80.w),
              //   lowerContent: AppLocalizations.of(context)!.schedule_title,
              //   upperContent: AppLocalizations.of(context)!.schedule,
              //   lowerSubContent:
              //       AppLocalizations.of(context)!.schedule_sub_title,
              // ),
            ],
          ),
        ),
        BlocBuilder<FeedbackListCubit, FeedbackListState>(
          builder: (_, state) {
            switch (state.runtimeType) {
              case FeedbackListLoading:
                return const SliverToBoxAdapter(
                    child: Center(child: CupertinoActivityIndicator()));
              case FeedbackListFailed:
                return const SliverToBoxAdapter(
                    child: Center(child: Icon(Ionicons.refresh)));
              case FeedbackListSuccess:
                return _buildCourse(
                  context,
                  state.feedbacks,
                  state.noMoreData,
                );
              default:
                return const SizedBox();
            }
          },
        ),

/*
        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 14, bottom: 32),
              child: CupertinoActivityIndicator(),
            ),
          )
*/
      ],
    );
  }

  Widget _buildCourse(
    BuildContext context,
    List<FeedBack.Feedback> feedbacks,
    bool noMoreData,
  ) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: feedbacks.length,
        (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            CommentItem(
              image: Image.network(
                feedbacks[index].firstInfo.avatar,
                errorBuilder: (context, exception, stackTrace) {
                  return Assets.images.img.image(fit: BoxFit.cover);
                },
              ),
              message: feedbacks[index].content,
              name: feedbacks[index].firstInfo.name,
              time: feedbacks[index].createdAt,
              rating: feedbacks[index].rating,
            ),
          ],
        ),
      ),
    );
  }
}
