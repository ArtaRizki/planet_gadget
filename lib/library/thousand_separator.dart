import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:intl/number_symbols_data.dart' show numberFormatSymbols;
import 'dart:ui' as ui;

// Cara Pakai :
// TextFormField(
//   decoration: InputDecoration(
//     labelText: "Thousand and Decimal Separator",
//   ),
//   controller: controller.text2Controller,
//   keyboardType: TextInputType.number,
//   inputFormatters: [ThousandsAndDecimalSeparatorInputFormatter()],
//   onChanged: (value) {
//     print('Debug: ' + 'onFieldSubmitted ' + value.toString());
//     controller.value2.value = double.tryParse(value.replaceAll(getCurrentThousandSeparator(), '')) ?? 0.00;
//   },
// )

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  String thousandSeparator = '.';
  String decimalSeparator = ',';

  String getCurrentLocale() {
    final locale = ui.window.locale;
    final joined = "${locale.languageCode}_${locale.countryCode}";
    if (numberFormatSymbols.keys.contains(joined)) {
      return joined;
    }
    return locale.languageCode;
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    double? temp = double.tryParse(s);
    return (temp != null) && (temp >= 0);
  }

  String getNumericOnly(String s) {
    if (s == null) {
      return s;
    }
    String result = "";
    for (int i = 0; i < s.length; i++) {
      if (s[i] != "-") {
        if (int.tryParse(s[i]) != null) {
          result = result + s[i];
        }
      }
    }
    return result;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // String locale = getCurrentLocale();
    // decimalSeparator = numberFormatSymbols[locale]?.DECIMAL_SEP ?? ",";
    // if (decimalSeparator == ".") {
    //   thousandSeparator = ",";
    // } else if (decimalSeparator == ",") {
    //   thousandSeparator = ".";
    // }
    // print('Debug: ' + 'locale ' + locale);
    // print('Debug: ' + 'thousandSeparator ' + thousandSeparator);
    // print('Debug: ' + 'decimalSeparator ' + decimalSeparator);

    String oldValueText = oldValue.text.replaceAll(thousandSeparator, '');
    String newValueText = newValue.text.replaceAll(thousandSeparator, '');
    print('Debug: ' + 'oldValue.text ' + oldValue.text);
    print('Debug: ' + 'newValue.text ' + newValue.text);
    print('Debug: ' + 'oldValueText ' + oldValueText);
    print('Debug: ' + 'newValueText ' + newValueText);

    if (newValue.text == oldValue.text) {
      print('Debug: ' + 'newValue.text == oldValue.text');
      return newValue.copyWith(text: newValue.text);
    } else if (newValue.text.length == 0) {
      print('Debug: ' + 'newValue.text.length == 0');
      return newValue.copyWith(text: '');
    } else {
      newValueText = getNumericOnly(newValueText);
      String newString =
          NumberFormat("#,###", 'eu').format(double.tryParse(newValueText));
      print('Debug: ' + 'newString ' + newString.toString());

      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      int offset = newString.length - selectionIndex;
      if (offset < 0) {
        offset = 0;
      }
      print('Debug: ' + 'selectionIndex ' + selectionIndex.toString());
      print('Debug: ' +
          'newValue.selection.extentOffset ' +
          newValue.selection.extentOffset.toString());
      print('Debug: ' + 'offset ' + offset.toString());

      return newValue.copyWith(
          text: newString,
          selection: TextSelection.collapsed(
            offset: offset,
          ));

      // return TextEditingValue(
      //   text: newString.toString(),
      //   selection: TextSelection.collapsed(
      //     offset: offset,
      //   ),
      // );
    }
  }
}

class ThousandsAndDecimalSeparatorInputFormatter extends TextInputFormatter {
  String thousandSeparator = '.';
  String decimalSeparator = ',';
  bool isStartDecimal = false;

  String getCurrentLocale() {
    final locale = ui.window.locale;
    final joined = "${locale.languageCode}_${locale.countryCode}";
    if (numberFormatSymbols.keys.contains(joined)) {
      return joined;
    }
    return locale.languageCode;
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }

    String temptxt = s;
    double? temp = 0;
    if (isStartDecimal) {
      temptxt = s.substring(0, s.length - 1);
    }
    temp = double.tryParse(temptxt.replaceAll(",", "."));
    temp ??= double.tryParse(temptxt.replaceAll(".", ","));
    return (temp != null) && (temp >= 0);
  }

  String getNumericOnly(String s) {
    if (s == null) {
      return s;
    }
    String result = "";
    int countSeparator = 0;
    for (int i = 0; i < s.length; i++) {
      if (s[i] != "-") {
        if ((s[i] == decimalSeparator) &&
            (i < s.length - 1) &&
            (countSeparator == 0)) {
          countSeparator++;
          result = result + s[i];
        }
        if (int.tryParse(s[i]) != null) {
          result = result + s[i];
        }
      }
    }
    return result;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // String locale = getCurrentLocale();
    // decimalSeparator = numberFormatSymbols[locale]?.DECIMAL_SEP ?? ",";
    // if (decimalSeparator == ".") {
    //   thousandSeparator = ",";
    // } else if (decimalSeparator == ",") {
    //   thousandSeparator = ".";
    // }
    // print('Debug: ' + 'locale ' + locale);
    // print('Debug: ' + 'thousandSeparator ' + thousandSeparator);
    // print('Debug: ' + 'decimalSeparator ' + decimalSeparator);

    String oldValueText = oldValue.text.replaceAll(thousandSeparator, '');
    String newValueText = newValue.text.replaceAll(thousandSeparator, '');
    // print('Debug: ' + 'oldValueText ' + oldValueText);
    // print('Debug: ' + 'newValueText ' + newValueText);

    if (newValueText.length > 1) {
      isStartDecimal = ((newValueText.length > 1) &&
          (newValueText.endsWith(decimalSeparator)));
    } else {
      isStartDecimal = false;
    }

    if (newValue.text == oldValue.text) {
      // print('Debug: ' + 'newValue.text == oldValue.text');
      return newValue;
    } else if (newValue.text.length == 0) {
      // print('Debug: ' + 'newValue.text.length == 0');
      return newValue.copyWith(text: '');
    } else {
      newValueText = getNumericOnly(newValueText);
      if (!isNumeric(newValueText)) {
        newValueText = oldValueText;
      }
      double? temp = double.tryParse(newValueText.replaceAll(",", "."));
      if (temp == null) {
        double.tryParse(newValueText.replaceAll(".", ","));
      }
      String newString = NumberFormat("#,###.####", 'eu').format(temp ?? 0);

      if (isStartDecimal) {
        newString = newString + decimalSeparator;
      }
      // print('Debug: ' + 'newString ' + newString.toString());

      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      int offset = newString.length - selectionIndex;
      if (offset < 0) {
        offset = 0;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: offset,
        ),
      );
    }
  }
}

// class ThousandsSeparatorInputFormatter extends TextInputFormatter {
//   static const separator = '.'; // Change this to '.' for other locales

//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     // Short-circuit if the new value is empty
//     if (newValue.text.length == 0) {
//       return newValue.copyWith(text: '');
//     }

//     // Handle "deletion" of separator character
//     String oldValueText = oldValue.text.replaceAll(separator, '');
//     String newValueText = newValue.text.replaceAll(separator, '');

//     if (oldValue.text.endsWith(separator) &&
//         oldValue.text.length == newValue.text.length + 1) {
//       newValueText = newValueText.substring(0, newValueText.length - 1);
//     }

//     // Only process if the old value and new value are different
//     if (oldValueText != newValueText) {
//       int selectionIndex =
//           newValue.text.length - newValue.selection.extentOffset;
//       final chars = newValueText.split('');

//       String newString = '';
//       for (int i = chars.length - 1; i >= 0; i--) {
//         if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
//           newString = separator + newString;
//         newString = chars[i] + newString;
//       }

//       return TextEditingValue(
//         text: newString.toString(),
//         selection: TextSelection.collapsed(
//           offset: newString.length - selectionIndex,
//         ),
//       );
//     }

//     // If the new value and old value are the same, just return as-is
//     return newValue;
//   }
// }
