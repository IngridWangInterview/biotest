import 'package:dio/dio.dart';

import '../models/currency.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl;

  ApiService({
    Dio? dio,
    required String baseUrl,
  })  : _dio = dio ?? Dio(),
        _baseUrl = baseUrl;

  Future<List<Currency>> fetchCurrencies() async {
    final response = await _dio.get(_baseUrl);
    return (response.data as List)
        .map((json) => Currency.fromJson(json))
        .toList();
  }
}
