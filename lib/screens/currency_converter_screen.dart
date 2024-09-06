import 'package:bito_test/utils/formatters.dart';
import 'package:bito_test/widgets/currency_row.dart';
import 'package:bito_test/widgets/exchange_rate_display.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/currency_providers.dart';

class CurrencyConverterScreen extends HookConsumerWidget {
  const CurrencyConverterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseCurrency = ref.watch(selectedBaseCurrencyProvider);
    final targetCurrency = ref.watch(selectedTargetCurrencyProvider);
    final baseAmountController = useTextEditingController();
    final targetAmountController = useTextEditingController();
    final conversionResult = ref.watch(conversionResultProvider);
    final targetConversionResult = ref.watch(targetConversionResultProvider);

    final updateAmounts = useCallback((String baseAmount, String targetAmount) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (baseAmount.isNotEmpty && baseCurrency != null) {
          ref.read(baseAmountProvider.notifier).state =
              Decimal.parse(baseAmount);
        }
        if (targetAmount.isNotEmpty && targetCurrency != null) {
          ref.read(targetAmountProvider.notifier).state =
              Decimal.parse(targetAmount);
        }
      });
    }, [baseCurrency, targetCurrency]);

    useEffect(() {
      void baseListener() =>
          updateAmounts(baseAmountController.text, targetAmountController.text);
      void targetListener() =>
          updateAmounts(baseAmountController.text, targetAmountController.text);

      baseAmountController.addListener(baseListener);
      targetAmountController.addListener(targetListener);

      return () {
        baseAmountController.removeListener(baseListener);
        targetAmountController.removeListener(targetListener);
      };
    }, [baseAmountController, targetAmountController, updateAmounts]);

    useEffect(() {
      if (baseCurrency != null && targetCurrency != null) {
        final baseAmount = ref.read(baseAmountProvider) ?? Decimal.zero;
        final targetAmount = ref.read(targetAmountProvider) ?? Decimal.zero;

        baseAmountController.text =
            formatCurrency(baseAmount, int.parse(baseCurrency.amountDecimal));
        targetAmountController.text = formatCurrency(
            targetAmount, int.parse(targetCurrency.amountDecimal));
      }

      return null;
    }, [baseCurrency, targetCurrency]);

    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CurrencyRow(
              isBase: true,
              currency: baseCurrency,
              controller: baseAmountController,
              onAmountChanged: (amount) {
                if (conversionResult != null) {
                  targetAmountController.text = formatCurrency(
                    amount * conversionResult,
                    int.parse(targetCurrency?.amountDecimal ?? '2'),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 24,
                          child: ExchangeRateDisplay(
                            baseCurrency: baseCurrency,
                            targetCurrency: targetCurrency,
                          ),
                        ),
                        const Center(child: Divider()),
                        SizedBox(height: 24, child: Container()),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    bottom: 0,
                    left: 60,
                    child: CircleAvatar(
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                ],
              ),
            ),
            CurrencyRow(
              isBase: false,
              currency: targetCurrency,
              controller: targetAmountController,
              conversionRate: targetConversionResult,
              onAmountChanged: (amount) {
                if (targetConversionResult != null) {
                  baseAmountController.text = formatCurrency(
                    amount * targetConversionResult,
                    int.parse(baseCurrency?.amountDecimal ?? '2'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
