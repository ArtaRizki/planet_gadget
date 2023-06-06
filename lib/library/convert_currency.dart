import 'package:intl/intl.dart';

String convertToNominal({required String idr}) {
  String output = idr.replaceAll(RegExp('[A-Za-z. ]'), '');
  return output;
}

String convertToIdr({required String nominal}) {
  try {
    final formatIdr = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    if (nominal.contains(".")) {
      var x = (double.parse(nominal)).toInt();
      nominal = x.toString();
    }
    return formatIdr.format(int.parse(nominal));
  } catch (e) {
    return nominal;
  }
}

String formatToIdr({required int nominal}) {
  final formatIdr = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return formatIdr.format(nominal);
}
