import 'package:flutter/material.dart';

class SpendingPieChart extends StatelessWidget {
  final Map<String, double> data;

  const SpendingPieChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return const Card(child: Center(child: Text('Spending Pie Chart')));
  }
}
