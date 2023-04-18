import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor_app/resource/dimens.dart';
import 'package:lettutor_app/resource/theme/text_theme.dart';


class InputFieldProfile extends StatelessWidget {
  String title;
  bool isImportant;
  Widget child;
  InputFieldProfile({
    Key? key,
    required this.title,
    required this.child,
    this.isImportant = false,
  }) : super(key: key);
  @override
  Widget build(Object context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: text14,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              width: 1.0.w,
            ),
            if (isImportant) const Icon(Icons.tag, color: Colors.red, size: 10)
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        child
      ],
    );
  }
}
