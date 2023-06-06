import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class Formatter {
  static String getCurrency(dynamic val) {
    return NumberFormat.currency(locale: 'eu', symbol: '').format(val);
  }

  static String getFormatted(value) {
    var f = new NumberFormat("#,##0", "eu");
    return f.format(value);
  }

  static String getFormattedDecimal(value) {
    var f = new NumberFormat("#,##0.00", "eu");
    return f.format(value);
  }

  static String getFormattedDecimal2(value) {
    var f = new NumberFormat("#,##0.##", "eu");
    return f.format(value);
  }

  static String getRawValue(String maskedString, String mask) {
    String result = "";
    List listMask = mask.split("");
    List listmaskedString = maskedString.split("");
    for (var i = 0; i < listmaskedString.length; i++) {
      if (listMask[i] == "#" || listMask[i] == "*") {
        result += listmaskedString[i];
      }
    }
    return result;
  }

  static String getKtpValue(String value) {
    String tempResult = "";
    int count = 1;
    Logger().wtf(value);
    List listValue = value.split("");
    for (var i = 0; i < listValue.length; i++) {
      tempResult += listValue[i];
      if (count % 4 == 0) {
        if (i < listValue.length - 1) {
          tempResult += " - ";
        }
        count = 1;
      } else {
        count++;
      }
    }
    return tempResult;
  }
}
