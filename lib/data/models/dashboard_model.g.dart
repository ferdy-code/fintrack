// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardModelImpl _$$DashboardModelImplFromJson(Map<String, dynamic> json) =>
    _$DashboardModelImpl(
      totalBalance: _stringToDouble(json['total_balance']),
      defaultCurrency: json['default_currency'] as String? ?? 'IDR',
      monthSummary: MonthSummary.fromJson(
        json['month_summary'] as Map<String, dynamic>,
      ),
      categoryBreakdown:
          (json['category_breakdown'] as List<dynamic>?)
              ?.map(
                (e) => CategoryBreakdown.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      budgetAlerts:
          (json['budget_alerts'] as List<dynamic>?)
              ?.map((e) => BudgetModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recentTransactions:
          (json['recent_transactions'] as List<dynamic>?)
              ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      monthlyTrend:
          (json['monthly_trend'] as List<dynamic>?)
              ?.map((e) => MonthlyTrend.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      walletBalances:
          (json['wallet_balances'] as List<dynamic>?)
              ?.map((e) => WalletModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DashboardModelImplToJson(
  _$DashboardModelImpl instance,
) => <String, dynamic>{
  'total_balance': instance.totalBalance,
  'default_currency': instance.defaultCurrency,
  'month_summary': instance.monthSummary,
  'category_breakdown': instance.categoryBreakdown,
  'budget_alerts': instance.budgetAlerts,
  'recent_transactions': instance.recentTransactions,
  'monthly_trend': instance.monthlyTrend,
  'wallet_balances': instance.walletBalances,
};

_$MonthSummaryImpl _$$MonthSummaryImplFromJson(Map<String, dynamic> json) =>
    _$MonthSummaryImpl(
      income: _stringToDouble(json['income']),
      expense: _stringToDouble(json['expense']),
      savingsRate: json['savings_rate'] == null
          ? 0
          : _stringToDouble(json['savings_rate']),
    );

Map<String, dynamic> _$$MonthSummaryImplToJson(_$MonthSummaryImpl instance) =>
    <String, dynamic>{
      'income': instance.income,
      'expense': instance.expense,
      'savings_rate': instance.savingsRate,
    };

_$CategoryBreakdownImpl _$$CategoryBreakdownImplFromJson(
  Map<String, dynamic> json,
) => _$CategoryBreakdownImpl(
  name: json['name'] as String? ?? '',
  icon: json['icon'] as String? ?? 'category',
  color: json['color'] as String? ?? '',
  amount: _stringToDouble(json['amount']),
  percentage: json['percentage'] == null
      ? 0
      : _stringToDouble(json['percentage']),
);

Map<String, dynamic> _$$CategoryBreakdownImplToJson(
  _$CategoryBreakdownImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'icon': instance.icon,
  'color': instance.color,
  'amount': instance.amount,
  'percentage': instance.percentage,
};

_$MonthlyTrendImpl _$$MonthlyTrendImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyTrendImpl(
      month: json['month'] as String? ?? '',
      income: _stringToDouble(json['income']),
      expense: _stringToDouble(json['expense']),
    );

Map<String, dynamic> _$$MonthlyTrendImplToJson(_$MonthlyTrendImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'income': instance.income,
      'expense': instance.expense,
    };
