import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/transaction_model.dart';
import '../../../data/repositories/transaction_repository.dart';

final transactionRepositoryProvider = Provider((ref) => TransactionRepository());

final transactionsProvider = FutureProvider<List<TransactionModel>>((ref) async {
  final repo = ref.watch(transactionRepositoryProvider);
  return repo.getTransactions();
});
