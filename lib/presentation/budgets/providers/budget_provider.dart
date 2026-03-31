import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/budget_model.dart';
import '../../../data/repositories/budget_repository.dart';

final budgetRepositoryProvider = Provider((ref) => BudgetRepository());

final budgetsProvider = FutureProvider<List<BudgetModel>>((ref) async {
  final repo = ref.watch(budgetRepositoryProvider);
  return repo.getBudgets();
});
