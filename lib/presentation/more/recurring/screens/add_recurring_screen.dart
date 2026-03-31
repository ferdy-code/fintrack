import 'package:flutter/material.dart';

class AddRecurringScreen extends StatelessWidget {
  const AddRecurringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Recurring Transaction')),
      body: const Center(child: Text('Add Recurring Screen')),
    );
  }
}
