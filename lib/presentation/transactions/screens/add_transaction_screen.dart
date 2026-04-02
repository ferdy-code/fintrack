import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/category_model.dart';
import '../../more/ai_insights/providers/insights_provider.dart';
import '../../more/wallets/providers/wallet_provider.dart';
import '../providers/transaction_provider.dart';
import '../widgets/category_selector.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  ConsumerState<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _merchantController = TextEditingController();
  final _notesController = TextEditingController();

  String _type = 'expense';
  int? _selectedWalletId;
  int? _selectedCategoryId;
  String? _selectedCategoryName;
  DateTime _selectedDate = DateTime.now();
  bool _isSaving = false;

  bool _isAiCategorizing = false;
  String? _aiSuggestion;
  double? _aiConfidence;
  bool _showAiSuggestion = false;
  int? _aiSuggestedCategoryId;

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    _merchantController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _aiCategorize() async {
    setState(() => _isAiCategorizing = true);
    try {
      final result = await ref
          .read(aiRepositoryProvider)
          .categorizeTransaction(
            description: _descriptionController.text.trim().isNotEmpty
                ? _descriptionController.text.trim()
                : null,
            merchantName: _merchantController.text.trim().isNotEmpty
                ? _merchantController.text.trim()
                : null,
            amount: _amountController.text.isNotEmpty
                ? double.tryParse(_amountController.text)
                : null,
            type: _type,
          );
      final categoryId = result['category_id'] as int?;
      final categoryName = result['category_name'] as String?;
      final confidence = (result['confidence'] as num?)?.toDouble() ?? 0;

      if (categoryId == null || categoryName == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('AI could not determine a category')),
          );
        }
        return;
      }

      if (confidence >= 0.85) {
        setState(() {
          _selectedCategoryId = categoryId;
          _selectedCategoryName = categoryName;
          _showAiSuggestion = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'AI: $categoryName (${(confidence * 100).toInt()}%)',
              ),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        setState(() {
          _showAiSuggestion = true;
          _aiSuggestion = categoryName;
          _aiConfidence = confidence;
          _aiSuggestedCategoryId = categoryId;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('AI error: ${e.toString()}')));
      }
    } finally {
      if (mounted) setState(() => _isAiCategorizing = false);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedWalletId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a wallet')));
      return;
    }
    if (_selectedCategoryId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a category')));
      return;
    }

    setState(() => _isSaving = true);
    try {
      final repo = ref.read(transactionRepositoryProvider);
      await repo.createTransaction(
        walletId: _selectedWalletId!,
        categoryId: _selectedCategoryId!,
        type: _type,
        amount: double.parse(_amountController.text),
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
        merchantName: _merchantController.text.trim().isNotEmpty
            ? _merchantController.text.trim()
            : null,
        transactionDate: _selectedDate,
        notes: _notesController.text.trim().isNotEmpty
            ? _notesController.text.trim()
            : null,
      );
      if (mounted) {
        ref
            .read(transactionListProvider.notifier)
            .fetchTransactions(reset: true);
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
        title: const Text('Add Transaction'),
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
                  ButtonSegment(value: 'transfer', label: Text('Transfer')),
                ],
                selected: {_type},
                onSelectionChanged: (v) => setState(() => _type = v.first),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'Amount',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: _type == 'expense'
                      ? AppColors.expenseRed
                      : AppColors.incomeGreen,
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
              const SizedBox(height: 24),
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
                  _selectedCategoryName ?? 'Select Category',
                  style: TextStyle(
                    color: _selectedCategoryId != null
                        ? null
                        : Colors.grey.shade600,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_selectedCategoryId == null)
                      IconButton(
                        icon: _isAiCategorizing
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.auto_fix_high_rounded),
                        tooltip: 'AI Categorize',
                        onPressed: _isAiCategorizing ? null : _aiCategorize,
                      ),
                    const Icon(Icons.chevron_right_rounded),
                  ],
                ),
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
                      setState(() {
                        _selectedCategoryId = cat.id;
                        _selectedCategoryName = cat.name;
                      });
                    },
                  );
                },
              ),
              if (_showAiSuggestion && _selectedCategoryId == null)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Suggested: $_aiSuggestion '
                          '(${(_aiConfidence! * 100).toInt()}%)',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedCategoryId = _aiSuggestedCategoryId;
                            _selectedCategoryName = _aiSuggestion;
                            _showAiSuggestion = false;
                          });
                        },
                        child: const Text('Accept'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() => _showAiSuggestion = false);
                        },
                        child: const Text('Dismiss'),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                title: Text(
                  '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                ),
                leading: const Icon(Icons.calendar_today_rounded),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade400),
                ),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (picked != null) {
                    setState(() => _selectedDate = picked);
                  }
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
              TextFormField(
                controller: _notesController,
                textInputAction: TextInputAction.done,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Notes',
                  prefixIcon: Icon(Icons.note_outlined),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
