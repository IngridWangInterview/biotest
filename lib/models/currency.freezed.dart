// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return _Currency.fromJson(json);
}

/// @nodoc
mixin _$Currency {
  String get id => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_icon')
  String get currencyIcon => throw _privateConstructorUsedError;
  @JsonKey(name: 'twd_price')
  double get twdPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_decimal')
  String get amountDecimal => throw _privateConstructorUsedError;

  /// Serializes this Currency to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res, Currency>;
  @useResult
  $Res call(
      {String id,
      String currency,
      @JsonKey(name: 'currency_icon') String currencyIcon,
      @JsonKey(name: 'twd_price') double twdPrice,
      @JsonKey(name: 'amount_decimal') String amountDecimal});
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res, $Val extends Currency>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currency = null,
    Object? currencyIcon = null,
    Object? twdPrice = null,
    Object? amountDecimal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencyIcon: null == currencyIcon
          ? _value.currencyIcon
          : currencyIcon // ignore: cast_nullable_to_non_nullable
              as String,
      twdPrice: null == twdPrice
          ? _value.twdPrice
          : twdPrice // ignore: cast_nullable_to_non_nullable
              as double,
      amountDecimal: null == amountDecimal
          ? _value.amountDecimal
          : amountDecimal // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyImplCopyWith<$Res>
    implements $CurrencyCopyWith<$Res> {
  factory _$$CurrencyImplCopyWith(
          _$CurrencyImpl value, $Res Function(_$CurrencyImpl) then) =
      __$$CurrencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String currency,
      @JsonKey(name: 'currency_icon') String currencyIcon,
      @JsonKey(name: 'twd_price') double twdPrice,
      @JsonKey(name: 'amount_decimal') String amountDecimal});
}

/// @nodoc
class __$$CurrencyImplCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$CurrencyImpl>
    implements _$$CurrencyImplCopyWith<$Res> {
  __$$CurrencyImplCopyWithImpl(
      _$CurrencyImpl _value, $Res Function(_$CurrencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currency = null,
    Object? currencyIcon = null,
    Object? twdPrice = null,
    Object? amountDecimal = null,
  }) {
    return _then(_$CurrencyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencyIcon: null == currencyIcon
          ? _value.currencyIcon
          : currencyIcon // ignore: cast_nullable_to_non_nullable
              as String,
      twdPrice: null == twdPrice
          ? _value.twdPrice
          : twdPrice // ignore: cast_nullable_to_non_nullable
              as double,
      amountDecimal: null == amountDecimal
          ? _value.amountDecimal
          : amountDecimal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyImpl implements _Currency {
  const _$CurrencyImpl(
      {required this.id,
      required this.currency,
      @JsonKey(name: 'currency_icon') required this.currencyIcon,
      @JsonKey(name: 'twd_price') required this.twdPrice,
      @JsonKey(name: 'amount_decimal') required this.amountDecimal});

  factory _$CurrencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyImplFromJson(json);

  @override
  final String id;
  @override
  final String currency;
  @override
  @JsonKey(name: 'currency_icon')
  final String currencyIcon;
  @override
  @JsonKey(name: 'twd_price')
  final double twdPrice;
  @override
  @JsonKey(name: 'amount_decimal')
  final String amountDecimal;

  @override
  String toString() {
    return 'Currency(id: $id, currency: $currency, currencyIcon: $currencyIcon, twdPrice: $twdPrice, amountDecimal: $amountDecimal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencyIcon, currencyIcon) ||
                other.currencyIcon == currencyIcon) &&
            (identical(other.twdPrice, twdPrice) ||
                other.twdPrice == twdPrice) &&
            (identical(other.amountDecimal, amountDecimal) ||
                other.amountDecimal == amountDecimal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, currency, currencyIcon, twdPrice, amountDecimal);

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      __$$CurrencyImplCopyWithImpl<_$CurrencyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyImplToJson(
      this,
    );
  }
}

abstract class _Currency implements Currency {
  const factory _Currency(
      {required final String id,
      required final String currency,
      @JsonKey(name: 'currency_icon') required final String currencyIcon,
      @JsonKey(name: 'twd_price') required final double twdPrice,
      @JsonKey(name: 'amount_decimal')
      required final String amountDecimal}) = _$CurrencyImpl;

  factory _Currency.fromJson(Map<String, dynamic> json) =
      _$CurrencyImpl.fromJson;

  @override
  String get id;
  @override
  String get currency;
  @override
  @JsonKey(name: 'currency_icon')
  String get currencyIcon;
  @override
  @JsonKey(name: 'twd_price')
  double get twdPrice;
  @override
  @JsonKey(name: 'amount_decimal')
  String get amountDecimal;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
