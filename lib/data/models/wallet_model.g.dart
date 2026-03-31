// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletModelImpl _$$WalletModelImplFromJson(Map<String, dynamic> json) =>
    _$WalletModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      currencyCode: _readNested(json, 'currencyCode') as String,
      currencySymbol: _readNested(json, 'currencySymbol') as String,
      balance: _stringToDouble(json['balance'] as Object),
      icon: json['icon'] as String?,
      color: json['color'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$WalletModelImplToJson(_$WalletModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'currencyCode': instance.currencyCode,
      'currencySymbol': instance.currencySymbol,
      'balance': instance.balance,
      'icon': instance.icon,
      'color': instance.color,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
    };
