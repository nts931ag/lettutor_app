// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/presentation/commons/widgets/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/commons/widgets/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/presentation/commons/widgets/text_field/input_field_profile_widget.dart';
import 'package:lettutor_app/presentation/widgets/profile/want_to_learn_wrap.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';

class ProfileField extends StatelessWidget {
  const ProfileField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
      child: Column(children: [
        //
        InputFieldProfile(
          title: AppLocalizations.of(context)!.profile_name,
          isImportant: true,
          child: baseTextField(
              // TODO: fill data
              onChanged: (value) {},
              controller: null,

              // controller: controller.controllers[nameField],
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: AppLocalizations.of(context)!.profile_email_address,
          child: baseTextField(
              readOnly: true,
              onChanged: (value) {},
              controller: null,
              // controller: controller.controllers[emailField],
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: AppLocalizations.of(context)!.profile_country,
          isImportant: true,
          child: baseTextField(
              onChanged: (value) {},
              controller: null,
              icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.expand_more,
                    size: 25,
                  )),
              // controller: controller.controllers[countryField],
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: AppLocalizations.of(context)!.profile_phone,
          isImportant: true,
          child: baseTextField(
              readOnly: true,
              onChanged: (value) {},
              controller: null,
              // controller: controller.controllers[phoneField],
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: AppLocalizations.of(context)!.profile_birthday,
          isImportant: true,
          child: baseTextField(
              onChanged: (value) {},
              controller: null,
              // controller: controller.controllers[birthayDayField],
              icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_today,
                    size: 15,
                  )),
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: AppLocalizations.of(context)!.profile_my_level,
          isImportant: true,
          child: baseTextField(
              icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.expand_more,
                    size: 25,
                  )),
              onChanged: (value) {},
              controller: null,
              // controller: controller.controllers[levelField],
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: AppLocalizations.of(context)!.profile_want_learn,
          isImportant: true,
          child: const WantToLearnWrap(),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: AppLocalizations.of(context)!.profile_study_schedule,
          child: baseTextField(
              maxLine: 4,
              onChanged: (value) {},
              controller: null,
              // controller: controller.controllers[studyScheduleField],
              hintText:
                  'Note the time of the week you want to study on LetTutor'),
        ),
        SizedBox(height: 15.h),
        //
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height: 40.h,
            width: 130.w,
            child: LoadingButtonWidget(
                submit: () {},
                isLoading: false,
                label: AppLocalizations.of(context)!.save),
          ),
        )
      ]),
    );
  }
}
