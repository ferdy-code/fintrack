import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../data/models/category_model.dart';
import '../../more/categories/providers/category_provider.dart';
import '../../transactions/widgets/category_selector.dart';
import '../providers/budget_provider.dart';

class AddBudgetScreen extends ConsumerStatefulWidget {
  const AddBudgetScreen({super.key});

  @override
  ConsumerState<AddBudgetScreen> createState() => _AddBudgetScreenState();
}

class _AddBudgetScreenState extends ConsumerState<AddBudgetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  int? _selectedCategoryId;
  String _selectedPeriod = 'monthly';
  double _alertThreshold = 0.8;
  DateTime _startDate = DateTime.now();
  bool _isSaving = false;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedCategoryId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a category')));
      return;
    }

    setState(() => _isSaving = true);
    try {
      final repo = ref.read(budgetRepositoryProvider);
      await repo.createBudget(
        categoryId: _selectedCategoryId!,
        amount: double.parse(_amountController.text),
        period: _selectedPeriod,
        alertThreshold: _alertThreshold,
        startDate: _startDate,
      );
      if (mounted) {
        ref.read(budgetListProvider.notifier).fetchBudgets();
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Budget'),
        actions: [
          TextButton(
            onPressed: _isSaving ? null : _save,
            child: _isSaving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Save'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                title: Text(
                  _selectedCategoryId != null
                      ? _getCategoryName(_selectedCategoryId!)
                      : 'Select Category',
                  style: TextStyle(
                    color: _selectedCategoryId != null
                        ? null
                        : Colors.grey.shade600,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right_rounded),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade400),
                ),
                onTap: () {
                  CategorySelector.show(
                    context: context,
                    type: 'expense',
                    selectedCategoryId: _selectedCategoryId?.toString(),
                    onCategorySelected: (CategoryModel cat) {
                      setState(() {
                        _selectedCategoryId = cat.id;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Budget Amount',
                  prefixIcon: Icon(Icons.attach_money_rounded),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Amount is required';
                  if (double.tryParse(v) == null) return 'Invalid amount';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _selectedPeriod,
                decoration: const InputDecoration(
                  labelText: 'Period',
                  prefixIcon: Icon(Icons.calendar_today_rounded),
                ),
                items: const [
                  DropdownMenuItem(value: 'weekly', child: Text('Weekly')),
                  DropdownMenuItem(value: 'monthly', child: Text('Monthly')),
                  DropdownMenuItem(value: 'yearly', child: Text('Yearly')),
                ],
                onChanged: (v) => setState(() => _selectedPeriod = v!),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Alert Threshold'),
                  Text(
                    '${(_alertThreshold * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Slider(
                value: _alertThreshold,
                min: 0.5,
                max: 1.0,
                divisions: 10,
                label: '${(_alertThreshold * 100).toStringAsFixed(0)}%',
                onChanged: (v) => setState(() => _alertThreshold = v),
              ),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                title: Text(
                  '${_startDate.day}/${_startDate.month}/${_startDate.year}',
                ),
                leading: const Icon(Icons.calendar_today_rounded),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade400),
                ),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _startDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (picked != null) {
                    setState(() => _startDate = picked);
                  }
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  String _getCategoryName(int id) {
    final state = ref.read(categoryListProvider);
    final cat = state.categories.where((c) => c.id == id).firstOrNull;
    return cat?.name ?? 'Unknown';
  }
}
