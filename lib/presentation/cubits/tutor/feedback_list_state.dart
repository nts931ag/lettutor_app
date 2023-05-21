part of 'feedback_list_cubit.dart';

abstract class FeedbackListState extends Equatable {
  final List<Feedback> feedbacks;
  final bool noMoreData;
  final DioError? error;

  const FeedbackListState(
      {this.feedbacks = const [], this.noMoreData = true, this.error});

  @override
  List<Object?> get props => [feedbacks, noMoreData, error];
}

class FeedbackListLoading extends FeedbackListState {
  const FeedbackListLoading();
}

class FeedbackListSuccess extends FeedbackListState {
  const FeedbackListSuccess({super.feedbacks, super.noMoreData});
}

class FeedbackListFailed extends FeedbackListState {
  const FeedbackListFailed({super.error});
}
