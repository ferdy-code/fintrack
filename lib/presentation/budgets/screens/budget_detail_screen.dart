import 'package:flutter/material.dart';

class BudgetDetailScreen extends StatelessWidget {
  final String id;

  const BudgetDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Budget Detail')),
      body: Center(child: Text('Budget Detail - $id')),
    );
  }
}
