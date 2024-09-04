import 'package:bito_test/models/currency.dart';
import 'package:bito_test/utils/formatters.dart';
import 'package:cached_network_image/cached_network_image.dart'; // 添加缓存网络图像包
import 'package:flutter/material.dart';

class CurrencyListItem extends StatelessWidget {
  final Currency currency;

  const CurrencyListItem({super.key, required this.currency});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: currency.currencyIcon,
        width: 40,
        height: 40,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      title: Text('${currency.currency} / TWD'),
      trailing: Text(formatCurrency(
          currency.twdPrice.toDouble(), int.parse(currency.amountDecimal))),
    );
  }
}
