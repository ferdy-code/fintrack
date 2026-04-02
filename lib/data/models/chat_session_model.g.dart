// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatSessionModelImpl _$$ChatSessionModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChatSessionModelImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$$ChatSessionModelImplToJson(
  _$ChatSessionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'created_at': instance.createdAt?.toIso8601String(),
};
