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
    int? maxLength,
    InkWell? icon,
    FormFieldValidator<String>? validator}) {
  return TextFormField(
    onTap: onTap,
    readOnly: readOnly,
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
      focusedBorder: underLineIntputBorder(width: 2, color: greyBorderColor),
      enabledBorder: underLineIntputBorder(width: 2, color: greyBorderColor),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 15.w,
      ),
      isDense: true,
    ),
  );
}

OutlineInputBorder underLineIntputBorder(
    {required double width, required color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0.r),
    borderSide: BorderSide(
      color: color,
    ),
  );
}
