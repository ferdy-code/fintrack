import 'package:flutter/material.dart';

class RecentTransactions extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;

  const RecentTransactions({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return const Card(child: Center(child: Text('Recent Transactions')));
  }
}
