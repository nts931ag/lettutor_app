import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/commons/widgets/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/commons/widgets/text_field/baset_text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';

class InputFieldArea extends StatelessWidget {
  const InputFieldArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.email_title,
          style: text14.copyWith(color: greyColor),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 8.h,
        ),
        baseTextField(onChanged: (value) {}, controller: null, hintText: ''),
        SizedBox(
          height: 20.h,
        ),
        LoadingButtonWidget(
          submit: () {},
          isLoading: false,
          label: AppLocalizations.of(context)!.confirm,
        )
      ],
    );
  }
}
