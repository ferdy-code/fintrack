import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../data/models/recurring_transaction_model.dart';
import '../providers/recurring_provider.dart';

class RecurringScreen extends ConsumerWidget {
  const RecurringScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(recurringListProvider, (prev, next) {
      if (next.errorMessage != null &&
          next.errorMessage != prev?.errorMessage) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    final state = ref.watch(recurringListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Recurring Transactions')),
      body: state.isLoading && state.recurring.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : state.errorMessage != null && state.recurring.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.errorMessage!, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref
                        .read(recurringListProvider.notifier)
                        .fetchRecurring(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : state.recurring.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.repeat_rounded,
                    size: 64,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No recurring transactions',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Create one to automate your finances',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () =>
                  ref.read(recurringListProvider.notifier).fetchRecurring(),
              child: _buildGroupedList(context, ref, state.recurring),
            ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'recurring_fab',
        onPressed: () => context.push('/more/recurring/add'),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Widget _buildGroupedList(
    BuildContext context,
    WidgetRef ref,
    List<RecurringTransactionModel> items,
  ) {
    final active = items.where((r) => r.isActive).toList();
    final inactive = items.where((r) => !r.isActive).toList();

    return ListView(
      padding: const EdgeInsets.only(bottom: 80),
      children: [
        if (active.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Active (${active.length})',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          ...active.map(
            (r) => _RecurringItem(
              recurring: r,
              onSkip: () =>
                  ref.read(recurringListProvider.notifier).skipNext(r.id),
              onProcess: () =>
                  ref.read(recurringListProvider.notifier).processNow(r.id),
              onDelete: () => _confirmDelete(context, ref, r.id),
            ),
          ),
        ],
        if (inactive.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Inactive (${inactive.length})',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          ...inactive.map(
            (r) => _RecurringItem(
              recurring: r,
              onSkip: () =>
                  ref.read(recurringListProvider.notifier).skipNext(r.id),
              onProcess: () =>
                  ref.read(recurringListProvider.notifier).processNow(r.id),
              onDelete: () => _confirmDelete(context, ref, r.id),
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    int id,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Recurring Transaction'),
        content: const Text(
          'Are you sure you want to delete this recurring transaction?',
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
    if (confirm == true) {
      ref.read(recurringListProvider.notifier).deleteRecurring(id);
    }
  }
}

class _RecurringItem extends StatelessWidget {
  final RecurringTransactionModel recurring;
  final VoidCallback onSkip;
  final VoidCallback onProcess;
  final VoidCallback onDelete;

  const _RecurringItem({
    required this.recurring,
    required this.onSkip,
    required this.onProcess,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isExpense = recurring.type == 'expense';
    final amountColor = isExpense
        ? AppColors.expenseRed
        : AppColors.incomeGreen;
    final prefix = isExpense ? '-' : '+';
    final category = recurring.category;
    final catColor = _parseColor(category?.color);
    final catIcon = _getIcon(category?.icon);

    final formatted = CurrencyFormatter.formatAmount(
      recurring.amount,
      recurring.currencyCode.isNotEmpty ? recurring.currencyCode : '',
      recurring.wallet.currencySymbol,
    );

    return Dismissible(
      key: ValueKey(recurring.id),
      background: Container(
        color: Colors.blue,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        child: const Icon(Icons.skip_next_rounded, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.green,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.play_arrow_rounded, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          onSkip();
        } else {
          onProcess();
        }
        return false;
      },
      child: ListTile(
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
          recurring.description ?? category?.name ?? 'Recurring',
          style: const TextStyle(fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          children: [
            _buildFrequencyBadge(recurring.frequency),
            const SizedBox(width: 8),
            Text(
              _formatDate(recurring.nextDueDate),
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$prefix$formatted',
              style: TextStyle(fontWeight: FontWeight.w600, color: amountColor),
            ),
            if (!recurring.isActive)
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Icon(
                  Icons.pause_circle_outline,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
              ),
          ],
        ),
        onLongPress: () => _showActions(context),
      ),
    );
  }

  void _showActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.skip_next_rounded),
              title: const Text('Skip Next'),
              onTap: () {
                Navigator.pop(ctx);
                onSkip();
              },
            ),
            ListTile(
              leading: const Icon(Icons.play_arrow_rounded),
              title: const Text('Process Now'),
              onTap: () {
                Navigator.pop(ctx);
                onProcess();
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_rounded, color: Colors.red),
              title: const Text('Delete', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(ctx);
                onDelete();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrequencyBadge(String frequency) {
    Color color;
    switch (frequency) {
      case 'daily':
        color = Colors.blue;
      case 'weekly':
        color = Colors.green;
      case 'monthly':
        color = Colors.orange;
      case 'yearly':
        color = Colors.purple;
      default:
        color = Colors.grey;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        frequency[0].toUpperCase() + frequency.substring(1),
        style: TextStyle(
          fontSize: 10,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
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
