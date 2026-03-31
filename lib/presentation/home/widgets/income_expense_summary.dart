import 'package:flutter/material.dart';

class IncomeExpenseSummary extends StatelessWidget {
  final double income;
  final double expense;

  const IncomeExpenseSummary({super.key, required this.income, required this.expense});

  @override
  Widget build(BuildContext context) {
    return const Card(child: Center(child: Text('Income/Expense Summary')));
  }
}
