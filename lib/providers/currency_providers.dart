import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:decimal/decimal.dart';

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

final baseAmountProvider = StateProvider.autoDispose<Decimal?>((ref) => null);
final targetAmountProvider = StateProvider.autoDispose<Decimal?>((ref) => null);

final conversionResultProvider = Provider.autoDispose<Decimal?>((ref) {
  final baseCurrency = ref.watch(selectedBaseCurrencyProvider);
  final targetCurrency = ref.watch(selectedTargetCurrencyProvider);

  if (baseCurrency != null && targetCurrency != null) {
    final baseRate = Decimal.parse(baseCurrency.twdPrice.toString());
    final targetRate = Decimal.parse(targetCurrency.twdPrice.toString());

    if (baseRate == Decimal.zero) {
      return null;
    }

    return (targetRate / baseRate).toDecimal(scaleOnInfinitePrecision: 8);
  }
  return null;
});

final targetConversionResultProvider = Provider.autoDispose<Decimal?>((ref) {
  final baseCurrency = ref.watch(selectedBaseCurrencyProvider);
  final targetCurrency = ref.watch(selectedTargetCurrencyProvider);
  final amount = ref.watch(targetAmountProvider);

  if (baseCurrency != null && targetCurrency != null && amount != null) {
    final baseRate = Decimal.parse(baseCurrency.twdPrice.toString());
    final targetRate = Decimal.parse(targetCurrency.twdPrice.toString());

    if (baseRate == Decimal.zero) {
      return null; // 避免除零错误
    }

    return (baseRate / targetRate).toDecimal(scaleOnInfinitePrecision: 8);
  }
  return null;
});
