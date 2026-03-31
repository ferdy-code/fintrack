import 'package:flutter/material.dart';

class TransactionListItem extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const TransactionListItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return const ListTile(title: Text('Transaction Item'));
  }
}
