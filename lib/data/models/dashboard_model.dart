import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

@freezed
class DashboardModel with _$DashboardModel {
  const factory DashboardModel({
    required double totalBalance,
    required double totalIncome,
    required double totalExpense,
    required List<CategorySpending> spendingByCategory,
    required List<MonthlyTrend> monthlyTrends,
    required List<BudgetAlert> budgetAlerts,
  }) = _DashboardModel;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => _$DashboardModelFromJson(json);
}

@freezed
class CategorySpending with _$CategorySpending {
  const factory CategorySpending({
    required String categoryId,
    required String categoryName,
    required double amount,
    required String color,
  }) = _CategorySpending;

  factory CategorySpending.fromJson(Map<String, dynamic> json) => _$CategorySpendingFromJson(json);
}

@freezed
class MonthlyTrend with _$MonthlyTrend {
  const factory MonthlyTrend({
    required String month,
    required double income,
    required double expense,
  }) = _MonthlyTrend;

  factory MonthlyTrend.fromJson(Map<String, dynamic> json) => _$MonthlyTrendFromJson(json);
}

@freezed
class BudgetAlert with _$BudgetAlert {
  const factory BudgetAlert({
    required String budgetId,
    required String budgetName,
    required double budgetAmount,
    required double spentAmount,
    required double percentage,
  }) = _BudgetAlert;

  factory BudgetAlert.fromJson(Map<String, dynamic> json) => _$BudgetAlertFromJson(json);
}
