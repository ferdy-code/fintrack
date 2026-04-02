import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/recurring_transaction_model.dart';
import '../../../../data/repositories/recurring_repository.dart';

final recurringRepositoryProvider = Provider((ref) => RecurringRepository());

class RecurringListState {
  final List<RecurringTransactionModel> recurring;
  final bool isLoading;
  final String? errorMessage;

  const RecurringListState({
    this.recurring = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  RecurringListState copyWith({
    List<RecurringTransactionModel>? recurring,
    bool? isLoading,
    String? errorMessage,
  }) {
    return RecurringListState(
      recurring: recurring ?? this.recurring,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class RecurringListNotifier extends StateNotifier<RecurringListState> {
  final RecurringRepository _repository;

  RecurringListNotifier(this._repository) : super(const RecurringListState());

  Future<void> fetchRecurring() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final recurring = await _repository.getRecurring();
      state = state.copyWith(recurring: recurring, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> deleteRecurring(int id) async {
    try {
      await _repository.deleteRecurring(id);
      state = state.copyWith(
        recurring: state.recurring.where((r) => r.id != id).toList(),
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> skipNext(int id) async {
    try {
      await _repository.skipNext(id);
      await fetchRecurring();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> processNow(int id) async {
    try {
      await _repository.processNow(id);
      await fetchRecurring();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }
}

final recurringListProvider =
    StateNotifierProvider<RecurringListNotifier, RecurringListState>((ref) {
      final notifier = RecurringListNotifier(
        ref.read(recurringRepositoryProvider),
      );
      notifier.fetchRecurring();
      return notifier;
    });
