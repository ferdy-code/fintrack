import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../data/models/budget_model.dart';

class BudgetProgressCard extends StatelessWidget {
  final BudgetModel budget;
  final String currencyCode;
  final String? currencySymbol;
  final VoidCallback? onTap;

  const BudgetProgressCard({
    super.key,
    required this.budget,
    required this.currencyCode,
    this.currencySymbol,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final rawPercentage = budget.percentageUsed;
    final percentage = rawPercentage <= 1 ? rawPercentage * 100 : rawPercentage;
    final color = _getProgressColor(percentage);
    final catColor = _parseColor(budget.category.color);
    final catIcon = _getIcon(budget.category.icon);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: catColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(catIcon, color: catColor, size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          budget.category.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${percentage.toStringAsFixed(0)}% used'
                          '${budget.daysRemaining > 0 ? ' · ${budget.daysRemaining} days left' : ''}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (percentage >= budget.alertThreshold)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.warning_rounded,
                        color: color,
                        size: 20,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: (percentage / 100).clamp(0, 1),
                  backgroundColor: Colors.grey.shade200,
                  color: color,
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    CurrencyFormatter.formatAmount(
                      budget.spent,
                      currencyCode,
                      currencySymbol ?? '',
                    ),
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  Text(
                    CurrencyFormatter.formatAmount(
                      budget.amount,
                      currencyCode,
                      currencySymbol ?? '',
                    ),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ],
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
