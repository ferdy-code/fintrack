// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecurringTransactionModelImpl _$$RecurringTransactionModelImplFromJson(
  Map<String, dynamic> json,
) => _$RecurringTransactionModelImpl(
  id: json['id'] as String,
  type: json['type'] as String,
  amount: (json['amount'] as num).toDouble(),
  categoryId: json['categoryId'] as String,
  walletId: json['walletId'] as String,
  frequency: json['frequency'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  description: json['description'] as String?,
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  isActive: json['isActive'] as bool?,
  lastExecuted: json['lastExecuted'] == null
      ? null
      : DateTime.parse(json['lastExecuted'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$RecurringTransactionModelImplToJson(
  _$RecurringTransactionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'amount': instance.amount,
  'categoryId': instance.categoryId,
  'walletId': instance.walletId,
  'frequency': instance.frequency,
  'startDate': instance.startDate.toIso8601String(),
  'description': instance.description,
  'endDate': instance.endDate?.toIso8601String(),
  'isActive': instance.isActive,
  'lastExecuted': instance.lastExecuted?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
