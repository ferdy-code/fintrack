import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../auth/providers/auth_provider.dart';
import '../../../core/theme/theme_provider.dart';

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final theme = Theme.of(context);
    final currentThemeMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: ListView(
        children: [
          _buildProfileSection(context, theme, user),
          const Divider(height: 1),
          _buildSectionTitle(context, 'Finance'),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_rounded),
            title: const Text('Wallets'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push('/more/wallets'),
          ),
          ListTile(
            leading: const Icon(Icons.category_rounded),
            title: const Text('Categories'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push('/more/categories'),
          ),
          ListTile(
            leading: const Icon(Icons.repeat_rounded),
            title: const Text('Recurring Transactions'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push('/more/recurring'),
          ),
          ListTile(
            leading: const Icon(Icons.download_rounded),
            title: const Text('Export Data'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push('/more/export'),
          ),
          const Divider(height: 1),
          _buildSectionTitle(context, 'AI Tools'),
          ListTile(
            leading: const Icon(Icons.lightbulb_rounded),
            title: const Text('AI Insights'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push('/more/insights'),
          ),
          ListTile(
            leading: const Icon(Icons.chat_rounded),
            title: const Text('AI Financial Advisor'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push('/more/chat'),
          ),
          const Divider(height: 1),
          _buildSectionTitle(context, 'Preferences'),
          ListTile(
            leading: Icon(
              currentThemeMode == ThemeMode.dark
                  ? Icons.dark_mode_rounded
                  : currentThemeMode == ThemeMode.light
                  ? Icons.light_mode_rounded
                  : Icons.brightness_auto_rounded,
            ),
            title: const Text('Theme'),
            subtitle: Text(
              currentThemeMode == ThemeMode.dark
                  ? 'Dark'
                  : currentThemeMode == ThemeMode.light
                  ? 'Light'
                  : 'System',
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => _showThemeDialog(context, ref, currentThemeMode),
          ),
          const Divider(height: 1),
          _buildSectionTitle(context, 'About'),
          ListTile(
            leading: const Icon(Icons.info_rounded),
            title: const Text('About FinTrack'),
            subtitle: const Text('Version 1.0.0'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => _showAboutDialog(context),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton.icon(
              onPressed: () => _showLogoutConfirm(context, ref),
              icon: const Icon(Icons.logout_rounded),
              label: const Text('Logout'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.expenseRed,
                side: const BorderSide(color: AppColors.expenseRed),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildProfileSection(
    BuildContext context,
    ThemeData theme,
    dynamic user,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Text(
              user?.name?.isNotEmpty == true
                  ? user!.name![0].toUpperCase()
                  : '?',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.name ?? 'User',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  user?.email ?? '',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _showThemeDialog(
    BuildContext context,
    WidgetRef ref,
    ThemeMode current,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SegmentedButton<ThemeMode>(
              segments: const [
                ButtonSegment(
                  value: ThemeMode.light,
                  label: Text('Light'),
                  icon: Icon(Icons.light_mode_rounded),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  label: Text('Dark'),
                  icon: Icon(Icons.dark_mode_rounded),
                ),
                ButtonSegment(
                  value: ThemeMode.system,
                  label: Text('System'),
                  icon: Icon(Icons.brightness_auto_rounded),
                ),
              ],
              selected: {current},
              onSelectionChanged: (selection) {
                ref.read(themeProvider.notifier).setTheme(selection.first);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirm(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.logout_rounded, color: AppColors.expenseRed),
        title: const Text('Logout'),
        content: const Text(
          'Are you sure you want to logout? You will need to sign in again.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(authProvider.notifier).logout();
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.expenseRed,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'FinTrack',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(
        Icons.account_balance_rounded,
        size: 48,
        color: AppColors.primarySeed,
      ),
      children: [
        const Text('Personal finance tracking app.'),
        const SizedBox(height: 8),
        const Text(
          'Track expenses, manage budgets, and get AI-powered insights.',
        ),
      ],
    );
  }
}
