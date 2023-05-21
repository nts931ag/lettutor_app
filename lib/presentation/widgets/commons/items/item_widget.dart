// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/config/router/router.dart';
import 'package:lettutor_app/config/router/router_arguments.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/icon/circle_box_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/information_area.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ItemWidget extends StatelessWidget {
  String date;
  String subTime;
  String name;
  String? studentMeetingLink;
  bool isDisableButton;
  Widget avatar;
  Widget imgNation;
  Widget child;
  String nation;

  ItemWidget(
      {Key? key,
      required this.date,
      required this.subTime,
      required this.name,
      required this.isDisableButton,
      required this.avatar,
      required this.imgNation,
      required this.child,
      this.studentMeetingLink,
      this.nation = 'IT'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width - 20.w,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r)),
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              date,
              style: text18.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              subTime,
              style: text15.copyWith(color: Colors.grey),
            ),
            SizedBox(height: 10.h),

            ///
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.w),
              child: Row(
                children: [
                  CircleBox(size: 68.w, child: avatar),
                  SizedBox(width: 10.w),
                  InformationArea(
                    img: imgNation,
                    name: name,
                    nation: nation,
                    child: Row(
                      children: [
                        Icon(
                          Icons.maps_ugc,
                          color: primaryColor,
                          size: 15.w,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          AppLocalizations.of(context)!.schedule_direct,
                          style: text15.copyWith(color: primaryColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),

            ///
            child,
            SizedBox(
              height: 10.h,
            ),

            ///
            !isDisableButton
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 150.w,
                      height: 40.h,
                      child: LoadingButtonWidget(
                          primaryColor: primaryColor,
                          submit: () {
                            // _goMeeting(context);
                            Navigator.pushNamed(context, MyRouter.joinMeeting,
                                arguments: MeetingArguments(
                                    studentMeetingLink: studentMeetingLink!));
                          },
                          isLoading: false,
                          label: AppLocalizations.of(context)!
                              .schedule_go_meeting),
                    ),
                  )
                : const SizedBox()
          ],
        ));
  }
//
// _goMeeting(BuildContext context, ) async {
// }
}
