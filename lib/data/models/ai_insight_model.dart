// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_insight_model.freezed.dart';
part 'ai_insight_model.g.dart';

@freezed
class AiInsightModel with _$AiInsightModel {
  const factory AiInsightModel({
    required String title,
    required String description,
    @JsonKey(name: 'potential_savings') double? potentialSavings,
    required String priority,
    String? category,
  }) = _AiInsightModel;

  factory AiInsightModel.fromJson(Map<String, dynamic> json) =>
      _$AiInsightModelFromJson(json);
}
