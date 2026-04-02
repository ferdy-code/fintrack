// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'wallet_model.dart';
import 'transaction_model.dart';
import 'budget_model.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

double _stringToDouble(Object value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  return double.parse(value.toString());
}

@freezed
class DashboardModel with _$DashboardModel {
  const factory DashboardModel({
    @JsonKey(name: 'total_balance', fromJson: _stringToDouble)
    required double totalBalance,
    @JsonKey(name: 'default_currency') @Default('IDR') String defaultCurrency,
    @JsonKey(name: 'month_summary') required MonthSummary monthSummary,
    @JsonKey(name: 'category_breakdown')
    required List<CategoryBreakdown> categoryBreakdown,
    @JsonKey(name: 'budget_alerts') required List<BudgetModel> budgetAlerts,
    @JsonKey(name: 'recent_transactions')
    required List<TransactionModel> recentTransactions,
    @JsonKey(name: 'monthly_trend') required List<MonthlyTrend> monthlyTrend,
    @JsonKey(name: 'wallet_balances') required List<WalletModel> walletBalances,
  }) = _DashboardModel;

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);
}

@freezed
class MonthSummary with _$MonthSummary {
  const factory MonthSummary({
    @JsonKey(fromJson: _stringToDouble) required double income,
    @JsonKey(fromJson: _stringToDouble) required double expense,
    @JsonKey(name: 'savings_rate', fromJson: _stringToDouble)
    @Default(0)
    double savingsRate,
  }) = _MonthSummary;

  factory MonthSummary.fromJson(Map<String, dynamic> json) =>
      _$MonthSummaryFromJson(json);
}

@freezed
class CategoryBreakdown with _$CategoryBreakdown {
  const factory CategoryBreakdown({
    required String name,
    @Default('category') String icon,
    required String color,
    @JsonKey(fromJson: _stringToDouble) required double amount,
    @JsonKey(fromJson: _stringToDouble) @Default(0) double percentage,
  }) = _CategoryBreakdown;

  factory CategoryBreakdown.fromJson(Map<String, dynamic> json) =>
      _$CategoryBreakdownFromJson(json);
}

@freezed
class MonthlyTrend with _$MonthlyTrend {
  const factory MonthlyTrend({
    required String month,
    @JsonKey(fromJson: _stringToDouble) required double income,
    @JsonKey(fromJson: _stringToDouble) required double expense,
  }) = _MonthlyTrend;

  factory MonthlyTrend.fromJson(Map<String, dynamic> json) =>
      _$MonthlyTrendFromJson(json);
}
