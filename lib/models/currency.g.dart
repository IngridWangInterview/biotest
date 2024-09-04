// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyImpl _$$CurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyImpl(
      id: json['id'] as String,
      currency: json['currency'] as String,
      currencyIcon: json['currency_icon'] as String,
      twdPrice: (json['twd_price'] as num).toDouble(),
      amountDecimal: json['amount_decimal'] as String,
    );

Map<String, dynamic> _$$CurrencyImplToJson(_$CurrencyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': instance.currency,
      'currency_icon': instance.currencyIcon,
      'twd_price': instance.twdPrice,
      'amount_decimal': instance.amountDecimal,
    };
