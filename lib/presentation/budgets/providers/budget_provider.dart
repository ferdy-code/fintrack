import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/budget_model.dart';
import '../../../data/repositories/budget_repository.dart';

final budgetRepositoryProvider = Provider((ref) => BudgetRepository());

class BudgetListState {
  final List<BudgetModel> budgets;
  final bool isLoading;
  final String? errorMessage;

  const BudgetListState({
    this.budgets = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  BudgetListState copyWith({
    List<BudgetModel>? budgets,
    bool? isLoading,
    String? errorMessage,
  }) {
    return BudgetListState(
      budgets: budgets ?? this.budgets,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class BudgetListNotifier extends StateNotifier<BudgetListState> {
  final BudgetRepository _repository;

  BudgetListNotifier(this._repository) : super(const BudgetListState());

  Future<void> fetchBudgets() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final budgets = await _repository.getBudgets();
      state = state.copyWith(budgets: budgets, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> deleteBudget(int id) async {
    try {
      await _repository.deleteBudget(id);
      state = state.copyWith(
        budgets: state.budgets.where((b) => b.id != id).toList(),
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      rethrow;
    }
  }
}

final budgetListProvider =
    StateNotifierProvider<BudgetListNotifier, BudgetListState>((ref) {
      final notifier = BudgetListNotifier(ref.read(budgetRepositoryProvider));
      notifier.fetchBudgets();
      return notifier;
    });
