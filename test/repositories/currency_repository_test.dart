import 'package:bito_test/models/currency.dart';
import 'package:bito_test/repositories/currency_repository.dart';
import 'package:bito_test/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  group('CurrencyRepository', () {
    late CurrencyRepository repository;
    late MockApiService mockApiService;

    setUp(() {
      mockApiService = MockApiService();
      repository = CurrencyRepository(mockApiService);
    });

    test('getCurrencies should return list of Currency from ApiService',
        () async {
      final currencies = [
        const Currency(
            id: "1",
            currency: 'USD',
            currencyIcon: 'url',
            twdPrice: 30.5,
            amountDecimal: '2'),
      ];

      when(() => mockApiService.fetchCurrencies())
          .thenAnswer((_) async => currencies);

      final result = await repository.getCurrencies();

      expect(result, currencies);
      verify(() => mockApiService.fetchCurrencies()).called(1);
    });
  });
}
