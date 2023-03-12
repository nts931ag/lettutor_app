import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor_app/res/colors/colors_core.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

TextFormField baseTextField(
    {required Function(String) onChanged,
    required TextEditingController? controller,
    required String hintText,
    void Function()? onTap,
    bool readOnly = false,
    bool isObscure = false,
    bool isPhone = false,
    int maxLine = 1,
    int? maxLength,
    Widget? icon,
    double radius = 5.0,
    FormFieldValidator<String>? validator}) {
  return TextFormField(
    onTap: onTap,
    readOnly: readOnly,
    maxLines: maxLine,
    inputFormatters: [
      LengthLimitingTextInputFormatter(maxLength),
    ],
    obscureText: isObscure,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    textAlign: TextAlign.start,
    validator: validator,
    textCapitalization: TextCapitalization.words,
    keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
    style: text12,
    //focusNode: focusNode,
    onChanged: onChanged,
    decoration: InputDecoration(
      hintStyle: text12.copyWith(color: greyColor),
      filled: true,
      fillColor: whiteColor,
      hintText: hintText,
      suffixIcon: icon,
      focusedBorder: underLineIntputBorder(
          width: 2, color: greyBorderColor, radius: radius),
      enabledBorder: underLineIntputBorder(
          width: 2, color: greyBorderColor, radius: radius),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 15.w,
      ),
      isDense: true,
    ),
  );
}

OutlineInputBorder underLineIntputBorder(
    {required double width, required color, required radius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(
      color: color,
    ),
  );
}
