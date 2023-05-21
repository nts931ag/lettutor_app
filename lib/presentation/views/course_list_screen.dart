// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lettutor_app/config/router/router.dart';
import 'package:lettutor_app/config/router/router_arguments.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:lettutor_app/domain/models/Course.dart';
import 'package:lettutor_app/gen/assets.gen.dart';
import 'package:lettutor_app/presentation/cubits/course/course_list_cubit.dart';
import 'package:lettutor_app/presentation/widgets/commons/box_shadow_container.dart';
import 'package:lettutor_app/presentation/widgets/commons/course_item.dart';
import 'package:lettutor_app/presentation/widgets/commons/tab_bar/tab_bar_item.dart';
import 'package:lettutor_app/presentation/widgets/commons/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/presentation/widgets/course_list/filter_courses_area.dart';
import 'package:lettutor_app/presentation/widgets/course_list/header_course.dart';
import 'package:lettutor_app/utils/extensions/scroll_controller_extensions.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseListScreen extends HookWidget {
  const CourseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseListCubit = BlocProvider.of<CourseListCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListener(() {
        courseListCubit.getCourseWithPagination(isScrollToLoadMore: true);
      });

      return scrollController.dispose;
    }, const []);

    /*return BlocBuilder<CourseListCubit, CourseListState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case CourseListLoading:
            return const Center(child: CupertinoActivityIndicator());
          case CourseListFailed:
            return const Center(child: Icon(Ionicons.refresh));
          case CourseListSuccess:
            return _buildCourses(
              context,
              scrollController,
              state.courses,
              state.noMoreData,
            );
          default:
            return const SizedBox();
        }
      },
    );*/
    return _buildCommonCustomScrollView(context, scrollController);
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
              const FilterCourseArea(),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
        ),
        BlocBuilder<CourseListCubit, CourseListState>(
          builder: (_, state) {
            switch (state.runtimeType) {
              case CourseListLoading:
                return const SliverToBoxAdapter(
                    child: Center(child: CupertinoActivityIndicator()));
              case CourseListFailed:
                return const SliverToBoxAdapter(
                    child: Center(child: Icon(Ionicons.refresh)));
              case CourseListEmptySuccess:
                return SliverToBoxAdapter(
                    child: Center(child: Column(
                      children: [
                        const Icon(Icons.search_off_rounded),
                        Text('No matched course!', style: text14,)
                      ],
                    )));
              case CourseListSuccess:
                return _buildCourse(
                  context,
                  state.courses,
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
    List<Course> courses,
    bool noMoreData,
  ) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: courses.length,
        (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            BoxShadowContainer(
              onTap: () {
                Navigator.pushNamed(context, MyRouter.courseDetail,
                    arguments: CourseDetailArguments(course: courses[index]));
              },
              width: 280.w,
              padding: EdgeInsets.only(bottom: 20.h),
              child: CourseItem(
                mainTitle: courses[index].name,
                subTitle: courses[index].description,
                bottomWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Level ${courses[index].level}", style: text14),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        border: Border.fromBorderSide(
                          BorderSide(color: Colors.white, width: 3.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(courses[index].topics!.length.toString(),
                        style: text14),
                    Text(
                      " ${AppLocalizations.of(context)!.course_lessons}",
                      style: text14,
                    ),
                  ],
                ),
                image: Image.network(
                  courses[index].imageUrl,
                  errorBuilder: (context, exception, stackTrace) {
                    return Assets.images.imgCourse1.image(fit: BoxFit.cover);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
