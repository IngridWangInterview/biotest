import 'package:bito_test/providers/currency_providers.dart';
import 'package:bito_test/widgets/currency_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/currency.dart';

class CurrencyRow extends ConsumerWidget {
  final bool isBase;
  final Currency? currency;
  final TextEditingController controller;
  final double? conversionRate;
  final Function(double) onAmountChanged;

  const CurrencyRow({
    super.key,
    required this.isBase,
    this.currency,
    required this.controller,
    this.conversionRate,
    required this.onAmountChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: CurrencySelector(
            isBaseCurrency: isBase,
            onCurrencySelected: () => ref.refresh(conversionResultProvider),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: isBase ? 'Base Amount' : 'Target Amount',
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                double amount = double.tryParse(value) ?? 0;
                if (!isBase && conversionRate != null) {
                  amount = amount * conversionRate!;
                }
                onAmountChanged(amount);
              }
            },
          ),
        ),
      ],
    );
  }
}
