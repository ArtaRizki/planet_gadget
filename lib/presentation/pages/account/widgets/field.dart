import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:planet_gadget/library/textstyle.dart';
import '../../../../library/color.dart';
import '../../../../library/decoration.dart';

Widget field(
    {required String name,
    required String value,
    required String hint,
    required String error,
    required String suggest,
    required bool empty,
    required TextEditingController controller,
    required Function(String)? onchanged}) {
  log("ERROR : $error");
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(name, style: inter14Medium()),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onchanged,
          style: inter14Medium(),
          cursorColor: primaryBlue,
          decoration: generalDecoration(hint, error),
          scrollPadding: const EdgeInsets.only(bottom: 52),
        ),
        const SizedBox(height: 8),
        Text(empty ? error : "", style: redValidateErrorRequired()),
        const SizedBox(height: 16),
      ],
    ),
  );
}
