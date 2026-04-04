import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../data/models/budget_model.dart';
import '../../more/wallets/providers/wallet_provider.dart';
import '../providers/budget_provider.dart';

class BudgetDetailScreen extends ConsumerStatefulWidget {
  final String id;

  const BudgetDetailScreen({super.key, required this.id});

  @override
  ConsumerState<BudgetDetailScreen> createState() => _BudgetDetailScreenState();
}

class _BudgetDetailScreenState extends ConsumerState<BudgetDetailScreen> {
  BudgetModel? _budget;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadBudget();
  }

  Future<void> _loadBudget() async {
    try {
      final repo = ref.read(budgetRepositoryProvider);
      final budget = await repo.getBudget(int.parse(widget.id));
      if (mounted) {
        setState(() {
          _budget = budget;
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
        title: const Text('Budget Detail'),
        actions: [
          if (_budget != null)
            IconButton(
              icon: const Icon(Icons.delete_rounded),
              onPressed: () => _confirmDelete(context),
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(
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
                      _loadBudget();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : _buildContent(),
    );
  }

  Widget _buildContent() {
    final budget = _budget!;
    final walletState = ref.watch(walletListProvider);
    final defaultWallet = walletState.wallets.isNotEmpty
        ? walletState.wallets.first
        : null;
    final rawPercentage = budget.percentageUsed;
    final percentage = rawPercentage <= 1 ? rawPercentage * 100 : rawPercentage;
    final color = _getProgressColor(percentage);
    final catColor = _parseColor(budget.category.color);
    final catIcon = _getIcon(budget.category.icon);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 160,
                  height: 160,
                  child: CircularProgressIndicator(
                    value: (percentage / 100).clamp(0, 1),
                    strokeWidth: 12,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${percentage.toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'used',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildDetailRow(
                    icon: catIcon,
                    iconColor: catColor,
                    iconBg: catColor.withValues(alpha: 0.1),
                    label: 'Category',
                    value: budget.category.name,
                  ),
                  const Divider(height: 24),
                  _buildDetailRow(
                    icon: Icons.attach_money_rounded,
                    iconColor: AppColors.incomeGreen,
                    iconBg: AppColors.incomeGreen.withValues(alpha: 0.1),
                    label: 'Budget Limit',
                    value: CurrencyFormatter.formatAmount(
                      budget.amount,
                      defaultWallet?.currencyCode ?? '',
                      defaultWallet?.currencySymbol ?? '',
                    ),
                  ),
                  const Divider(height: 24),
                  _buildDetailRow(
                    icon: Icons.trending_up_rounded,
                    iconColor: color,
                    iconBg: color.withValues(alpha: 0.1),
                    label: 'Spent',
                    value: CurrencyFormatter.formatAmount(
                      budget.spent,
                      defaultWallet?.currencyCode ?? '',
                      defaultWallet?.currencySymbol ?? '',
                    ),
                  ),
                  const Divider(height: 24),
                  _buildDetailRow(
                    icon: Icons.account_balance_wallet_rounded,
                    iconColor: AppColors.primarySeed,
                    iconBg: AppColors.primarySeed.withValues(alpha: 0.1),
                    label: 'Remaining',
                    value: CurrencyFormatter.formatAmount(
                      budget.remaining,
                      defaultWallet?.currencyCode ?? '',
                      defaultWallet?.currencySymbol ?? '',
                    ),
                  ),
                  const Divider(height: 24),
                  _buildDetailRow(
                    icon: Icons.calendar_today_rounded,
                    iconColor: Colors.grey.shade700,
                    iconBg: Colors.grey.shade100,
                    label: 'Period',
                    value:
                        budget.period[0].toUpperCase() +
                        budget.period.substring(1),
                  ),
                  if (budget.periodStart != null) ...[
                    const Divider(height: 24),
                    _buildDetailRow(
                      icon: Icons.date_range_rounded,
                      iconColor: Colors.grey.shade700,
                      iconBg: Colors.grey.shade100,
                      label: 'Period Range',
                      value:
                          '${budget.periodStart ?? ''} - ${budget.periodEnd ?? ''}',
                    ),
                  ],
                  if (budget.daysRemaining > 0) ...[
                    const Divider(height: 24),
                    _buildDetailRow(
                      icon: Icons.schedule_rounded,
                      iconColor: AppColors.warningAmber,
                      iconBg: AppColors.warningAmber.withValues(alpha: 0.1),
                      label: 'Days Remaining',
                      value: '${budget.daysRemaining} days',
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
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
        title: const Text('Delete Budget'),
        content: const Text('Are you sure you want to delete this budget?'),
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
      try {
        await ref
            .read(budgetListProvider.notifier)
            .deleteBudget(int.parse(widget.id));
        if (context.mounted) context.pop();
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
  }

  Color _getProgressColor(double percentage) {
    if (percentage >= 100) return AppColors.expenseRed;
    if (percentage >= 80) return AppColors.warningAmber;
    if (percentage >= 50) return Colors.orange;
    return AppColors.incomeGreen;
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
