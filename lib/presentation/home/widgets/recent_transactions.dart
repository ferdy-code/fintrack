import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../data/models/transaction_model.dart';
import '../../transactions/widgets/transaction_list_item.dart';

class RecentTransactions extends StatelessWidget {
  final List<TransactionModel> transactions;

  const RecentTransactions({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Transactions',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () => context.go('/transactions'),
                child: const Text('See All'),
              ),
            ],
          ),
        ),
        ...transactions
            .take(5)
            .map(
              (tx) => TransactionListItem(
                transaction: tx,
                onTap: () => context.push('/transactions/${tx.id}'),
              ),
            ),
      ],
    );
  }
}
