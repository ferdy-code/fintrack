import 'package:flutter/material.dart';

class MonthlyTrendChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const MonthlyTrendChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return const Card(child: Center(child: Text('Monthly Trend Chart')));
  }
}
