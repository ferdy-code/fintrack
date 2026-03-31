import 'package:flutter/material.dart';

class TransactionFilterBar extends StatelessWidget {
  final ValueChanged<String>? onFilterChanged;

  const TransactionFilterBar({super.key, this.onFilterChanged});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 48, child: Center(child: Text('Filter Bar')));
  }
}
