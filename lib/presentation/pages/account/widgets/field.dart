import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:planet_gadget/library/textstyle.dart';
import '../../../../library/color.dart';
import '../../../../library/decoration.dart';

Widget field(
    {required String name,
    required String hint,
    required String error,
    required TextEditingController controller,
    required Function(String)? onchanged,
    Function()? changeVisiblePassword,
    bool? visiblePassword,
    bool isPassword = false,
    bool required = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(name, style: inter14Medium()),
            required ? Text("*", style: inter14MediumRed()) : const SizedBox(),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: visiblePassword ?? false,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onchanged,
          style: inter14Medium(),
          cursorColor: primaryBlue,
          decoration: generalDecoration(hint, error,
              isPassword: isPassword,
              onClickSuffix: changeVisiblePassword,
              visiblePassword: visiblePassword ?? false),
          scrollPadding: const EdgeInsets.only(bottom: 52),
        ),
        const SizedBox(height: 4),
        Text(error, style: redValidateErrorRequired()),
        SizedBox(height: error != "" ? 8 : 0),
      ],
    ),
  );
}

Widget fieldAddress(
    {required String name,
    required String hint,
    required String error,
    required TextEditingController controller,
    required Function(String)? onchanged,
    bool required = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: inter14Medium()),
            required ? Text("*", style: inter14MediumRed()) : const SizedBox(),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onchanged,
          style: inter14Medium(),
          cursorColor: primaryBlue,
          decoration: generalDecoration(hint, error),
          scrollPadding: const EdgeInsets.only(bottom: 24),
        ),
        const SizedBox(height: 4),
        Text(error, style: redValidateErrorRequired()),
        SizedBox(height: error != "" ? 8 : 0),
      ],
    ),
  );
}

Widget searchField(
    {required String hint,
    required TextEditingController controller,
    required Function(String)? onChanged,
    required Function() onClear,
    bool borderColor = false,
    bool required = false}) {
  return TextFormField(
    controller: controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onChanged: onChanged,
    style: inter14Medium(),
    cursorColor: primaryBlue,
    decoration: searchDecoration(hint,
        onClear: onClear,
        borderColor: borderColor ? secondaryBlue : null,
        clearIcon: controller.text.isNotEmpty),
    scrollPadding: const EdgeInsets.only(bottom: 52),
  );
}
