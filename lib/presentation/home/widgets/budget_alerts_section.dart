import 'package:flutter/material.dart';

class BudgetAlertsSection extends StatelessWidget {
  final List<Map<String, dynamic>> alerts;

  const BudgetAlertsSection({super.key, required this.alerts});

  @override
  Widget build(BuildContext context) {
    return const Card(child: Center(child: Text('Budget Alerts')));
  }
}
