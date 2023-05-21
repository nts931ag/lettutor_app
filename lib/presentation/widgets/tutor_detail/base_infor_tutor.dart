import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/config/router/router.dart';
import 'package:lettutor_app/config/router/router_arguments.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/locator.dart';
import 'package:lettutor_app/presentation/cubits/tutor/tutor_detail_cubit.dart';
import 'package:lettutor_app/presentation/widgets/commons/icon/circle_box_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/icon/icon_text_widget.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';

class BaseInforTutor extends StatelessWidget {
  const BaseInforTutor({
    required this.tutor,
    Key? key,
  }) : super(key: key);

  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    final tutorDetailCubit = BlocProvider.of<TutorDetailCubit>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 35.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleBox(
                  size: 110.w,
                  child: Image.network(
                    tutor.avatar,
                    errorBuilder: (context, exception, stackTrace) {
                      return Assets.images.img.image(fit: BoxFit.cover);
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tutor.name,
                        style: text20.copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      RatingBar.builder(
                        initialRating: tutor.rating,
                        minRating: 0,
                        maxRating: 5,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 2.r,
                      blurRadius: 3.r,
                      offset: Offset(0, 3))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.tutor_detail_about_me,
                  style: text20.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  tutor.bio,
                  style: text16.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  tutorDetailCubit.onAddTutorFavourite();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                      'Add favourite tutor successfully!',
                      style: text14,
                    )),
                  );
                },
                child: BlocBuilder<TutorDetailCubit, TutorDetailState>(
                  buildWhen: (pre, cur) =>
                      pre.tutor.isFavoriteTutor != cur.tutor.isFavoriteTutor,
                  builder: (context, state) {
                    return IconText(
                      iconData: state.tutor.isFavoriteTutor == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      colorIcon: state.tutor.isFavoriteTutor == true
                          ? Colors.redAccent
                          : null,
                      title: AppLocalizations.of(context)!.favorite,
                    );
                  },
                ), /*tutor.isFavoriteTutor == true
                    ? IconText(
                        iconData: Icons.favorite,
                        colorIcon: Colors.redAccent,
                        title: AppLocalizations.of(context)!.favorite,
                      )
                    : IconText(
                        iconData: Icons.favorite_border,
                        title: AppLocalizations.of(context)!.favorite,
                      ),*/
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ReportDialog(
                        title: "Report ${tutor.name}",
                        onSubmit: (content) {
                          tutorDetailCubit.onReportTutor(content);
                          // provider.reportTutor(message);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                              'Report tutor successfully!',
                              style: text14,
                            )),
                          );
                        },
                      );
                    },
                  );
                },
                child: IconText(
                  iconData: Icons.report_outlined,
                  title: AppLocalizations.of(context)!.report,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MyRouter.reviews,
                    arguments: ReviewsArguments(
                        tutorId: tutor.userId,
                        apiRepository: locator<ApiRepository>()),
                  );
                },
                child: IconText(
                  iconData: Icons.reviews_outlined,
                  title: AppLocalizations.of(context)!.reviews,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ReportDialog extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final String title;
  final Function(String message) onSubmit;

  ReportDialog({super.key, required this.title, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: _textEditingController,
        decoration: const InputDecoration(hintText: 'Enter your report here'),
        maxLines: null,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            String report = _textEditingController.text.trim();
            onSubmit(report);
            Navigator.pop(context);
          },
          child: const Text('Report'),
        ),
      ],
    );
  }
}
