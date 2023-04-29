// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:lettutor_app/domain/models/Course.dart';
import 'package:lettutor_app/gen/assets.gen.dart';
import 'package:lettutor_app/presentation/cubits/course/course_list_cubit.dart';
import 'package:lettutor_app/presentation/widgets/commons/box_shadow_container.dart';
import 'package:lettutor_app/presentation/widgets/commons/course_item.dart';
import 'package:lettutor_app/presentation/widgets/commons/tab_bar/tab_bar_item.dart';
import 'package:lettutor_app/presentation/widgets/commons/text_field/baset_text_field_widget.dart';
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
        courseListCubit.getCourseWithPagination();
      });

      return scrollController.dispose;
    }, const []);

    return BlocBuilder<CourseListCubit, CourseListState>(
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
    );
  }

  Widget _buildCourses(
    BuildContext context,
    ScrollController scrollController,
    List<Course> courses,
    bool noMoreData,
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
              const HeaderCourse(),
              SizedBox(
                height: 20.h,
              ),
              Text(
                AppLocalizations.of(context)!.course_content,
                style: text15,
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: Get.width / 2 - 25.w,
                        child: BaseTextField(
                            onChanged: (value) {},
                            controller: null,
                            hintText:
                                AppLocalizations.of(context)!.course_level,
                            icon: const Icon(Icons.expand_more)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: Get.width / 2 - 25.w,
                        child: BaseTextField(
                            onChanged: (value) {},
                            controller: null,
                            hintText:
                                AppLocalizations.of(context)!.course_sort_lv,
                            icon: const Icon(Icons.expand_more)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: Get.width / 2 - 25.w,
                    child: BaseTextField(
                        onChanged: (value) {},
                        controller: null,
                        hintText: AppLocalizations.of(context)!.course_category,
                        icon: const Icon(Icons.expand_more)),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              // TabBarview(),
              Row(
                children: [
                  TabBarItem(
                    // onTap: () {
                    //   controller.onTapInDexTabBar(0);
                    // },
                    // title: LocalString.course,
                    // isSelecting: 0 == controller.index.value,
                    title: AppLocalizations.of(context)!.course,
                    isSelecting: true,
                  ),
                  SizedBox(width: 20.w),
                  TabBarItem(
                    // onTap: () {
                    //   controller.onTapInDexTabBar(1);
                    // },
                    // title: LocalString.eBook,
                    // isSelecting: 1 == controller.index.value,
                    title: AppLocalizations.of(context)!.e_book,
                    isSelecting: true,
                  ),
                  SizedBox(width: 20.w),
                  TabBarItem(
                    // onTap: () {
                    //   controller.onTapInDexTabBar(2);
                    // },
                    // title: LocalString.ieBook,
                    // isSelecting: 2 == controller.index.value,
                    title: AppLocalizations.of(context)!.i_e_book,
                    isSelecting: true,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
        SliverList(
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
                    // TODO: Navigation to COURSE OVERALL SCREEN
                    // Get.toNamed(AppRoutes.COURSE_DETAIL);
                  },
                  width: 280.w,
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: CourseItem(
                    mainTitle: courses[index].name,
                    subTitle: courses[index].description,
                    bottomWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(courses[index].level, style: text14),
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
                          AppLocalizations.of(context)!.course_lessons,
                          style: text14,
                        ),
                      ],
                    ),
                    image: Image.network(
                      courses[index].imageUrl,
                      errorBuilder: (context, exception, stackTrace) {
                        return Assets.images.imgCourse1
                            .image(fit: BoxFit.cover);
                      },
                    ),
                  ),
                ),
              ],
            ),
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
}
