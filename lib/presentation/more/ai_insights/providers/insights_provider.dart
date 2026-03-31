import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/ai_insight_model.dart';
import '../../../../data/repositories/ai_repository.dart';

final aiRepositoryProvider = Provider((ref) => AiRepository());

final insightsProvider = FutureProvider<List<AiInsightModel>>((ref) async {
  final repo = ref.watch(aiRepositoryProvider);
  return repo.getInsights();
});
