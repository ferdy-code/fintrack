// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecurringTransactionModelImpl _$$RecurringTransactionModelImplFromJson(
  Map<String, dynamic> json,
) => _$RecurringTransactionModelImpl(
  id: (json['id'] as num).toInt(),
  wallet: WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
  category: json['category'] == null
      ? null
      : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  type: json['type'] as String,
  amount: _stringToDouble(json['amount'] as Object),
  currencyCode: _readNested(json, 'currencyCode') as String? ?? '',
  description: json['description'] as String?,
  merchantName: json['merchant_name'] as String?,
  frequency: json['frequency'] as String,
  nextDueDate: DateTime.parse(json['next_due_date'] as String),
  lastProcessed: json['last_processed'] == null
      ? null
      : DateTime.parse(json['last_processed'] as String),
  isActive: json['is_active'] as bool? ?? true,
  autoCreate: json['auto_create'] as bool? ?? false,
);

Map<String, dynamic> _$$RecurringTransactionModelImplToJson(
  _$RecurringTransactionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'wallet': instance.wallet,
  'category': instance.category,
  'type': instance.type,
  'amount': instance.amount,
  'currencyCode': instance.currencyCode,
  'description': instance.description,
  'merchant_name': instance.merchantName,
  'frequency': instance.frequency,
  'next_due_date': instance.nextDueDate.toIso8601String(),
  'last_processed': instance.lastProcessed?.toIso8601String(),
  'is_active': instance.isActive,
  'auto_create': instance.autoCreate,
};
