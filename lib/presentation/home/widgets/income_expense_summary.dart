import 'package:flutter/material.dart';
import '../../../../data/models/dashboard_model.dart';

class IncomeExpenseSummary extends StatelessWidget {
  final MonthSummary monthSummary;
  final String currencyCode;
  final String? currencySymbol;

  const IncomeExpenseSummary({
    super.key,
    required this.monthSummary,
    required this.currencyCode,
    this.currencySymbol,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
