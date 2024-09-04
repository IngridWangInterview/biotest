import 'package:bito_test/models/currency.dart';
import 'package:bito_test/providers/currency_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('conversionResultProvider returns correct conversion result', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    const baseCurrency = Currency(
        id: "1",
        currency: 'USD',
        currencyIcon: 'url',
        twdPrice: 10.0,
        amountDecimal: '2');
    const targetCurrency = Currency(
        id: "2",
        currency: 'EUR',
        currencyIcon: 'url',
        twdPrice: 20.0,
        amountDecimal: '2');
    const amount = 100.0;

    container.read(selectedBaseCurrencyProvider.notifier).state = baseCurrency;
    container.read(selectedTargetCurrencyProvider.notifier).state =
        targetCurrency;
    container.read(baseAmountProvider.notifier).state = amount;

    final result = container.read(conversionResultProvider);

    expect(result, 50.0); // 100 * 10 / 20 = 50
  });
}
