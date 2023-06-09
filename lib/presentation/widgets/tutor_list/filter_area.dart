import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lettutor_app/presentation/cubits/tutor/tutor_list_cubit.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterTutorArea extends StatefulWidget {
  const FilterTutorArea({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterTutorArea> createState() => _FilterTutorAreaState();
}

class _FilterTutorAreaState extends State<FilterTutorArea> {
  TextEditingController textEditingController = TextEditingController();
  List<String> specialitiesSelected = [''];

  @override
  Widget build(BuildContext context) {
    TutorListCubit tutorListCubit = BlocProvider.of<TutorListCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.dash_board_find_tutor,
          style:
              text28.copyWith(color: primaryColor, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 15.h,
        ),
        TextField(
          keyboardType: TextInputType.text,
          textAlign: TextAlign.start,
          controller: textEditingController,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(FontAwesomeIcons.search),
                onPressed: () {
                  tutorListCubit.searchTutorsWithPagination(
                      page: 1,
                      searchKey: textEditingController.text,
                      specialitiesSelected: specialitiesSelected
                  );
                },
                color: Colors.black12,
              ),
              contentPadding: const EdgeInsets.all(18),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              hintText: 'Enter tutor name',
              hintStyle: const TextStyle(color: Colors.black12)),
        ),
        SizedBox(
          height: 10.h,
        ),
        Card(
          elevation: 3,
          // margin: const EdgeInsets.all(5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SmartSelect<String>.multiple(
                  title: 'Specialities',
                  selectedValue: specialitiesSelected,
                  choiceItems: categories,
                  onChange: (selected) {
                    setState(() => specialitiesSelected = selected.value);
                    tutorListCubit.searchTutorsWithPagination(
                        page: 1,
                        searchKey: textEditingController.text,
                        specialitiesSelected: specialitiesSelected
                    );
                  },
                  modalType: S2ModalType.bottomSheet,
                  modalHeader: false,
                  tileBuilder: (context, state) {
                    return S2Tile.fromState(
                      state,
                      trailing: const Icon(Icons.arrow_drop_down),
                      isTwoLine: true,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextButton(
          onPressed: () {
            setState(() {
              specialitiesSelected = [''];
              textEditingController.text = '';
            });
            tutorListCubit.searchTutorsWithPagination(
              page: 1,
              searchKey: textEditingController.text,
              specialitiesSelected: specialitiesSelected
            );
          },
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

List<S2Choice<String>> categories = [
  S2Choice<String>(value: '', title: 'All'),
  S2Choice<String>(value: 'english-for-kids', title: 'English For Kids'),
  S2Choice<String>(value: 'business-english', title: 'English For Business'),
  S2Choice<String>(value: 'conversation-english', title: 'Conversational'),
  S2Choice<String>(value: 'starters', title: 'STARTERS'),
  S2Choice<String>(value: 'movers', title: 'MOVERS'),
  S2Choice<String>(value: 'flyers', title: 'FLYERS'),
  S2Choice<String>(value: 'KET', title: 'ket'),
  S2Choice<String>(value: 'PET', title: 'pet'),
  S2Choice<String>(value: 'ielts', title: 'IELTS'),
  S2Choice<String>(value: 'toeic', title: 'TOEIC'),
];
