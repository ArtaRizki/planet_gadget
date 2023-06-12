import 'package:flutter/material.dart';
import 'package:planet_gadget/main.dart';

import '../../library/color.dart';
import '../../library/textstyle.dart';

appBarWidget(
    {required String title,
    required BuildContext context,
    PreferredSizeWidget? bottom,
    double height = 0}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight + height),
    child: AppBar(
      bottom: bottom,
      leadingWidth: 60,
      elevation: 0,
      backgroundColor: white,
      foregroundColor: black,
      titleSpacing: 0,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Icon(
            Icons.navigate_before,
            color: black,
            size: 32,
          ),
        ),
      ),
      title: Text(title, style: inter20Bold()),
    ),
  );
}
