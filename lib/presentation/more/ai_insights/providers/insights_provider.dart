import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/ai_insight_model.dart';
import '../../../../data/repositories/ai_repository.dart';

final aiRepositoryProvider = Provider((ref) => AiRepository());

enum InsightsStatus { initial, loading, loaded, error }

class InsightsState {
  final InsightsStatus status;
  final List<AiInsightModel> insights;
  final int healthScore;
  final String summary;
  final String? errorMessage;

  const InsightsState({
    this.status = InsightsStatus.initial,
    this.insights = const [],
    this.healthScore = 0,
    this.summary = '',
    this.errorMessage,
  });

  InsightsState copyWith({
    InsightsStatus? status,
    List<AiInsightModel>? insights,
    int? healthScore,
    String? summary,
    String? errorMessage,
  }) {
    return InsightsState(
      status: status ?? this.status,
      insights: insights ?? this.insights,
      healthScore: healthScore ?? this.healthScore,
      summary: summary ?? this.summary,
      errorMessage: errorMessage,
    );
  }
}

class InsightsNotifier extends StateNotifier<InsightsState> {
  final AiRepository _repository;

  InsightsNotifier(this._repository) : super(const InsightsState()) {
    fetchInsights();
  }

  Future<void> fetchInsights() async {
    state = state.copyWith(status: InsightsStatus.loading);
    try {
      final result = await _repository.getInsights();
      final insightsList = (result['insights'] as List)
          .map((e) => AiInsightModel.fromJson(e as Map<String, dynamic>))
          .toList();
      final healthScore = result['health_score'] as int? ?? 0;
      final summary = result['summary'] as String? ?? '';
      state = state.copyWith(
        status: InsightsStatus.loaded,
        insights: insightsList,
        healthScore: healthScore,
        summary: summary,
      );
    } catch (e) {
      state = state.copyWith(
        status: InsightsStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}

final insightsProvider = StateNotifierProvider<InsightsNotifier, InsightsState>(
  (ref) => InsightsNotifier(ref.read(aiRepositoryProvider)),
);
