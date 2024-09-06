import 'package:bito_test/utils/formatters.dart';
import 'package:bito_test/widgets/currency_row.dart';
import 'package:bito_test/widgets/exchange_rate_display.dart';
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
    final baseAmountController = useTextEditingController(text: '1');
    final targetAmountController = useTextEditingController();
    final conversionResult = ref.watch(conversionResultProvider);
    final targetConversionResult = ref.watch(targetConversionResultProvider);

    useEffect(() {
      void listener() {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(baseAmountProvider.notifier).state =
              double.tryParse(baseAmountController.text) ?? 0;
        });
      }

      baseAmountController.addListener(listener);
      targetAmountController.addListener(listener);
      return () {
        baseAmountController.removeListener(listener);
        targetAmountController.removeListener(listener);
      };
    }, [baseAmountController, targetAmountController]);

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
                baseAmountController.text = formatCurrency(
                  amount,
                  int.parse(baseCurrency?.amountDecimal ?? '2'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
