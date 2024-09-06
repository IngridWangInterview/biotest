import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

// Specifications:
// a. Currency prices should be formatted with thousands separator.
// Ex: “123456.88” -> “123,456.88”
// b. Currency conversion should be based on exchange rates against TWD. Ex: “1 BTC = 10,000 TWD, 1 ETH = 5,000TWD -> 1 BTC ≈ 2 ETH”
// c. The precision of each currency amount is displayed to the maximum precision (amount_decimal), with exceeding digits being rounded down.
// Ex: BTC’s amount_decimal = 9, ETH’s amount_decimal = 6,
// so “1.23456789 BTC ≈ 2.46913578 ETH
String formatCurrency(Decimal value, int decimalPlaces,
    {bool trimTrailingZeros = true}) {
  final absValue = value.abs();
  final parts = absValue.toStringAsFixed(decimalPlaces).split('.');
  final integerPart = parts[0];
  final decimalPart = parts.length > 1 ? parts[1] : '';

  final formattedIntegerPart =
      NumberFormat('#,##0').format(int.parse(integerPart));

  String formattedValue = formattedIntegerPart;
  if (decimalPart.isNotEmpty) {
    formattedValue += '.$decimalPart';
  }

  if (trimTrailingZeros) {
    formattedValue = formattedValue.replaceAll(RegExp(r'([.]*0+)$'), '');
  }

  return formattedValue;
}
