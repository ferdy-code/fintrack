import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_insight_model.freezed.dart';
part 'ai_insight_model.g.dart';

@freezed
class AiInsightModel with _$AiInsightModel {
  const factory AiInsightModel({
    required String id,
    required String type,
    required String title,
    required String content,
    String? severity,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
  }) = _AiInsightModel;

  factory AiInsightModel.fromJson(Map<String, dynamic> json) => _$AiInsightModelFromJson(json);
}
