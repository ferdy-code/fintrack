// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
  Map<String, dynamic> json,
) => _$TransactionModelImpl(
  id: json['id'] as String,
  type: json['type'] as String,
  amount: (json['amount'] as num).toDouble(),
  categoryId: json['categoryId'] as String,
  walletId: json['walletId'] as String,
  description: json['description'] as String?,
  note: json['note'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  recurringId: json['recurringId'] as String?,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  attachment: json['attachment'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$TransactionModelImplToJson(
  _$TransactionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'amount': instance.amount,
  'categoryId': instance.categoryId,
  'walletId': instance.walletId,
  'description': instance.description,
  'note': instance.note,
  'date': instance.date?.toIso8601String(),
  'recurringId': instance.recurringId,
  'tags': instance.tags,
  'attachment': instance.attachment,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
