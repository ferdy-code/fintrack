import 'package:flutter/material.dart';
import '../providers/transaction_filters.dart';

class TransactionFilterBar extends StatelessWidget {
  final TransactionFilters filters;
  final ValueChanged<TransactionFilters> onFiltersChanged;

  const TransactionFilterBar({
    super.key,
    required this.filters,
    required this.onFiltersChanged,
  });

  @override
  Widget build(BuildContext context) {
    final hasActive =
        filters.type != null ||
        filters.walletId != null ||
        filters.categoryId != null ||
        filters.startDate != null;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _buildDateChip(context),
          const SizedBox(width: 8),
          _buildTypeChip(context),
          const SizedBox(width: 8),
          if (hasActive)
            ActionChip(
              label: const Text('Clear'),
              onPressed: () => onFiltersChanged(const TransactionFilters()),
            ),
        ],
      ),
    );
  }

  Widget _buildDateChip(BuildContext context) {
    String label = 'This Month';
    if (filters.startDate != null && filters.endDate != null) {
      final start = filters.startDate!;
      final end = filters.endDate!;
      if (start.month == end.month && start.year == end.year) {
        label = '${start.day} - ${end.day} ${_monthName(start.month)}';
      } else {
        label = '${start.day}/${start.month} - ${end.day}/${end.month}';
      }
    }

    final active = filters.startDate != null;
    return FilterChip(
      selected: active,
      label: Text(label),
      showCheckmark: false,
      onSelected: (_) async {
        final now = DateTime.now();
        final firstDay = DateTime(now.year, now.month, 1);
        final lastDay = DateTime(now.year, now.month + 1, 0);
        final picked = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2020),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          initialDateRange: filters.startDate != null
              ? DateTimeRange(
                  start: filters.startDate!,
                  end: filters.endDate ?? filters.startDate!,
                )
              : DateTimeRange(start: firstDay, end: lastDay),
        );
        if (picked != null) {
          onFiltersChanged(
            filters.copyWith(startDate: picked.start, endDate: picked.end),
          );
        }
      },
    );
  }

  Widget _buildTypeChip(BuildContext context) {
    String label = 'All';
    if (filters.type != null) {
      label = filters.type == 'expense' ? 'Expense' : 'Income';
    }

    final active = filters.type != null;
    return FilterChip(
      selected: active,
      label: Text(label),
      showCheckmark: false,
      onSelected: (_) {
        String? next;
        if (filters.type == null) {
          next = 'expense';
        } else if (filters.type == 'expense') {
          next = 'income';
        } else {
          next = null;
        }
        onFiltersChanged(filters.copyWith(type: next));
      },
    );
  }

  String _monthName(int month) {
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
    return months[month];
  }
}
