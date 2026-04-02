// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetModelImpl _$$BudgetModelImplFromJson(
  Map<String, dynamic> json,
) => _$BudgetModelImpl(
  id: (json['id'] as num).toInt(),
  category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  amount: _stringToDouble(json['amount'] as Object),
  currencyCode: json['currencyCode'] as String? ?? '',
  period: json['period'] as String? ?? 'monthly',
  alertThreshold: (json['alert_threshold'] as num?)?.toDouble() ?? 0.8,
  spent: json['spent'] == null ? 0 : _stringToDouble(json['spent'] as Object),
  remaining: json['remaining'] == null
      ? 0
      : _stringToDouble(json['remaining'] as Object),
  percentageUsed: json['percentageUsed'] == null
      ? 0
      : _stringToDouble(json['percentageUsed'] as Object),
  isOverBudget: json['is_over_budget'] as bool? ?? false,
  periodStart: json['period_start'] as String?,
  periodEnd: json['period_end'] as String?,
  daysRemaining: (json['days_remaining'] as num?)?.toInt() ?? 0,
  startDate: json['start_date'] == null
      ? null
      : DateTime.parse(json['start_date'] as String),
);

Map<String, dynamic> _$$BudgetModelImplToJson(_$BudgetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
      'period': instance.period,
      'alert_threshold': instance.alertThreshold,
      'spent': instance.spent,
      'remaining': instance.remaining,
      'percentageUsed': instance.percentageUsed,
      'is_over_budget': instance.isOverBudget,
      'period_start': instance.periodStart,
      'period_end': instance.periodEnd,
      'days_remaining': instance.daysRemaining,
      'start_date': instance.startDate?.toIso8601String(),
    };
