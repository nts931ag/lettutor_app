import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lettutor_app/presentation/commons/widgets/text/text_container_widget.dart';
import 'package:lettutor_app/resource/colors/colors_core.dart';
import 'package:lettutor_app/resource/dimens.dart';
import 'package:lettutor_app/resource/theme/text_theme.dart';
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
              child: Container(
                child: TextField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  // controller: _txtController,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(
                        FontAwesomeIcons.search,
                        color: Colors.black12,
                      ),
                      contentPadding: EdgeInsets.all(18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                      ),
                      hintText: 'Enter tutor name',
                      hintStyle: TextStyle(color: Colors.black12)),
                  onChanged: (value) {
                    // onSearch("$value");
                  },
                ),
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
        TextContainer(
          title: AppLocalizations.of(context)!.dash_board_reset_filter,
          color: Colors.white,
          borderColor: primaryColor,
          textColor: primaryColor,
        )
      ],
    );
  }
}
