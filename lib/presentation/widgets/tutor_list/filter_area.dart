import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/text/text_container_widget.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterTutorArea extends StatelessWidget {
  const FilterTutorArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.dash_board_find_tutor,
          style:
              text28.copyWith(color: primaryColor, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.start,
                // controller: _txtController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(FontAwesomeIcons.search),
                      onPressed: () {},
                      color: Colors.black12,
                    ),
                    contentPadding: const EdgeInsets.all(18),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                    hintText: 'Enter tutor name',
                    hintStyle: const TextStyle(color: Colors.black12)),
                onChanged: (value) {
                  // onSearch("$value");
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.filter),
              iconSize: 20,
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: whiteColor,
            padding: EdgeInsets.all(8.w),
            textStyle: text14,
          ),
          child: Text(AppLocalizations.of(context)!.dash_board_reset_filter),
        ),
      ],
    );
  }
}
