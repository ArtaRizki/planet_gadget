import 'package:flutter/material.dart';

Color primaryYellow = const Color(0xffffd966);
Color secondaryYellow = const Color(0xffFFE28C);
Color tertiaryYellow = const Color(0xffFFF4D1);
Color quarteryYellow = const Color.fromRGBO(240, 252, 246, 1);
Color yellow5 = const Color(0xff2ECC71);
Color yellow6 = const Color(0xffF0FCF6);
Color white = const Color(0xffFCFCFC);

Color black = const Color(0xff252525);
Color blackDefault = Colors.black;
Color black2 = const Color(0xff494949);
Color black3 = const Color(0xff1f1f1f);

Color gray = const Color(0xffAAAAAA);
Color gray2 = const Color(0xff575757);
Color gray3 = const Color(0xff393939);
Color gray4 = const Color(0xffB6B6B6);
Color grayBorder = const Color(0xffd5d5d5);

Color red = const Color(0xffCB3A31);
Color red2 = const Color(0xffEEB4B0);
Color red3 = const Color(0xffFFF4F2);

Color menungguPembayaranTextC = const Color(0xff734011);
Color aktifTextC = const Color(0xff249955);
Color tidakAktifTextC = const Color(0xff8E8E8E);
Color dibatalkanTextC = const Color(0xffCB3A31);

Color menungguPembayaranC = const Color(0xffFFF9F2);
Color aktifC = const Color(0xffF0FCF6);
Color tidakAktifC = const Color(0xffD5D5D5);
Color dibatalkanC = const Color(0xffFFF4F2);

Color menungguPembayaranBorderC = const Color(0xffEEEECC);
Color aktifBorderC = const Color(0xff88D8CA);
Color tidakAktifBorderC = const Color(0xffD5D5D5);
Color dibatalkanBorderC = const Color(0xffFFF4F2);

Color hyperlinkBlue = const Color(0xff3267E3);
Color hyperlinkBlue20Opacity = const Color(0xffb1c5f6);
Color hyperlinkBlueSecond20Opacity = const Color(0xffb1c5f6);

Color enableDisableColor(bool value) {
  if (value) return primaryYellow;
  return gray;
}
