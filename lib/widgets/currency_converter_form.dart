import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/currency_providers.dart';
import '../screens/currency_selector_screen.dart';
import '../utils/formatters.dart';

class CurrencyConverterForm extends HookConsumerWidget {
  const CurrencyConverterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountController = useTextEditingController();
    final baseCurrency = ref.watch(selectedBaseCurrencyProvider);
    final targetCurrency = ref.watch(selectedTargetCurrencyProvider);
    final conversionResult = ref.watch(conversionResultProvider);

    useEffect(() {
      listener() {
        final amount = double.tryParse(amountController.text);
        ref.read(baseAmountProvider.notifier).state = amount;
      }

      amountController.addListener(listener);
      return () => amountController.removeListener(listener);
    }, [amountController]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: amountController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Amount',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        _buildCurrencySelector(context, ref, true),
        const SizedBox(height: 16),
        _buildCurrencySelector(context, ref, false),
        const SizedBox(height: 32),
        if (conversionResult != null &&
            baseCurrency != null &&
            targetCurrency != null)
          Text(
            '${formatCurrency(double.parse(amountController.text), int.parse(baseCurrency.amountDecimal))} ${baseCurrency.currency} = '
            '${formatCurrency(conversionResult, int.parse(targetCurrency.amountDecimal))} ${targetCurrency.currency}',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
      ],
    );
  }

  Widget _buildCurrencySelector(
      BuildContext context, WidgetRef ref, bool isBase) {
    final currency = isBase
        ? ref.watch(selectedBaseCurrencyProvider)
        : ref.watch(selectedTargetCurrencyProvider);

    return ElevatedButton(
      child: Text(currency?.currency ??
          (isBase ? 'Select Base Currency' : 'Select Target Currency')),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CurrencySelectorScreen(isBaseCurrency: isBase),
          ),
        );
      },
    );
  }
}
