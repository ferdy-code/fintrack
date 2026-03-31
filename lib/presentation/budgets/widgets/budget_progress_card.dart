import 'package:flutter/material.dart';

class BudgetProgressCard extends StatelessWidget {
  final Map<String, dynamic> budget;

  const BudgetProgressCard({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    return const Card(child: Center(child: Text('Budget Progress')));
  }
}
