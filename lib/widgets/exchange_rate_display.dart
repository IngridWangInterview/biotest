import 'package:bito_test/models/currency.dart';
import 'package:bito_test/utils/formatters.dart';
import 'package:flutter/material.dart';

class ExchangeRateDisplay extends StatelessWidget {
  final Currency? baseCurrency;
  final Currency? targetCurrency;

  const ExchangeRateDisplay({
    super.key,
    required this.baseCurrency,
    required this.targetCurrency,
  });

  @override
  Widget build(BuildContext context) {
    if (baseCurrency != null && targetCurrency != null) {
      return Text(
        '1 ${baseCurrency!.currency} ≈ ${formatCurrency(targetCurrency!.twdPrice / baseCurrency!.twdPrice, int.parse(targetCurrency!.amountDecimal))} ${targetCurrency!.currency}',
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      );
    }

    return const SizedBox.shrink();
  }
}
