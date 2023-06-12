import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'color.dart';
import 'textstyle.dart';

showToast(String txt, BuildContext context, {bool isError = false}) {
  FToast fToast;
  Widget toast = Container(
    width: MediaQuery.of(context).size.width * 0.75,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: isError ? Colors.red : successToastColor,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: SvgPicture.asset(
                      isError
                          ? "assets/icons/x-circle-white.svg"
                          : "assets/icons/check-circle.svg",
                    ),
                  ),
                  Flexible(
                    child: Text(
                      txt,
                      style: inter14Bold(),
                      maxLines: 2,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => FToast().removeCustomToast(),
              child: Icon(
                Icons.close,
                color: isError ? errorTextColor : successTextColor,
              ),
            )
          ],
        ),
      ],
    ),
  );
  // Custom Toast Position
  fToast = FToast();
  fToast.init(context);
  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
      gravity: ToastGravity.BOTTOM);
}
