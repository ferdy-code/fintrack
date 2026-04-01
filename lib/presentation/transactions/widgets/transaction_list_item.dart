import 'package:flutter/material.dart';
import '../../../../data/models/transaction_model.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/currency_formatter.dart';

class TransactionListItem extends StatelessWidget {
  final TransactionModel transaction;
  final VoidCallback? onTap;

  const TransactionListItem({super.key, required this.transaction, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isExpense = transaction.type == 'expense';
    final category = transaction.category;
    final wallet = transaction.wallet;
    final colorHex = category?.color;
    Color catColor = Colors.grey;
    try {
      if (colorHex != null) {
        catColor = Color(int.parse(colorHex.replaceFirst('#', '0xFF')));
      }
    } catch (_) {}

    final iconName = category?.icon ?? 'category';
    const iconMap = {
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
    final catIcon = iconMap[iconName] ?? Icons.category_rounded;

    final subtitle = <String>[
      if (transaction.description != null &&
          transaction.description!.isNotEmpty)
        transaction.description!,
      if (transaction.merchantName != null &&
          transaction.merchantName!.isNotEmpty)
        transaction.merchantName!,
      if (wallet != null) wallet.name,
    ].join(' · ');

    final amountColor = isExpense
        ? AppColors.expenseRed
        : AppColors.incomeGreen;
    final prefix = isExpense ? '-' : '+';
    final formattedAmount = CurrencyFormatter.formatAmount(
      transaction.amount,
      transaction.currencyCode,
      wallet?.currencySymbol ?? '',
    );

    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: catColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(catIcon, color: catColor, size: 22),
      ),
      title: Text(
        category?.name ?? 'Uncategorized',
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '$prefix$formattedAmount',
            style: TextStyle(fontWeight: FontWeight.w600, color: amountColor),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (transaction.aiCategorized)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.auto_awesome_rounded,
                    size: 12,
                    color: Colors.purple.shade300,
                  ),
                ),
              Text(
                _formatTime(transaction.transactionDate),
                style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime date) {
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
