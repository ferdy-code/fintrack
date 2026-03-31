// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardModelImpl _$$DashboardModelImplFromJson(Map<String, dynamic> json) =>
    _$DashboardModelImpl(
      totalBalance: (json['totalBalance'] as num).toDouble(),
      totalIncome: (json['totalIncome'] as num).toDouble(),
      totalExpense: (json['totalExpense'] as num).toDouble(),
      spendingByCategory: (json['spendingByCategory'] as List<dynamic>)
          .map((e) => CategorySpending.fromJson(e as Map<String, dynamic>))
          .toList(),
      monthlyTrends: (json['monthlyTrends'] as List<dynamic>)
          .map((e) => MonthlyTrend.fromJson(e as Map<String, dynamic>))
          .toList(),
      budgetAlerts: (json['budgetAlerts'] as List<dynamic>)
          .map((e) => BudgetAlert.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DashboardModelImplToJson(
  _$DashboardModelImpl instance,
) => <String, dynamic>{
  'totalBalance': instance.totalBalance,
  'totalIncome': instance.totalIncome,
  'totalExpense': instance.totalExpense,
  'spendingByCategory': instance.spendingByCategory,
  'monthlyTrends': instance.monthlyTrends,
  'budgetAlerts': instance.budgetAlerts,
};

_$CategorySpendingImpl _$$CategorySpendingImplFromJson(
  Map<String, dynamic> json,
) => _$CategorySpendingImpl(
  categoryId: json['categoryId'] as String,
  categoryName: json['categoryName'] as String,
  amount: (json['amount'] as num).toDouble(),
  color: json['color'] as String,
);

Map<String, dynamic> _$$CategorySpendingImplToJson(
  _$CategorySpendingImpl instance,
) => <String, dynamic>{
  'categoryId': instance.categoryId,
  'categoryName': instance.categoryName,
  'amount': instance.amount,
  'color': instance.color,
};

_$MonthlyTrendImpl _$$MonthlyTrendImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyTrendImpl(
      month: json['month'] as String,
      income: (json['income'] as num).toDouble(),
      expense: (json['expense'] as num).toDouble(),
    );

Map<String, dynamic> _$$MonthlyTrendImplToJson(_$MonthlyTrendImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'income': instance.income,
      'expense': instance.expense,
    };

_$BudgetAlertImpl _$$BudgetAlertImplFromJson(Map<String, dynamic> json) =>
    _$BudgetAlertImpl(
      budgetId: json['budgetId'] as String,
      budgetName: json['budgetName'] as String,
      budgetAmount: (json['budgetAmount'] as num).toDouble(),
      spentAmount: (json['spentAmount'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$BudgetAlertImplToJson(_$BudgetAlertImpl instance) =>
    <String, dynamic>{
      'budgetId': instance.budgetId,
      'budgetName': instance.budgetName,
      'budgetAmount': instance.budgetAmount,
      'spentAmount': instance.spentAmount,
      'percentage': instance.percentage,
    };
