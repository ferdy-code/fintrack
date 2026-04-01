// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionFiltersImpl _$$TransactionFiltersImplFromJson(
  Map<String, dynamic> json,
) => _$TransactionFiltersImpl(
  walletId: json['walletId'] as String?,
  categoryId: json['categoryId'] as String?,
  type: json['type'] as String?,
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  search: json['search'] as String?,
);

Map<String, dynamic> _$$TransactionFiltersImplToJson(
  _$TransactionFiltersImpl instance,
) => <String, dynamic>{
  'walletId': instance.walletId,
  'categoryId': instance.categoryId,
  'type': instance.type,
  'startDate': instance.startDate?.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
  'search': instance.search,
};
