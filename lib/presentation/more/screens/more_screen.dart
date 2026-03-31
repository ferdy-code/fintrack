import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_rounded),
            title: const Text('Wallets'),
            onTap: () => context.push('/more/wallets'),
          ),
          ListTile(
            leading: const Icon(Icons.category_rounded),
            title: const Text('Categories'),
            onTap: () => context.push('/more/categories'),
          ),
          ListTile(
            leading: const Icon(Icons.repeat_rounded),
            title: const Text('Recurring'),
            onTap: () => context.push('/more/recurring'),
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb_rounded),
            title: const Text('AI Insights'),
            onTap: () => context.push('/more/insights'),
          ),
          ListTile(
            leading: const Icon(Icons.chat_rounded),
            title: const Text('AI Chat'),
            onTap: () => context.push('/more/chat'),
          ),
          ListTile(
            leading: const Icon(Icons.download_rounded),
            title: const Text('Export'),
            onTap: () => context.push('/more/export'),
          ),
        ],
      ),
    );
  }
}
