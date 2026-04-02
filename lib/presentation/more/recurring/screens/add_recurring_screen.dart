import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../data/models/category_model.dart';
import '../../../transactions/widgets/category_selector.dart';
import '../../categories/providers/category_provider.dart';
import '../../wallets/providers/wallet_provider.dart';
import '../providers/recurring_provider.dart';

class AddRecurringScreen extends ConsumerStatefulWidget {
  const AddRecurringScreen({super.key});

  @override
  ConsumerState<AddRecurringScreen> createState() => _AddRecurringScreenState();
}

class _AddRecurringScreenState extends ConsumerState<AddRecurringScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _merchantController = TextEditingController();

  String _type = 'expense';
  int? _selectedWalletId;
  int? _selectedCategoryId;
  String _frequency = 'monthly';
  DateTime _startDate = DateTime.now().add(const Duration(days: 1));
  bool _autoCreate = false;
  bool _isSaving = false;

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    _merchantController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedWalletId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a wallet')));
      return;
    }

    setState(() => _isSaving = true);
    try {
      final repo = ref.read(recurringRepositoryProvider);
      await repo.createRecurring(
        walletId: _selectedWalletId!,
        categoryId: _selectedCategoryId,
        type: _type,
        amount: double.parse(_amountController.text),
        frequency: _frequency,
        nextDueDate: _startDate,
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
        merchantName: _merchantController.text.trim().isNotEmpty
            ? _merchantController.text.trim()
            : null,
        autoCreate: _autoCreate,
      );
      if (mounted) {
        ref.read(recurringListProvider.notifier).fetchRecurring();
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
    final walletState = ref.watch(walletListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recurring Transaction'),
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
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'expense', label: Text('Expense')),
                  ButtonSegment(value: 'income', label: Text('Income')),
                ],
                selected: {_type},
                onSelectionChanged: (v) => setState(() => _type = v.first),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: '0.00',
                  border: InputBorder.none,
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Amount is required';
                  if (double.tryParse(v) == null) return 'Invalid amount';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(
                  labelText: 'Wallet',
                  prefixIcon: Icon(Icons.account_balance_wallet_rounded),
                ),
                items: walletState.wallets
                    .map(
                      (w) => DropdownMenuItem(value: w.id, child: Text(w.name)),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _selectedWalletId = v),
              ),
              const SizedBox(height: 16),
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
                    type: _type,
                    selectedCategoryId: _selectedCategoryId?.toString(),
                    onCategorySelected: (CategoryModel cat) {
                      setState(() => _selectedCategoryId = cat.id);
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  prefixIcon: Icon(Icons.description_outlined),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _merchantController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Merchant Name',
                  prefixIcon: Icon(Icons.store_outlined),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _frequency,
                decoration: const InputDecoration(
                  labelText: 'Frequency',
                  prefixIcon: Icon(Icons.repeat_rounded),
                ),
                items: const [
                  DropdownMenuItem(value: 'daily', child: Text('Daily')),
                  DropdownMenuItem(value: 'weekly', child: Text('Weekly')),
                  DropdownMenuItem(value: 'monthly', child: Text('Monthly')),
                  DropdownMenuItem(value: 'yearly', child: Text('Yearly')),
                ],
                onChanged: (v) => setState(() => _frequency = v!),
              ),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                title: Text(
                  'Start: ${_startDate.day}/${_startDate.month}/${_startDate.year}',
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
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
                  );
                  if (picked != null) {
                    setState(() => _startDate = picked);
                  }
                },
              ),
              const SizedBox(height: 8),
              SwitchListTile(
                value: _autoCreate,
                title: const Text('Auto-create transactions'),
                subtitle: const Text(
                  'Automatically create transactions on due date',
                ),
                onChanged: (v) => setState(() => _autoCreate = v),
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
