import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/transaction_model.dart';
import '../../../data/repositories/transaction_repository.dart';
import 'transaction_filters.dart';

final transactionRepositoryProvider = Provider(
  (ref) => TransactionRepository(),
);

class TransactionListState {
  final List<TransactionModel> transactions;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final TransactionFilters filters;
  final String? errorMessage;

  const TransactionListState({
    this.transactions = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.filters = const TransactionFilters(),
    this.errorMessage,
  });

  TransactionListState copyWith({
    List<TransactionModel>? transactions,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    TransactionFilters? filters,
    String? errorMessage,
  }) {
    return TransactionListState(
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      filters: filters ?? this.filters,
      errorMessage: errorMessage,
    );
  }
}

class TransactionListNotifier extends StateNotifier<TransactionListState> {
  final TransactionRepository _repository;
  int _currentPage = 1;

  TransactionListNotifier(this._repository)
    : super(const TransactionListState());

  Future<void> fetchTransactions({bool reset = false}) async {
    if (reset) {
      _currentPage = 1;
      state = state.copyWith(
        transactions: [],
        hasMore: true,
        isLoading: true,
        errorMessage: null,
      );
    } else {
      if (state.isLoading || state.isLoadingMore || !state.hasMore) return;
      state = state.copyWith(isLoadingMore: true);
    }

    try {
      final result = await _repository.getTransactions(
        page: _currentPage,
        walletId: state.filters.walletId,
        categoryId: state.filters.categoryId,
        type: state.filters.type,
        startDate: state.filters.startDate,
        endDate: state.filters.endDate,
        search: state.filters.search,
      );
      final List<TransactionModel> newTransactions =
          result['transactions'] as List<TransactionModel>;
      final meta = result['meta'] as Map<String, dynamic>?;
      final lastPage = meta?['last_page'] as int? ?? 1;
      final currentPage = meta?['current_page'] as int? ?? 1;

      _currentPage++;
      state = state.copyWith(
        transactions: reset
            ? newTransactions
            : [...state.transactions, ...newTransactions],
        isLoading: false,
        isLoadingMore: false,
        hasMore: currentPage < lastPage,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        errorMessage: e.toString(),
      );
    }
  }

  void applyFilters(TransactionFilters filters) {
    state = state.copyWith(filters: filters);
    fetchTransactions(reset: true);
  }

  Future<void> deleteTransaction(int id) async {
    try {
      await _repository.deleteTransaction(id);
      state = state.copyWith(
        transactions: state.transactions.where((t) => t.id != id).toList(),
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }
}

final transactionListProvider =
    StateNotifierProvider<TransactionListNotifier, TransactionListState>((ref) {
      final notifier = TransactionListNotifier(
        ref.watch(transactionRepositoryProvider),
      );
      notifier.fetchTransactions();
      return notifier;
    });
