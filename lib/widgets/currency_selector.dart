import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/currency.dart';
import '../providers/currency_providers.dart';
import '../screens/currency_selector_screen.dart';

class CurrencySelector extends HookConsumerWidget {
  final bool isBaseCurrency;
  final VoidCallback? onCurrencySelected;

  const CurrencySelector({
    super.key,
    required this.isBaseCurrency,
    this.onCurrencySelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCurrency = isBaseCurrency
        ? ref.watch(selectedBaseCurrencyProvider)
        : ref.watch(selectedTargetCurrencyProvider);

    return ElevatedButton(
      onPressed: () => _selectCurrency(context, ref),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: selectedCurrency?.currencyIcon ?? '',
            width: 20,
            height: 20,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(width: 8),
          Text(selectedCurrency?.currency ?? ''),
        ],
      ),
    );
  }

  void _selectCurrency(BuildContext context, WidgetRef ref) async {
    final Currency? selected = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CurrencySelectorScreen(isBaseCurrency: isBaseCurrency),
      ),
    );

    if (selected != null) {
      if (isBaseCurrency) {
        ref.read(selectedBaseCurrencyProvider.notifier).state = selected;
      } else {
        ref.read(selectedTargetCurrencyProvider.notifier).state = selected;
      }
      onCurrencySelected?.call();
    }
  }
}
