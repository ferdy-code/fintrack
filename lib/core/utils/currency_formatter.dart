import 'dart:developer';

import 'package:intl/intl.dart';

class CurrencyFormatter {
  static const Map<String, String> _currencyLocales = {
    'IDR': 'id_ID',
    'USD': 'en_US',
    'EUR': 'de_DE',
    'GBP': 'en_GB',
    'JPY': 'ja_JP',
    'SGD': 'en_SG',
    'MYR': 'ms_MY',
    'CNY': 'zh_CN',
    'KRW': 'ko_KR',
    'AUD': 'en_AU',
  };

  static String formatAmount(
    double amount,
    String currencyCode,
    String symbol, {
    int? decimalPlaces,
  }) {
    log(amount.toString());
    final locale = _currencyLocales[currencyCode] ?? 'en_US';

    final decimals =
        decimalPlaces ??
        (currencyCode == 'IDR' || currencyCode == 'JPY' || currencyCode == 'KRW'
            ? 0
            : 2);

    final pattern = '#,##0${decimals > 0 ? '.${'0' * decimals}' : ''}';

    final formatter = NumberFormat(pattern, locale);
    return '$symbol ${formatter.format(amount)}';
  }
}
