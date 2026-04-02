import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../data/models/dashboard_model.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  final MonthSummary monthSummary;
  final String currencyCode;
  final String? currencySymbol;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.monthSummary,
    required this.currencyCode,
    this.currencySymbol,
  });

  @override
  Widget build(BuildContext context) {
    final formatted = CurrencyFormatter.formatAmount(
      balance,
      currencyCode,
      currencySymbol ?? '',
    );

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Text(
              'Total Balance',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              formatted,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSummaryItem(
                  icon: Icons.arrow_upward_rounded,
                  label: 'Income',
                  amount: CurrencyFormatter.formatAmount(
                    monthSummary.income,
                    currencyCode,
                    currencySymbol ?? '',
                  ),
                  color: AppColors.incomeGreen,
                ),
                Container(width: 1, height: 40, color: Colors.white24),
                _buildSummaryItem(
                  icon: Icons.arrow_downward_rounded,
                  label: 'Expense',
                  amount: CurrencyFormatter.formatAmount(
                    monthSummary.expense,
                    currencyCode,
                    currencySymbol ?? '',
                  ),
                  color: AppColors.expenseRed,
                ),
                Container(width: 1, height: 40, color: Colors.white24),
                _buildSummaryItem(
                  icon: Icons.savings_rounded,
                  label: 'Savings',
                  amount:
                      '${(monthSummary.savingsRate * 100).toStringAsFixed(0)}%',
                  color: Colors.amber.shade300,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem({
    required IconData icon,
    required String label,
    required String amount,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
