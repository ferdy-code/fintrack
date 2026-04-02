import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../more/wallets/providers/wallet_provider.dart';
import '../providers/budget_provider.dart';
import '../widgets/budget_progress_card.dart';

class BudgetsScreen extends ConsumerWidget {
  const BudgetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(budgetListProvider, (prev, next) {
      if (next.errorMessage != null &&
          next.errorMessage != prev?.errorMessage) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    final state = ref.watch(budgetListProvider);
    final walletState = ref.watch(walletListProvider);
    final defaultWallet = walletState.wallets.isNotEmpty
        ? walletState.wallets.first
        : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Budgets')),
      body: state.isLoading && state.budgets.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : state.errorMessage != null && state.budgets.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.errorMessage!, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        ref.read(budgetListProvider.notifier).fetchBudgets(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : state.budgets.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 64,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No budgets yet',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Create a budget to track your spending',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () =>
                  ref.read(budgetListProvider.notifier).fetchBudgets(),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 8, bottom: 80),
                itemCount: state.budgets.length,
                itemBuilder: (context, index) {
                  final budget = state.budgets[index];
                  return BudgetProgressCard(
                    budget: budget,
                    currencyCode: defaultWallet?.currencyCode ?? '',
                    currencySymbol: defaultWallet?.currencySymbol,
                    onTap: () => context.push('/budgets/${budget.id}'),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'budget_fab',
        onPressed: () => context.push('/budgets/add'),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
