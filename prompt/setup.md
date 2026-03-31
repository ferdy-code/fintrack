1. Add these dependencies to pubspec.yaml:
   dependencies:
   flutter_riverpod: ^2.5.1
   riverpod_annotation: ^2.3.5
   go_router: ^14.2.0
   dio: ^5.4.0
   flutter_secure_storage: ^9.2.2
   hive: ^2.2.3
   hive_flutter: ^1.1.0
   fl_chart: ^0.68.0
   google_fonts: ^6.2.1
   intl: ^0.19.0
   freezed_annotation: ^2.4.1
   json_annotation: ^4.9.0
   shimmer: ^3.0.0
   gap: ^3.0.1
   flutter_svg: ^2.0.10+1
   path_provider: ^2.1.3
   share_plus: ^9.0.0
   open_file: ^3.5.3
   cached_network_image: ^3.3.1
   dev_dependencies:
   flutter_test: sdk: flutter
   flutter_lints: ^4.0.0
   build_runner: ^2.4.9
   riverpod_generator: ^2.4.0
   freezed: ^2.5.2
   json_serializable: ^6.7.1

2. Create the complete folder structure as defined in Section 9 of the PRD.

   ```
   lib/
   ├── main.dart
   ├── app.dart                          # MaterialApp with theme + router
   │
   ├── core/
   │   ├── constants/
   │   │   ├── app_constants.dart        # API base URL, timeouts, etc.
   │   │   ├── app_colors.dart           # Color palette
   │   │   └── app_typography.dart       # Text styles
   │   ├── theme/
   │   │   ├── app_theme.dart            # Light & dark ThemeData
   │   │   └── theme_provider.dart       # Riverpod theme notifier
   │   ├── network/
   │   │   ├── dio_client.dart           # Dio instance + interceptors
   │   │   ├── api_endpoints.dart        # Endpoint constants
   │   │   ├── api_response.dart         # Generic response wrapper
   │   │   └── api_exceptions.dart       # Custom exception classes
   │   ├── router/
   │   │   └── app_router.dart           # go_router configuration
   │   ├── utils/
   │   │   ├── currency_formatter.dart   # Format amounts with currency
   │   │   ├── date_formatter.dart       # Date display helpers
   │   │   ├── validators.dart           # Form validation
   │   │   └── extensions.dart           # Dart extensions
   │   └── widgets/
   │       ├── app_loading.dart
   │       ├── app_error.dart
   │       ├── empty_state.dart
   │       └── confirm_dialog.dart
   │
   ├── data/
   │   ├── models/
   │   │   ├── user_model.dart
   │   │   ├── wallet_model.dart
   │   │   ├── category_model.dart
   │   │   ├── transaction_model.dart
   │   │   ├── budget_model.dart
   │   │   ├── recurring_transaction_model.dart
   │   │   ├── currency_model.dart
   │   │   ├── chat_session_model.dart
   │   │   ├── chat_message_model.dart
   │   │   ├── ai_insight_model.dart
   │   │   └── dashboard_model.dart
   │   ├── repositories/
   │   │   ├── auth_repository.dart
   │   │   ├── wallet_repository.dart
   │   │   ├── category_repository.dart
   │   │   ├── transaction_repository.dart
   │   │   ├── budget_repository.dart
   │   │   ├── recurring_repository.dart
   │   │   ├── ai_repository.dart
   │   │   ├── export_repository.dart
   │   │   └── currency_repository.dart
   │   └── local/
   │       ├── hive_service.dart         # Hive init + box management
   │       ├── secure_storage_service.dart
   │       └── cache_keys.dart
   │
   ├── presentation/
   │   ├── auth/
   │   │   ├── providers/
   │   │   │   └── auth_provider.dart
   │   │   └── screens/
   │   │       ├── splash_screen.dart
   │   │       ├── login_screen.dart
   │   │       └── register_screen.dart
   │   ├── home/
   │   │   ├── providers/
   │   │   │   └── dashboard_provider.dart
   │   │   ├── screens/
   │   │   │   └── home_screen.dart
   │   │   └── widgets/
   │   │       ├── balance_card.dart
   │   │       ├── income_expense_summary.dart
   │   │       ├── spending_pie_chart.dart
   │   │       ├── monthly_trend_chart.dart
   │   │       ├── budget_alerts_section.dart
   │   │       └── recent_transactions.dart
   │   ├── transactions/
   │   │   ├── providers/
   │   │   │   └── transaction_provider.dart
   │   │   ├── screens/
   │   │   │   ├── transactions_screen.dart
   │   │   │   ├── transaction_detail_screen.dart
   │   │   │   └── add_transaction_screen.dart
   │   │   └── widgets/
   │   │       ├── transaction_list_item.dart
   │   │       ├── transaction_filter_bar.dart
   │   │       └── category_selector.dart
   │   ├── budgets/
   │   │   ├── providers/
   │   │   │   └── budget_provider.dart
   │   │   ├── screens/
   │   │   │   ├── budgets_screen.dart
   │   │   │   ├── budget_detail_screen.dart
   │   │   │   └── add_budget_screen.dart
   │   │   └── widgets/
   │   │       └── budget_progress_card.dart
   │   ├── more/
   │   │   ├── screens/
   │   │   │   └── more_screen.dart
   │   │   ├── wallets/
   │   │   │   ├── providers/
   │   │   │   │   └── wallet_provider.dart
   │   │   │   ├── screens/
   │   │   │   │   ├── wallets_screen.dart
   │   │   │   │   └── add_wallet_screen.dart
   │   │   │   └── widgets/
   │   │   │       └── wallet_card.dart
   │   │   ├── categories/
   │   │   │   ├── providers/
   │   │   │   │   └── category_provider.dart
   │   │   │   └── screens/
   │   │   │       └── categories_screen.dart
   │   │   ├── recurring/
   │   │   │   ├── providers/
   │   │   │   │   └── recurring_provider.dart
   │   │   │   └── screens/
   │   │   │       ├── recurring_screen.dart
   │   │   │       └── add_recurring_screen.dart
   │   │   ├── ai_insights/
   │   │   │   ├── providers/
   │   │   │   │   └── insights_provider.dart
   │   │   │   └── screens/
   │   │   │       └── insights_screen.dart
   │   │   ├── ai_chat/
   │   │   │   ├── providers/
   │   │   │   │   └── chat_provider.dart
   │   │   │   └── screens/
   │   │   │       └── chat_screen.dart
   │   │   └── export/
   │   │       ├── providers/
   │   │       │   └── export_provider.dart
   │   │       └── screens/
   │   │           └── export_screen.dart
   │   └── shared/
   │       └── main_shell.dart           # Scaffold with BottomNav + FAB
   │
   └── providers/
      └── providers.dart                # Global provider overrides
   ```

   Create all folders and placeholder files with TODO comments.

3. Implement core/constants/app_constants.dart:
   - static const String apiBaseUrl = 'http://10.0.2.2:8000/api/v1'; // Android emulator
   - static const Duration connectTimeout = Duration(seconds: 30);
   - static const Duration receiveTimeout = Duration(seconds: 30);
   - static const int paginationLimit = 20;

4. Implement core/constants/app_colors.dart:
   - primarySeed = Color(0xFF0D9488)
   - incomeGreen = Color(0xFF22C55E)
   - expenseRed = Color(0xFFEF4444)
   - warningAmber = Color(0xFFF59E0B)
   - budgetBlue = Color(0xFF3B82F6)
   - categoryColors list (12 colors as defined in PRD Section 8.1)

5. Implement core/constants/app_typography.dart:
   - Using GoogleFonts.inter for UI text
   - Using GoogleFonts.jetBrainsMono for money amounts
   - Define all TextStyle constants matching PRD Section 8.2

6. Implement core/theme/app_theme.dart:
   - lightTheme: ThemeData using ColorScheme.fromSeed(seedColor: AppColors.primarySeed, brightness: Brightness.light)
   - darkTheme: ThemeData using ColorScheme.fromSeed(seedColor: AppColors.primarySeed, brightness: Brightness.dark)
   - Customize: AppBarTheme (centered title, elevation 0), CardTheme (rounded 16), InputDecorationTheme (OutlineInputBorder rounded 12), ElevatedButtonTheme (rounded 12, min height 48)

7. Implement core/theme/theme_provider.dart:
   - ThemeNotifier extends StateNotifier<ThemeMode>
   - Reads/writes to Hive box 'settings' key 'theme_mode'
   - Methods: setTheme(ThemeMode), toggleTheme()

8. Implement data/local/hive_service.dart:
   - initHive() — call in main.dart
   - Open boxes: 'settings', 'cache'
   - Methods: getValue, setValue, clearAll

9. Implement data/local/secure_storage_service.dart:
   - saveToken(String token)
   - getToken() → String?
   - deleteToken()
   - saveUser(String userJson)
   - getUser() → String?
   - deleteAll()

10. Implement core/network/dio_client.dart:
    - Create Dio instance with baseUrl, timeouts
    - AuthInterceptor: onRequest → attach Bearer token from SecureStorage
    - ErrorInterceptor: onError → handle 401 (clear token, redirect to login), format error messages
    - LogInterceptor for debug mode

11. Implement main.dart:
    - WidgetsFlutterBinding.ensureInitialized()
    - await HiveService.initHive()
    - runApp(ProviderScope(child: FinTrackApp()))

12. Implement app.dart (FinTrackApp):
    - ConsumerWidget that reads themeProvider
    - MaterialApp.router with goRouter, light/dark theme, title "FinTrack"

13. Implement core/router/app_router.dart:
    - GoRouter with redirect logic: if no token → /login, if token → /home
    - Routes: /splash, /login, /register, /home (ShellRoute with BottomNav tabs)
    - ShellRoute children: /home, /transactions, /budgets, /more
    - Sub-routes: /transactions/add, /transactions/:id, /budgets/add, /budgets/:id, etc.

14. Implement presentation/shared/main_shell.dart:
    - Scaffold with BottomNavigationBar (4 tabs: Home, Transactions, Budgets, More)
    - FloatingActionButton (centered, docked) for Add Transaction
    - Icons: home_rounded, receipt_long_rounded, account_balance_wallet_rounded, more_horiz_rounded

15. Create placeholder screens for all routes that just show the screen name centered.
