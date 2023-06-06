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
      color: isError ? Colors.red : tertiaryGreen,
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
                          ? "assets/icons/katalog/x-circle-white.svg"
                          : "assets/icons/katalog/check-circle-white.svg",
                    ),
                  ),
                  Flexible(
                    child: Text(
                      txt,
                      style: inter14BoldWhite(),
                      maxLines: 2,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => FToast().removeCustomToast(),
              child: const Icon(
                Icons.close,
                color: Colors.white,
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
