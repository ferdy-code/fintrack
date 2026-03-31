# AGENTS.md - FinTrack Project Guide

## Build, Lint, and Test Commands

```bash
flutter pub get                              # Install dependencies
flutter analyze                              # Static analysis (lint + type check)
flutter test                                 # Run all tests
flutter test test/widget_test.dart           # Run a single test file
flutter test test/path/to_test.dart --name "test name"  # Run a single test by name
flutter pub run build_runner build --delete-conflicting-outputs  # Regenerate freezed/json files
flutter run                                  # Run the app
```

Always run `flutter analyze` after making changes. Regenerate code with `build_runner` when modifying `@freezed` models or files with `part` directives.

## Project Overview

FinTrack is a Flutter personal finance tracking app using:
- **State management**: flutter_riverpod (StateNotifierProvider, FutureProvider, Provider)
- **Routing**: go_router with ShellRoute for bottom nav, auth-based redirect
- **Networking**: Dio with interceptors (auth token injection, 401 handling)
- **Models**: freezed + json_serializable (code-generated `.freezed.dart` and `.g.dart`)
- **Storage**: flutter_secure_storage for auth tokens/user JSON, Hive for local cache
- **API base URL**: configured in `lib/core/constants/app_constants.dart`

## Project Structure

```
lib/
  main.dart                    # Entry point: init Hive, ProviderScope, FinTrackApp
  app.dart                     # MaterialApp.router with theme + GoRouter
  core/
    constants/                 # app_constants.dart, app_colors.dart
    network/                   # dio_client.dart, api_endpoints.dart, api_exceptions.dart, api_response.dart
    router/app_router.dart     # GoRouter config with auth redirect + refreshListenable
    theme/                     # app_theme.dart, theme_provider.dart
    utils/extensions.dart      # String, double, DateTime, num extensions
  data/
    local/                     # secure_storage_service.dart, hive_service.dart
    models/                    # @freezed models (user_model, transaction_model, etc.)
    repositories/              # Repository classes wrapping Dio calls
  presentation/
    auth/                      # screens/ (splash, login, register) + providers/auth_provider.dart
    home/                      # screens/ + providers/ + widgets/
    transactions/              # screens/ + providers/ + widgets/
    budgets/                   # screens/ + providers/ + widgets/
    more/                      # screens/ + wallets/, categories/, recurring/, ai_chat/, ai_insights/, export/
    shared/                    # main_shell.dart (bottom nav + FAB)
```

## Code Style Guidelines

### Imports
- Package imports first (`package:flutter/`, `package:flutter_riverpod/`, etc.)
- Relative imports for intra-project files, using `../../` relative paths
- Order: dart: imports → package: imports → relative imports
- No unused imports — `flutter analyze` will catch these

### Models (data/models/)
- Use `@freezed` with `const factory` constructor pattern
- Include `part 'filename.freezed.dart'` and `part 'filename.g.dart'`
- Naming: `XxxModel` (e.g., `TransactionModel`, `BudgetModel`, `UserModel`)
- Required fields use `required`, optional use `Type?` with no default
- Defaults use `@Default(value)`
- Always include `fromJson` factory: `factory XxxModel.fromJson(Map<String, dynamic> json) => _$XxxModelFromJson(json);`

### Repositories (data/repositories/)
- Instantiate Dio via `final Dio _dio = DioClient.instance;` (not constructor injection)
- Wrap every Dio call in `try { ... } on DioException catch (e) { throw handleDioError(e); }`
- Use `ApiEndpoints` constants for all URLs
- Return typed models, not raw Maps (except auth which returns `Map<String, dynamic>` with `user` + `token`)
- Parse response data as: `response.data['data'] as Map<String, dynamic>` for single objects
- For lists: `(response.data['data'] as List).map((e) => Model.fromJson(e as Map<String, dynamic>)).toList()`

### Providers (presentation/*/providers/)
- Use `StateNotifierProvider<XxxNotifier, XxxState>` for complex state
- Use `FutureProvider<T>` for simple async data loading
- Use `Provider` for dependency injection (e.g., repositories)
- State classes: immutable with `copyWith`, named `XxxState` with status enum
- Status enums: named `XxxStatus` (e.g., `AuthStatus { initial, loading, authenticated, unauthenticated, error }`)
- Provider naming: `xxxProvider` (camelCase), file-level top-level `final`

### Screens (presentation/*/screens/)
- Use `ConsumerStatefulWidget` when needing `ref` + state (controllers, form keys)
- Use `ConsumerStatelessWidget` or `StatelessWidget` when only reading providers
- Private state classes prefixed with `_` (e.g., `_LoginScreenState`)
- Form pattern: `GlobalKey<FormState>`, `TextFormField` with `validator`, controllers disposed in `dispose()`
- Use `ref.listen` for side effects (navigation, SnackBar), `ref.watch` for reactive UI
- Loading state: disable buttons (`onPressed: isLoading ? null : _submit`), show `CircularProgressIndicator`
- Error handling: show via `ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)))`

### Routing (core/router/app_router.dart)
- Auth state drives redirect logic; do NOT call `context.go()` from splash — let the router redirect handle it
- Use `refreshListenable` + `ref.listen` to trigger router re-evaluation on auth changes (never `ref.watch` to create GoRouter)
- Sub-routes that should appear as full-screen (outside ShellRoute) use `parentNavigatorKey: _rootNavigatorKey`
- Tab routes inside ShellRoute use `NoTransitionPage` for instant switching
- Use `context.go()` for tab switching, `context.push()` for detail/sub screens

### Naming Conventions
- Files: `snake_case.dart` (e.g., `transaction_model.dart`, `add_transaction_screen.dart`)
- Classes: `PascalCase` (e.g., `TransactionModel`, `TransactionRepository`, `HomeScreen`)
- Private members: prefix with `_` (e.g., `_dio`, `_formKey`, `_submit()`)
- Providers: `camelCaseProvider` (e.g., `authProvider`, `dashboardProvider`, `routerProvider`)
- Constants: `camelCase` static const in classes (e.g., `AppColors.primarySeed`, `AppConstants.apiBaseUrl`)
- Extensions: `XxxExtension` (e.g., `StringExtension`, `DateTimeExtension`)

### Formatting
- Use `const` wherever possible (widgets, constructors, EdgeInsets, SizedBox)
- Prefer `const` constructors for widgets — `flutter analyze` enforces `prefer_const_constructors`
- 2-space indentation, trailing commas for multi-line parameter lists
- No comments unless explicitly requested
- Maximum line length: 80 characters (formatter default)

### Error Handling
- Network errors: always catch `DioException` and rethrow via `handleDioError(e)` from `api_exceptions.dart`
- State errors: store `errorMessage` in state class, display via SnackBar
- Never expose raw exceptions to UI — use `e.toString()` in state, display in SnackBar
- 401 responses are auto-handled by `_ErrorInterceptor` (clears storage)
