// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/presentation/cubits/tutor/tutor_list_cubit.dart';
import 'package:lettutor_app/presentation/widgets/tutor_list/filter_area.dart';
import 'package:lettutor_app/presentation/widgets/tutor_list/header_dash_board.dart';
import 'package:lettutor_app/presentation/widgets/tutor_list/information_tutor_container.dart';
import 'package:lettutor_app/utils/extensions/scroll_controller_extensions.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';

class TutorListScreen extends HookWidget {
  const TutorListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tutorListCubit = BlocProvider.of<TutorListCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListener(() {
        tutorListCubit.searchTutorsWithPagination();
      });

      return scrollController.dispose;
    }, const []);
/*
    return BlocBuilder<TutorListCubit, TutorListState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case TutorListLoading:
            return const Center(child: CupertinoActivityIndicator());
          case TutorListFailed:
            return const Center(child: Icon(Ionicons.refresh));
          case TutorListSuccess:
            return _buildTutors(
              scrollController,
              state.tutors,
              state.noMoreData,
            );
          default:
            return const SizedBox();
        }
      },
    );*/
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HeaderDashboard(),
            SizedBox(
              height: 33.h,
            ),
            const FilterTutorArea(),
            SizedBox(
              height: 33.h,
            ),
          ],
        ),
      ),
      BlocBuilder<TutorListCubit, TutorListState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case TutorListLoading:
              return const SliverToBoxAdapter(
                  child: Center(child: CupertinoActivityIndicator()));
            case TutorListFailed:
              return const SliverToBoxAdapter(
                  child: Center(child: Icon(Ionicons.refresh)));
            case TutorListSuccess:
              return _buildTutorCustom(
                context,
                state.tutors,
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

Widget _buildTutorCustom(
  BuildContext context,
  List<Tutor> tutors,
  bool noMoreData,
) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      childCount: tutors.length,
      (context, index) => InformationTutorContainer(
        tutor: tutors[index],
      ),
    ),
  );
}

Widget _buildTutors(
  ScrollController scrollController,
  List<Tutor> tutors,
  bool noMoreData,
) {
  return CustomScrollView(
    controller: scrollController,
    slivers: [
      SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HeaderDashboard(),
            SizedBox(
              height: 33.h,
            ),
            const FilterTutorArea(),
            SizedBox(
              height: 33.h,
            ),
          ],
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => InformationTutorContainer(
            tutor: tutors[index],
          ),
          childCount: tutors.length,
        ),
      ),
      if (!noMoreData)
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 14, bottom: 32),
            child: CupertinoActivityIndicator(),
          ),
        )
    ],
  );
}
