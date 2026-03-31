import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final String? selectedCategoryId;
  final ValueChanged<String?>? onCategorySelected;

  const CategorySelector({super.key, this.selectedCategoryId, this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 80, child: Center(child: Text('Category Selector')));
  }
}
