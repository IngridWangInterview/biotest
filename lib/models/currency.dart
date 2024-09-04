import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

@freezed
class Currency with _$Currency {
  const factory Currency({
    required String id,
    required String currency,
    @JsonKey(name: 'currency_icon') required String currencyIcon,
    @JsonKey(name: 'twd_price') required double twdPrice,
    @JsonKey(name: 'amount_decimal') required String amountDecimal,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}
