import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }
    int value = int.parse(newValue.text);
    final formatter = NumberFormat("#,##0.##");
    String newText = formatter.format(value);
    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}

class TimeInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // print('Debug: ' + 'newValue = ' + newValue.text);
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }
    String newText = '';
    if (oldValue.text.length == 0) {
      newText = '0';
    } else if (oldValue.text.length == 1) {
      newText = oldValue.text;
    } else if (oldValue.text.length == 2) {
      newText = oldValue.text[1];
    }
    if (newValue.text.length == 0) {
      newText = newText + '0';
    } else if (newValue.text.length == 1) {
      newText = newText + newValue.text;
    } else if (newValue.text.length == 2) {
      newText = newText + newValue.text[1];
    }

    // print('Debug: ' + 'oldValue = ' + oldValue.text + ' / newValue = ' + newValue.text + ' / newText = ' + newText);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection(baseOffset: 0, extentOffset: newText.length));
    //TextSelection.collapsed(offset: newText.length));
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
