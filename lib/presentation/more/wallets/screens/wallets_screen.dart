import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../providers/wallet_provider.dart';

class WalletsScreen extends ConsumerWidget {
  const WalletsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(walletListProvider, (prev, next) {
      if (next.errorMessage != null &&
          next.errorMessage != prev?.errorMessage) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    final state = ref.watch(walletListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallets'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: () => context.push('/more/wallets/add'),
          ),
        ],
      ),
      body: switch (state.status) {
        WalletListStatus.initial || WalletListStatus.loading => const Center(
          child: CircularProgressIndicator(),
        ),
        WalletListStatus.error => Center(
          child: Text(state.errorMessage ?? 'Something went wrong'),
        ),
        WalletListStatus.loaded =>
          state.wallets.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No wallets yet',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () =>
                      ref.read(walletListProvider.notifier).fetchWallets(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.wallets.length,
                    itemBuilder: (context, index) {
                      final wallet = state.wallets[index];
                      return Dismissible(
                        key: ValueKey(wallet.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 24),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.delete_rounded,
                            color: Colors.white,
                          ),
                        ),
                        confirmDismiss: (_) async {
                          return await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Delete Wallet'),
                              content: Text(
                                'Are you sure you want to delete ${wallet.name}?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx, false),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx, true),
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        onDismissed: (_) {
                          ref
                              .read(walletListProvider.notifier)
                              .removeWallet(wallet.id.toString());
                        },
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: _parseColor(
                                  wallet.color,
                                ).withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                _parseIcon(wallet.icon),
                                color: _parseColor(wallet.color),
                              ),
                            ),
                            title: Text(wallet.name),
                            subtitle: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    wallet.type,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Text(
                              CurrencyFormatter.formatAmount(
                                wallet.balance,
                                wallet.currencyCode,
                                wallet.currencySymbol,
                              ),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
      },
    );
  }

  Color _parseColor(String? colorHex) {
    if (colorHex == null) return Colors.teal;
    try {
      return Color(int.parse(colorHex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return Colors.teal;
    }
  }

  IconData _parseIcon(String? iconName) {
    if (iconName == null) return Icons.account_balance_wallet_rounded;
    const iconMap = {
      'account_balance': Icons.account_balance,
      'account_balance_wallet': Icons.account_balance_wallet_rounded,
      'credit_card': Icons.credit_card_rounded,
      'payments': Icons.payments_rounded,
      'savings': Icons.savings_rounded,
      'money': Icons.attach_money_rounded,
      'phone_android': Icons.phone_android_rounded,
    };
    return iconMap[iconName] ?? Icons.account_balance_wallet_rounded;
  }
}
