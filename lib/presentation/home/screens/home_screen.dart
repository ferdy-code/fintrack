import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../more/wallets/providers/wallet_provider.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/balance_card.dart';
import '../widgets/budget_alerts_section.dart';
import '../widgets/monthly_trend_chart.dart';
import '../widgets/recent_transactions.dart';
import '../widgets/spending_pie_chart.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dashboardProvider.notifier).fetchDashboard();
      ref.read(walletListProvider.notifier).fetchWallets();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(dashboardProvider, (prev, next) {
      if (next.errorMessage != null &&
          next.errorMessage != prev?.errorMessage) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    final state = ref.watch(dashboardProvider);
    final walletState = ref.watch(walletListProvider);
    final defaultWallet = walletState.wallets.isNotEmpty
        ? walletState.wallets.first
        : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('FinTrack'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications coming soon')),
              );
            },
          ),
        ],
      ),
      body: state.isLoading && state.data == null
          ? const Center(child: CircularProgressIndicator())
          : state.errorMessage != null && state.data == null
          ? _buildError(state.errorMessage!)
          : RefreshIndicator(
              onRefresh: () =>
                  ref.read(dashboardProvider.notifier).fetchDashboard(),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            const SizedBox(height: 12),
                            if (state.data != null) ...[
                              BalanceCard(
                                balance: state.data!.totalBalance,
                                monthSummary: state.data!.monthSummary,
                                currencyCode: state.data!.defaultCurrency,
                                currencySymbol: defaultWallet?.currencySymbol,
                              ),
                              const SizedBox(height: 32),
                              BudgetAlertsSection(
                                budgetAlerts: state.data!.budgetAlerts,
                                currencyCode: state.data!.defaultCurrency,
                                currencySymbol: defaultWallet?.currencySymbol,
                              ),
                              if (state.data!.budgetAlerts.isNotEmpty)
                                const SizedBox(height: 32),
                              SpendingPieChart(
                                categoryBreakdown:
                                    state.data!.categoryBreakdown,
                                currencyCode: state.data!.defaultCurrency,
                                currencySymbol: defaultWallet?.currencySymbol,
                              ),
                              const SizedBox(height: 32),
                              MonthlyTrendChart(
                                monthlyTrend: state.data!.monthlyTrend,
                              ),
                              const SizedBox(height: 32),
                              RecentTransactions(
                                transactions: state.data!.recentTransactions,
                              ),
                              const SizedBox(height: 32),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () =>
                ref.read(dashboardProvider.notifier).fetchDashboard(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
