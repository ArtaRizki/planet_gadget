import 'package:flutter/material.dart';
import 'package:planet_gadget/library/textstyle.dart';
import '../../../../library/color.dart';

Widget bottomButton({required Function()? onClick}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    color: white,
    child: InkWell(
      onTap: onClick,
      overlayColor: MaterialStateProperty.resolveWith((states) =>
          states.contains(MaterialState.pressed) ? secondaryBlue : null),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: primaryBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Logout", style: inter16BoldWhite()),
          ],
        ),
      ),
    ),
  );
}
