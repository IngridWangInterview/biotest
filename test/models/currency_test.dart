import 'package:bito_test/models/currency.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Currency', () {
    test('should create Currency from json', () {
      final json = {
        'id': '1',
        'currency': 'USD',
        'currency_icon': 'https://example.com/usd.png',
        'twd_price': 30.5,
        'amount_decimal': '2',
      };

      final currency = Currency.fromJson(json);

      expect(currency.id, '1');
      expect(currency.currency, 'USD');
      expect(currency.currencyIcon, 'https://example.com/usd.png');
      expect(currency.twdPrice, 30.5);
      expect(currency.amountDecimal, '2');
    });
  });
}
