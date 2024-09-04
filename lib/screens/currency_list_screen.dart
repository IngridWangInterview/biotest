import 'package:bito_test/providers/currency_providers.dart';
import 'package:bito_test/screens/currency_converter_screen.dart';
import 'package:bito_test/widgets/currency_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrencyListScreen extends HookConsumerWidget {
  const CurrencyListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currenciesAsync = ref.watch(currenciesProvider);

    useEffect(() {
      debugPrint('CurrencyListScreen built');
      return () => debugPrint('CurrencyListScreen disposed');
    }, []);

    return Scaffold(
      appBar: AppBar(title: const Text('Rate Table(TWD)')),
      body: Column(
        children: [
          Expanded(
            child: currenciesAsync.when(
              data: (currencies) => ListView.builder(
                itemCount: currencies.length,
                itemBuilder: (context, index) =>
                    CurrencyListItem(currency: currencies[index]),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
          // loading hidden
          currenciesAsync.when(
            data: (currencies) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CurrencyConverterScreen()),
                  );
                },
                child: const Text('Rate Conversion'),
              ),
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
