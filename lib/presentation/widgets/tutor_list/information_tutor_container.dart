import 'package:country_code_picker/country_code_picker.dart';
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
import 'package:lettutor_app/presentation/cubits/schedule/schedule_list_cubit.dart';
import 'package:lettutor_app/presentation/cubits/tutor/tutor_detail_cubit.dart';
import 'package:lettutor_app/presentation/cubits/tutor/tutor_list_cubit.dart';
import 'package:lettutor_app/presentation/widgets/commons/box_shadow_container.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/icon/circle_box_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/text/text_container_widget.dart';
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
                    /*Row(
                      children: [
                        Assets.svg.common.iconUs.svg(height: 15.w, width: 25.w),
                        SizedBox(width: 15.w),
                        Text(
                          tutor.country,
                          style: text16,
                        ),
                      ],
                    ),*/
                    CountryCodePicker(
                      onChanged: (value) {},
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: tutor.country,
                      // optional. Shows only country name and flag
                      showCountryOnly: true,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: true,
                      // optional. aligns the flag and the Text left
                      alignLeft: true,
                      enabled: false,
                      textStyle: text14,
                      padding: EdgeInsets.zero,
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
                        ...tutor.specialties.split(',').map(
                              (e) => TextContainer(
                                title: translateFrom(
                                    TutorSpecialty.from(e), context),
                                textColor: primaryColor,
                                color: primaryColor.withOpacity(0.2),
                              ),
                            )
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
                                            context),
                                    scheduleListCubit:
                                        BlocProvider.of<ScheduleListCubit>(
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

  String translateFrom(
      TutorSpecialty typeMentorCategory, BuildContext context) {
    switch (typeMentorCategory) {
      case TutorSpecialty.ALL:
        return AppLocalizations.of(context)!.tutorCategory_all;
      case TutorSpecialty.E_4_KIDS:
        return AppLocalizations.of(context)!.tutorCategory_eng4kids;
      case TutorSpecialty.E_4_BUSINESS:
        return AppLocalizations.of(context)!.tutorCategory_eng4business;
      case TutorSpecialty.CONVERSATIONAL:
        return AppLocalizations.of(context)!.tutorCategory_conversational;
      case TutorSpecialty.STARTERS:
        return AppLocalizations.of(context)!.tutorCategory_starter;
      case TutorSpecialty.MOVERS:
        return AppLocalizations.of(context)!.tutorCategory_mover;
      case TutorSpecialty.FLYERS:
        return AppLocalizations.of(context)!.tutorCategory_flyer;
      case TutorSpecialty.KET:
        return AppLocalizations.of(context)!.tutorCategory_ket;
      case TutorSpecialty.PET:
        return AppLocalizations.of(context)!.tutorCategory_pet;
      case TutorSpecialty.IELTS:
        return AppLocalizations.of(context)!.tutorCategory_ielts;
      case TutorSpecialty.TOELF:
        return AppLocalizations.of(context)!.tutorCategory_toefl;
      case TutorSpecialty.TOEIC:
        return AppLocalizations.of(context)!.tutorCategory_toeic;
      case TutorSpecialty.FOREIGN_LANGUAGES:
        return AppLocalizations.of(context)!.tutorCategory_fl;
      case TutorSpecialty.MARKETING:
        return AppLocalizations.of(context)!.tutorCategory_mt;
      case TutorSpecialty.OFFICE_INFORMATION:
        return AppLocalizations.of(context)!.tutorCategory_of;
      case TutorSpecialty.DESIGN:
        return AppLocalizations.of(context)!.tutorCategory_ds;
      case TutorSpecialty.BUSINESS:
        return AppLocalizations.of(context)!.tutorCategory_bs;
      case TutorSpecialty.HEALTH_CARE:
        return AppLocalizations.of(context)!.tutorCategory_hc;
      case TutorSpecialty.INFORMATION_TECHNOLOGY:
        return AppLocalizations.of(context)!.tutorCategory_it;
      case TutorSpecialty.COMMUNICATION:
        return AppLocalizations.of(context)!.tutorCategory_cm;
      case TutorSpecialty.TOEIC_2_SKILLS:
        return AppLocalizations.of(context)!.tutorCategory_t2;
      case TutorSpecialty.TOEIC_4_SKILLS:
        return AppLocalizations.of(context)!.tutorCategory_t4;
      default:
        return '';
    }
  }
}

enum TutorSpecialty {
  NULL(null),
  ALL(null),
  E_4_KIDS(3),
  E_4_BUSINESS(4),
  CONVERSATIONAL(5),
  STARTERS(1),
  MOVERS(2),
  FLYERS(3),
  KET(4),
  PET(5),
  IELTS(6),
  TOELF(7),
  TOEIC(8),
  FOREIGN_LANGUAGES(9),
  MARKETING(10),
  OFFICE_INFORMATION(11),
  DESIGN(12),
  BUSINESS(13),
  HEALTH_CARE(14),
  INFORMATION_TECHNOLOGY(15),
  COMMUNICATION(16),
  TOEIC_2_SKILLS(17),
  TOEIC_4_SKILLS(18);

  final int? digitCode;

  const TutorSpecialty(this.digitCode);

  static Map<String, TutorSpecialty> tutorSpecialtyOfCodeMap = {
    'business-english': TutorSpecialty.E_4_BUSINESS,
    'conversational-english': TutorSpecialty.CONVERSATIONAL,
    'english-for-kids': TutorSpecialty.E_4_KIDS,
    'ielts': TutorSpecialty.IELTS,
    'starters': TutorSpecialty.STARTERS,
    'movers': TutorSpecialty.MOVERS,
    'flyers': TutorSpecialty.FLYERS,
    'ket': TutorSpecialty.KET,
    'pet': TutorSpecialty.PET,
    'toefl': TutorSpecialty.TOELF,
    'toeic': TutorSpecialty.TOEIC,
    "fl": TutorSpecialty.FOREIGN_LANGUAGES,
    "mt": TutorSpecialty.MARKETING,
    "of": TutorSpecialty.OFFICE_INFORMATION,
    "ds": TutorSpecialty.DESIGN,
    "bs": TutorSpecialty.BUSINESS,
    "hc": TutorSpecialty.HEALTH_CARE,
    "it": TutorSpecialty.INFORMATION_TECHNOLOGY,
    "cm": TutorSpecialty.COMMUNICATION,
    "eb": TutorSpecialty.E_4_BUSINESS,
    "ek": TutorSpecialty.E_4_KIDS,
    "ie": TutorSpecialty.IELTS,
    "t2": TutorSpecialty.TOEIC_2_SKILLS,
    "t4": TutorSpecialty.TOEIC_4_SKILLS
  };

  static TutorSpecialty from(String? specialtyCode) {
    if (specialtyCode == null) {
      return TutorSpecialty.NULL;
    }
    return tutorSpecialtyOfCodeMap[specialtyCode] ?? TutorSpecialty.NULL;
  }

  String toCode() {
    return tutorSpecialtyOfCodeMap.keys
        .where((key) => tutorSpecialtyOfCodeMap[key] == this)
        .first;
  }
}
