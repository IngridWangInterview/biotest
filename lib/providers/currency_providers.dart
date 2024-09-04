import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/app_config.dart';
import '../models/currency.dart';
import '../repositories/currency_repository.dart';
import '../services/api_service.dart';

final dioProvider = Provider((ref) => Dio());

final apiServiceProvider = Provider((ref) =>
    ApiService(dio: ref.read(dioProvider), baseUrl: AppConfig.apiBaseUrl));

final currencyRepositoryProvider =
    Provider((ref) => CurrencyRepository(ref.read(apiServiceProvider)));

final currenciesProvider = FutureProvider<List<Currency>>((ref) async {
  final repository = ref.read(currencyRepositoryProvider);
  return repository.getCurrencies();
});

final selectedBaseCurrencyProvider =
    StateProvider.autoDispose<Currency?>((ref) => null);
final selectedTargetCurrencyProvider =
    StateProvider.autoDispose<Currency?>((ref) => null);

final baseAmountProvider = StateProvider.autoDispose<double?>((ref) => null);
final targetAmountProvider = StateProvider.autoDispose<double?>((ref) => null);

final conversionResultProvider = Provider.autoDispose<double?>((ref) {
  final baseCurrency = ref.watch(selectedBaseCurrencyProvider);
  final targetCurrency = ref.watch(selectedTargetCurrencyProvider);
  final amount = ref.watch(baseAmountProvider);

  if (baseCurrency != null && targetCurrency != null && amount != null) {
    return (targetCurrency.twdPrice / baseCurrency.twdPrice);
  }
  return null;
});

final targetConversionResultProvider = Provider.autoDispose<double?>((ref) {
  final baseCurrency = ref.watch(selectedBaseCurrencyProvider);
  final targetCurrency = ref.watch(selectedTargetCurrencyProvider);
  final amount = ref.watch(targetAmountProvider);

  if (baseCurrency != null && targetCurrency != null && amount != null) {
    return (baseCurrency.twdPrice / targetCurrency.twdPrice);
  }
  return null;
});
