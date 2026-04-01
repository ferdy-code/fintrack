import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../data/models/category_model.dart';
import '../../../../data/models/transaction_model.dart';
import '../../../../data/models/wallet_model.dart';
import '../providers/transaction_provider.dart';

class TransactionDetailScreen extends ConsumerStatefulWidget {
  final String id;

  const TransactionDetailScreen({super.key, required this.id});

  @override
  ConsumerState<TransactionDetailScreen> createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState
    extends ConsumerState<TransactionDetailScreen> {
  TransactionModel? _transaction;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadTransaction();
  }

  Future<void> _loadTransaction() async {
    try {
      final repo = ref.read(transactionRepositoryProvider);
      final tx = await repo.getTransaction(int.parse(widget.id));
      if (mounted) {
        setState(() {
          _transaction = tx;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Detail'),
        actions: [
          if (_transaction != null)
            IconButton(
              icon: const Icon(Icons.edit_rounded),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit coming soon')),
                );
              },
            ),
          if (_transaction != null)
            IconButton(
              icon: const Icon(Icons.delete_rounded),
              onPressed: () => _confirmDelete(context),
            ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                  _error = null;
                });
                _loadTransaction();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    final tx = _transaction!;
    final isExpense = tx.type == 'expense';
    final isTransfer = tx.type == 'transfer';
    final amountColor = isExpense
        ? AppColors.expenseRed
        : isTransfer
        ? AppColors.budgetBlue
        : AppColors.incomeGreen;
    final prefix = isExpense ? '-' : '+';
    final category = tx.category;
    final wallet = tx.wallet;
    final catColor = _parseColor(category?.color);
    final catIcon = _getIcon(category?.icon);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildAmountCard(tx, amountColor, prefix),
          const SizedBox(height: 24),
          _buildTypeBadge(tx.type),
          if (tx.aiCategorized) ...[
            const SizedBox(height: 8),
            _buildAiChip(tx),
          ],
          const SizedBox(height: 24),
          _buildDetailsCard(tx, category, catColor, catIcon, wallet),
        ],
      ),
    );
  }

  Widget _buildAmountCard(TransactionModel tx, Color color, String prefix) {
    final formatted = CurrencyFormatter.formatAmount(
      tx.amount,
      tx.currencyCode,
      tx.wallet?.currencySymbol ?? '',
    );

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          children: [
            Text(
              '$prefix$formatted',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _formatDate(tx.transactionDate),
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 2),
            Text(
              _formatTime(tx.transactionDate),
              style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeBadge(String type) {
    final color = type == 'expense'
        ? AppColors.expenseRed
        : type == 'transfer'
        ? AppColors.budgetBlue
        : AppColors.incomeGreen;
    final label = type[0].toUpperCase() + type.substring(1);
    final icon = type == 'expense'
        ? Icons.arrow_downward_rounded
        : type == 'transfer'
        ? Icons.swap_horiz_rounded
        : Icons.arrow_upward_rounded;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAiChip(TransactionModel tx) {
    final confidence = tx.aiConfidence != null
        ? '${(tx.aiConfidence! * 100).toInt()}%'
        : '';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.auto_awesome_rounded,
            size: 16,
            color: Colors.purple.shade400,
          ),
          const SizedBox(width: 6),
          Text(
            'Categorized by AI${confidence.isNotEmpty ? ' ($confidence confidence)' : ''}',
            style: TextStyle(
              color: Colors.purple.shade700,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsCard(
    TransactionModel tx,
    CategoryModel? category,
    Color catColor,
    IconData catIcon,
    WalletModel? wallet,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildDetailRow(
              icon: catIcon,
              iconColor: catColor,
              iconBg: catColor.withValues(alpha: 0.1),
              label: 'Category',
              value: category?.name ?? 'Uncategorized',
            ),
            if (wallet != null) ...[
              const Divider(height: 24),
              _buildDetailRow(
                icon: Icons.account_balance_wallet_rounded,
                iconColor: AppColors.primarySeed,
                iconBg: AppColors.primarySeed.withValues(alpha: 0.1),
                label: 'Wallet',
                value: wallet.name,
              ),
            ],
            if (tx.description != null && tx.description!.isNotEmpty) ...[
              const Divider(height: 24),
              _buildDetailRow(
                icon: Icons.description_outlined,
                iconColor: Colors.grey.shade700,
                iconBg: Colors.grey.shade100,
                label: 'Description',
                value: tx.description!,
              ),
            ],
            if (tx.merchantName != null && tx.merchantName!.isNotEmpty) ...[
              const Divider(height: 24),
              _buildDetailRow(
                icon: Icons.store_outlined,
                iconColor: Colors.orange.shade700,
                iconBg: Colors.orange.shade50,
                label: 'Merchant',
                value: tx.merchantName!,
              ),
            ],
            if (tx.notes != null && tx.notes!.isNotEmpty) ...[
              const Divider(height: 24),
              _buildDetailRow(
                icon: Icons.note_outlined,
                iconColor: Colors.blue.shade700,
                iconBg: Colors.blue.shade50,
                label: 'Notes',
                value: tx.notes!,
              ),
            ],
            if (tx.isRecurring) ...[
              const Divider(height: 24),
              _buildDetailRow(
                icon: Icons.repeat_rounded,
                iconColor: AppColors.warningAmber,
                iconBg: AppColors.warningAmber.withValues(alpha: 0.1),
                label: 'Recurring',
                value: 'Yes',
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Transaction'),
        content: const Text(
          'Are you sure you want to delete this transaction?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirm == true && mounted) {
      ref
          .read(transactionListProvider.notifier)
          .deleteTransaction(int.parse(widget.id));
      if (context.mounted) context.pop();
    }
  }

  String _formatDate(DateTime date) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${date.day} ${months[date.month]} ${date.year}';
  }

  String _formatTime(DateTime date) {
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  Color _parseColor(String? hex) {
    if (hex == null) return Colors.grey;
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return Colors.grey;
    }
  }

  IconData _getIcon(String? name) {
    const map = {
      'restaurant': Icons.restaurant_rounded,
      'directions_car': Icons.directions_car_rounded,
      'shopping_bag': Icons.shopping_bag_rounded,
      'home': Icons.home_rounded,
      'local_hospital': Icons.local_hospital_rounded,
      'school': Icons.school_rounded,
      'flight': Icons.flight_rounded,
      'sports_soccer': Icons.sports_soccer_rounded,
      'movie': Icons.movie_rounded,
      'work': Icons.work_rounded,
      'pets': Icons.pets_rounded,
      'music_note': Icons.music_note_rounded,
      'category': Icons.category_rounded,
      'attach_money': Icons.attach_money_rounded,
      'trending_up': Icons.trending_up_rounded,
      'card_giftcard': Icons.card_giftcard_rounded,
    };
    return map[name] ?? Icons.category_rounded;
  }
}
