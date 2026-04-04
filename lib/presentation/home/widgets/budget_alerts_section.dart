import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../data/models/budget_model.dart';

class BudgetAlertsSection extends StatelessWidget {
  final List<BudgetModel> budgetAlerts;
  final String currencyCode;
  final String? currencySymbol;

  const BudgetAlertsSection({
    super.key,
    required this.budgetAlerts,
    required this.currencyCode,
    this.currencySymbol,
  });

  @override
  Widget build(BuildContext context) {
    if (budgetAlerts.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Budget Alerts',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                '${budgetAlerts.length} budget${budgetAlerts.length > 1 ? 's' : ''}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: budgetAlerts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final budget = budgetAlerts[index];
              return _BudgetAlertCard(
                budget: budget,
                currencyCode: currencyCode,
                currencySymbol: currencySymbol,
                onTap: () => context.push('/budgets/${budget.id}'),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BudgetAlertCard extends StatelessWidget {
  final BudgetModel budget;
  final String currencyCode;
  final String? currencySymbol;
  final VoidCallback onTap;

  const _BudgetAlertCard({
    required this.budget,
    required this.currencyCode,
    this.currencySymbol,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final rawPercentage = budget.percentageUsed;
    final percentage = rawPercentage <= 1 ? rawPercentage * 100 : rawPercentage;
    final color = _getProgressColor(percentage);
    final catColor = _parseColor(budget.category.color);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: catColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getIcon(budget.category.icon),
                      color: catColor,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      budget.category.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (budget.isOverBudget ||
                      percentage >= budget.alertThreshold)
                    Icon(Icons.warning_rounded, size: 16, color: color),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: (percentage / 100).clamp(0, 1),
                  backgroundColor: Colors.grey.shade200,
                  color: color,
                  minHeight: 6,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${CurrencyFormatter.formatAmount(budget.spent, currencyCode, currencySymbol ?? '')} / ${CurrencyFormatter.formatAmount(budget.amount, currencyCode, currencySymbol ?? '')}',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
    );
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
