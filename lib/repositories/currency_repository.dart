import '../models/currency.dart';
import '../services/api_service.dart';

class CurrencyRepository {
  final ApiService _apiService;

  CurrencyRepository(this._apiService);

  Future<List<Currency>> getCurrencies() async {
    return await _apiService.fetchCurrencies();
  }
}
