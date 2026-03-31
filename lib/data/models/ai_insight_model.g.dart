// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_insight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiInsightModelImpl _$$AiInsightModelImplFromJson(Map<String, dynamic> json) =>
    _$AiInsightModelImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      severity: json['severity'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AiInsightModelImplToJson(
  _$AiInsightModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'title': instance.title,
  'content': instance.content,
  'severity': instance.severity,
  'metadata': instance.metadata,
  'createdAt': instance.createdAt?.toIso8601String(),
};
