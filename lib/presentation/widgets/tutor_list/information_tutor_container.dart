import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/config/router/router.dart';
import 'package:lettutor_app/config/router/router_arguments.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/locator.dart';
import 'package:lettutor_app/presentation/cubits/tutor/tutor_detail_cubit.dart';
import 'package:lettutor_app/presentation/cubits/tutor/tutor_list_cubit.dart';
import 'package:lettutor_app/presentation/widgets/commons/box_shadow_container.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/icon/circle_box_widget.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:lettutor_app/utils/utils.dart';

class InformationTutorContainer extends StatelessWidget {
  final Tutor tutor;

  const InformationTutorContainer({
    Key? key,
    required this.tutor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 33.h,
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w),
              child: BoxShadowContainer(
                padding: EdgeInsets.all(30.w),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                width: Get.width - 20.w - 6.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleBox(
                        size: 80.w,
                        child: Image.network(
                          tutor.avatar,
                          errorBuilder: (context, exception, stackTrace) {
                            return Assets.images.img.image(fit: BoxFit.cover);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      tutor.name,
                      style: text20.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Assets.svg.common.iconUs.svg(height: 15.w, width: 25.w),
                        SizedBox(width: 15.w),
                        Text(
                          tutor.country,
                          style: text16,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    tutor.rating == 0
                        ? Text(
                            AppLocalizations.of(context)!.dash_board_no_review,
                            style: text16.copyWith(color: Colors.grey),
                          )
                        : RatingBar.builder(
                            initialRating: tutor.rating,
                            minRating: tutor.rating,
                            maxRating: tutor.rating,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 5,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Wrap(
                      spacing: 5.w,
                      runSpacing: 10.h,
                      children: [
                        // TODO: fill list type
                        // ...controller.listType
                        //     .map((e) => TextContainer(
                        //           title: e,
                        //           textColor: primaryColor,
                        //           color: primaryColor.withOpacity(0.2),
                        //         ))
                        //     .toList()
                      ],
                    ),
                    Container(
                      // height: getDescriptionHeight(context),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      child: Text(
                        tutor.bio,
                        /*style: bodyLarge(context)
                            ?.copyWith(color: CustomColor.greyTextColor),
                        */
                        textAlign: TextAlign.justify,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: Get.width / 2 - 30.w,
                        child: LoadingButtonWidget(
                            submit: () {
                              Navigator.pushNamed(
                                context,
                                MyRouter.tutorDetail,
                                arguments: TutorDetailArguments(
                                    tutor: tutor,
                                    tutorListCubit:
                                        BlocProvider.of<TutorListCubit>(
                                            context)),
                              );
                            },
                            height: 30.h,
                            isLoading: false,
                            primaryColor: primaryColor.withOpacity(0.5),
                            label: AppLocalizations.of(context)!.book),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 30.w,
              top: 30.h,
              child: !tutor.isFavoriteTutor
                  ? const Icon(
                      Icons.favorite_border,
                      color: Colors.blue,
                    )
                  : const Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
