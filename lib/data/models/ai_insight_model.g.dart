// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_insight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiInsightModelImpl _$$AiInsightModelImplFromJson(Map<String, dynamic> json) =>
    _$AiInsightModelImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      potentialSavings: (json['potential_savings'] as num?)?.toDouble(),
      priority: json['priority'] as String,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$AiInsightModelImplToJson(
  _$AiInsightModelImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'potential_savings': instance.potentialSavings,
  'priority': instance.priority,
  'category': instance.category,
};
