import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/presentation/commons/widgets/buttons/loading_button_widget.dart';
import 'package:lettutor_app/resource/colors/colors_core.dart';
import 'package:lettutor_app/resource/dimens.dart';
import 'package:lettutor_app/resource/theme/text_theme.dart';

class HeaderDashboard extends StatelessWidget {
  const HeaderDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.0.h),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.dash_board_up_coming,
            style: text28.copyWith(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
          SizedBox(
            height: 10.h,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                'T4, 19 Thg 10 22 00:00 - 00:25',
                textAlign: TextAlign.center,
                style: text18.copyWith(color: whiteColor),
              ),
              Text(
                '(còn 06:51:34)',
                style: text16.copyWith(color: yellowColor),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            AppLocalizations.of(context)!.dash_board_total_time,
            textAlign: TextAlign.center,
            style: text18.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
            child: LoadingButtonWidget(
              submit: () {},
              isLoading: false,
              height: 35.h,
              textColor: primaryColor,
              primaryColor: Colors.white,
              label: AppLocalizations.of(context)!.dash_board_enter_room,
            ),
          ),
        ],
      ),
    );
  }
}
