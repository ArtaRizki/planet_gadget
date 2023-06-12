import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import '../utils/constants/path.dart';
import 'color.dart';
import 'textstyle.dart';

paketDetailDecoration(String hintTxt, bool isEmpty) {
  return InputDecoration(
      suffixIcon:
          Icon(Icons.warning, color: isEmpty ? Colors.red : Colors.transparent),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(
            color:
                isEmpty ? Colors.red : const Color.fromRGBO(24, 204, 113, 1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusColor: const Color.fromRGBO(24, 204, 113, 1),
      contentPadding: const EdgeInsets.all(10),
      alignLabelWithHint: true,
      hintText: hintTxt,
      hintStyle: inter14MediumBlack2());
}

paketDecoration(String hintTxt, bool isEmpty) {
  return InputDecoration(
      suffixIcon:
          Icon(Icons.warning, color: isEmpty ? Colors.red : Colors.transparent),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(
            color:
                isEmpty ? Colors.red : const Color.fromRGBO(24, 204, 113, 1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusColor: const Color.fromRGBO(24, 204, 113, 1),
      contentPadding: const EdgeInsets.all(10),
      alignLabelWithHint: true,
      hintText: hintTxt,
      hintStyle: inter14MediumBlack2());
}

paketDetailHargaJualDisableDecoration(String hintTxt, bool isEmpty) {
  return InputDecoration(
      filled: true,
      fillColor: const Color.fromRGBO(176, 176, 176, 0.5),
      suffixIcon:
          Icon(Icons.warning, color: isEmpty ? Colors.red : Colors.transparent),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(
            color:
                isEmpty ? Colors.red : const Color.fromRGBO(24, 204, 113, 1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusColor: const Color.fromRGBO(24, 204, 113, 1),
      contentPadding: const EdgeInsets.all(10),
      alignLabelWithHint: true,
      hintText: hintTxt,
      hintStyle: inter14MediumBlack2());
}

paketDecorationDatePicker(String hintTxt, bool isEmpty) {
  return InputDecoration(
      suffixIcon:
          Icon(Icons.warning, color: isEmpty ? Colors.red : Colors.transparent),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(
            color:
                isEmpty ? Colors.red : const Color.fromRGBO(24, 204, 113, 1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusColor: const Color.fromRGBO(24, 204, 113, 1),
      contentPadding: const EdgeInsets.all(10),
      alignLabelWithHint: true,
      hintText: hintTxt,
      hintStyle: inter14MediumBlack2());
}

paketDecorationWoIconDropdown(String hintTxt, bool isEmpty) {
  return InputDecoration(
      suffixIcon: const SizedBox(),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(
            color:
                isEmpty ? Colors.red : const Color.fromRGBO(24, 204, 113, 1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      // perlu diatur ulang jika ada form yang disable
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusColor: const Color.fromRGBO(24, 204, 113, 1),
      contentPadding: const EdgeInsets.all(10),
      alignLabelWithHint: true,
      hintText: hintTxt,
      hintStyle: inter14MediumBlack2());
}

generalDecoration(String hintTxt, bool isEmpty) {
  return InputDecoration(
      suffixIcon:
          Icon(Icons.warning, color: isEmpty ? Colors.red : Colors.transparent),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(
            color:
                isEmpty ? Colors.red : const Color.fromRGBO(24, 204, 113, 1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusColor: const Color.fromRGBO(24, 204, 113, 1),
      contentPadding: const EdgeInsets.all(10),
      alignLabelWithHint: true,
      hintText: hintTxt,
      hintStyle: inter14MediumBlack2());
}

viewOnlyDecoration(String hintTxt, bool isEmpty) {
  return InputDecoration(
      enabled: false,
      border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Color(0xff575757))),
      focusedBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Color.fromRGBO(24, 204, 113, 1))),
      enabledBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Color(0xff575757))),
      disabledBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Color(0xff575757))),
      focusColor: const Color.fromRGBO(24, 204, 113, 1),
      contentPadding: const EdgeInsets.all(10),
      alignLabelWithHint: true,
      hintText: hintTxt,
      hintStyle: inter14Gray2());
}

generalDecorationWoIcon(String hintTxt, bool isEmpty) {
  return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(
            color:
                isEmpty ? Colors.red : const Color.fromRGBO(24, 204, 113, 1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusColor: const Color.fromRGBO(24, 204, 113, 1),
      contentPadding: const EdgeInsets.all(10),
      alignLabelWithHint: true,
      hintText: hintTxt,
      hintStyle: inter14MediumBlack2());
}

generalDecorationWoIconWPrefix(String hintTxt, bool isEmpty, String prefixTxt) {
  return InputDecoration(
      prefixText: prefixTxt,
      prefixStyle: inter14Medium(),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(
            color:
                isEmpty ? Colors.red : const Color.fromRGBO(24, 204, 113, 1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusColor: const Color.fromRGBO(24, 204, 113, 1),
      contentPadding: const EdgeInsets.all(10),
      alignLabelWithHint: true,
      hintText: hintTxt,
      hintStyle: inter14MediumBlack2());
}

generalDecorationWoIconDropdown(String hintTxt, bool isEmpty,
    {bool disabled = false}) {
  return InputDecoration(
      suffixIcon: const SizedBox(),
      filled: disabled,
      fillColor: disabled ? Colors.grey.withOpacity(0.25) : null,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(
            color:
                isEmpty ? Colors.red : const Color.fromRGBO(24, 204, 113, 1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      // perlu diatur ulang jika ada form yang disable
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: isEmpty ? Colors.red : Colors.grey),
      ),
      focusColor: const Color.fromRGBO(24, 204, 113, 1),
      contentPadding: const EdgeInsets.all(10),
      alignLabelWithHint: true,
      hintText: hintTxt,
      hintStyle: inter14MediumBlack2());
}

searchDecoration(String hintTxt,
    {required Function onClear, Color? borderColor, bool clearIcon = false}) {
  return InputDecoration(
      prefixIcon: const Padding(
        padding: EdgeInsets.only(left: 15, right: 10, top: 0),
        child: Icon(Icons.search, color: Colors.black, size: 24),
      ),
      suffixIconConstraints:
          !clearIcon ? null : const BoxConstraints(minHeight: 36, minWidth: 36),
      suffixIcon: !clearIcon
          ? null
          : Padding(
              padding: const EdgeInsets.only(right: 14),
              child: InkWell(
                onTap: () => onClear,
                child: SvgPicture.asset(
                  "${iconsPath}x-circle.svg",
                  width: 13,
                  height: 13,
                ),
              ),
            ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: borderColor ?? gray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: primaryBlue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: borderColor ?? gray),
      ),
      focusColor: primaryBlue,
      filled: true,
      fillColor: secondaryBlue,
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      prefixIconConstraints: const BoxConstraints(minWidth: 30, minHeight: 30),
      alignLabelWithHint: true,
      hintText: hintTxt,
      hintStyle: inter14MediumBlack2());
}

searchDecorationGray(String hintTxt, {required Function onClear, clearIcon}) {
  return InputDecoration(
      prefixIcon: const Padding(
        padding: EdgeInsets.only(left: 12, right: 5),
        child: Icon(Icons.search, color: Colors.black54, size: 22),
      ),
      suffixIcon: clearIcon == true
          ? InkWell(
              onTap: () => onClear(),
              child: SizedBox(
                width: 13,
                height: 13,
                child: Image.asset('assets/images/cleartext.png'),
              ),
            )
          : null,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: gray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: gray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: gray),
      ),
      focusColor: const Color.fromRGBO(24, 204, 113, 1),
      contentPadding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      prefixIconConstraints: const BoxConstraints(minWidth: 30, minHeight: 30),
      alignLabelWithHint: true,
      hintText: hintTxt,
      hintStyle: inter14MediumBlack2());
}
