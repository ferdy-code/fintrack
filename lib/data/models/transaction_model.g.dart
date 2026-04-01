// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
  Map<String, dynamic> json,
) => _$TransactionModelImpl(
  id: (json['id'] as num).toInt(),
  type: json['type'] as String,
  amount: _stringToDouble(json['amount'] as Object),
  currencyCode: _readNested(json, 'currencyCode') as String? ?? '',
  description: json['description'] as String?,
  merchantName: json['merchant_name'] as String?,
  transactionDate: DateTime.parse(json['transaction_date'] as String),
  wallet: json['wallet'] == null
      ? null
      : WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
  category: json['category'] == null
      ? null
      : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  aiCategorized: json['ai_categorized'] as bool? ?? false,
  aiConfidence: (json['ai_confidence'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  attachmentUrl: json['attachmentUrl'] as String?,
  isRecurring: json['is_recurring'] as bool? ?? false,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$$TransactionModelImplToJson(
  _$TransactionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'amount': instance.amount,
  'currencyCode': instance.currencyCode,
  'description': instance.description,
  'merchant_name': instance.merchantName,
  'transaction_date': instance.transactionDate.toIso8601String(),
  'wallet': instance.wallet,
  'category': instance.category,
  'ai_categorized': instance.aiCategorized,
  'ai_confidence': instance.aiConfidence,
  'notes': instance.notes,
  'attachmentUrl': instance.attachmentUrl,
  'is_recurring': instance.isRecurring,
  'created_at': instance.createdAt?.toIso8601String(),
};
