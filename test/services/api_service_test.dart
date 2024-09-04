import 'package:bito_test/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('ApiService', () {
    late ApiService apiService;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      apiService = ApiService(dio: mockDio, baseUrl: 'https://test-api.com');
    });

    test('fetchCurrencies should return list of Currency', () async {
      when(() => mockDio.get(any())).thenAnswer((_) async => Response(
            data: [
              {
                'id': 1,
                'currency': 'USD',
                'currency_icon': 'https://example.com/usd.png',
                'twd_price': 30.5,
                'amount_decimal': 2,
              }
            ],
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      final currencies = await apiService.fetchCurrencies();

      expect(currencies.length, 1);
      expect(currencies[0].currency, 'USD');
      verify(() => mockDio.get('https://test-api.com/pairs')).called(1);
    });
  });
}
