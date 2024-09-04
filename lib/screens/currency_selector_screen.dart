import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/currency_providers.dart';

class CurrencySelectorScreen extends HookConsumerWidget {
  final bool isBaseCurrency;

  const CurrencySelectorScreen({super.key, required this.isBaseCurrency});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencies = ref.watch(currenciesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            isBaseCurrency ? 'Select Base Currency' : 'Select Target Currency'),
      ),
      body: currencies.when(
        data: (currencyList) => ListView.builder(
          itemCount: currencyList.length,
          itemBuilder: (context, index) {
            final currency = currencyList[index];
            return ListTile(
              title: Text(currency.currency),
              subtitle:
                  Text('1 ${currency.currency} = ${currency.twdPrice} TWD'),
              onTap: () {
                Navigator.of(context).pop(currency);
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
