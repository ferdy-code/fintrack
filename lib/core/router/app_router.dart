import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/auth/providers/auth_provider.dart';
import '../../presentation/shared/main_shell.dart';
import '../../presentation/auth/screens/splash_screen.dart';
import '../../presentation/auth/screens/login_screen.dart';
import '../../presentation/auth/screens/register_screen.dart';
import '../../presentation/home/screens/home_screen.dart';
import '../../presentation/transactions/screens/transactions_screen.dart';
import '../../presentation/transactions/screens/transaction_detail_screen.dart';
import '../../presentation/transactions/screens/add_transaction_screen.dart';
import '../../presentation/budgets/screens/budgets_screen.dart';
import '../../presentation/budgets/screens/budget_detail_screen.dart';
import '../../presentation/budgets/screens/add_budget_screen.dart';
import '../../presentation/more/screens/more_screen.dart';
import '../../presentation/more/wallets/screens/wallets_screen.dart';
import '../../presentation/more/wallets/screens/add_wallet_screen.dart';
import '../../presentation/more/categories/screens/categories_screen.dart';
import '../../presentation/more/recurring/screens/recurring_screen.dart';
import '../../presentation/more/recurring/screens/add_recurring_screen.dart';
import '../../presentation/more/ai_insights/screens/insights_screen.dart';
import '../../presentation/more/ai_chat/screens/chat_screen.dart';
import '../../presentation/more/export/screens/export_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _authRefreshNotifier = ValueNotifier<Object?>(null);

final routerProvider = Provider<GoRouter>((ref) {
  ref.listen<AuthState>(authProvider, (_, __) {
    _authRefreshNotifier.value = Object();
  });

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    refreshListenable: _authRefreshNotifier,
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final isAuthRoute =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/register' ||
          state.matchedLocation == '/splash';

      if (state.matchedLocation == '/splash') {
        if (authState.status == AuthStatus.authenticated) return '/home';
        if (authState.status == AuthStatus.unauthenticated) return '/login';
        return null;
      }

      if (authState.status == AuthStatus.authenticated && isAuthRoute) {
        return '/home';
      }

      if (authState.status != AuthStatus.authenticated && !isAuthRoute) {
        return '/login';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: '/transactions',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TransactionsScreen()),
            routes: [
              GoRoute(
                path: 'add',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const AddTransactionScreen(),
              ),
              GoRoute(
                path: ':id',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    TransactionDetailScreen(id: state.pathParameters['id']!),
              ),
            ],
          ),
          GoRoute(
            path: '/budgets',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: BudgetsScreen()),
            routes: [
              GoRoute(
                path: 'add',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const AddBudgetScreen(),
              ),
              GoRoute(
                path: ':id',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    BudgetDetailScreen(id: state.pathParameters['id']!),
              ),
            ],
          ),
          GoRoute(
            path: '/more',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MoreScreen()),
            routes: [
              GoRoute(
                path: 'wallets',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const WalletsScreen(),
              ),
              GoRoute(
                path: 'wallets/add',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const AddWalletScreen(),
              ),
              GoRoute(
                path: 'categories',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const CategoriesScreen(),
              ),
              GoRoute(
                path: 'recurring',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const RecurringScreen(),
              ),
              GoRoute(
                path: 'recurring/add',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const AddRecurringScreen(),
              ),
              GoRoute(
                path: 'insights',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const InsightsScreen(),
              ),
              GoRoute(
                path: 'chat',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const ChatScreen(),
              ),
              GoRoute(
                path: 'export',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const ExportScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
