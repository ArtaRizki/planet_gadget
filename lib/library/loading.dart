import 'package:flutter/material.dart';

import 'color.dart';

Widget loadingWidget = Center(
    child: CircularProgressIndicator(color: primaryGreen, strokeWidth: 2));

Widget loadingWidgetFixedSize = SizedBox(
    width: 40,
    height: 40,
    child: FittedBox(
        child: CircularProgressIndicator(color: primaryGreen, strokeWidth: 2)));
