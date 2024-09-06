import 'package:bito_test/models/currency.dart';
import 'package:bito_test/providers/currency_providers.dart';
import 'package:bito_test/repositories/currency_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCurrencyRepository extends Mock implements CurrencyRepository {}

void main() {
  late ProviderContainer container;
  late MockCurrencyRepository mockRepository;

  setUp(() {
    mockRepository = MockCurrencyRepository();
    container = ProviderContainer(
      overrides: [
        currencyRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('currenciesProvider should return list of currencies', () async {
    final currencies = [
      const Currency(
          currency: 'USD',
          twdPrice: 30.5,
          amountDecimal: '2',
          id: '1',
          currencyIcon: ''),
      const Currency(
          currency: 'EUR',
          twdPrice: 35.2,
          amountDecimal: '2',
          id: '2',
          currencyIcon: ''),
    ];

    when(() => mockRepository.getCurrencies())
        .thenAnswer((_) async => currencies);

    final result = await container.read(currenciesProvider.future);
    expect(result, currencies);
  });
}
