import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/recurring_transaction_model.dart';
import '../../../../data/repositories/recurring_repository.dart';

final recurringRepositoryProvider = Provider((ref) => RecurringRepository());

final recurringProvider = FutureProvider<List<RecurringTransactionModel>>((ref) async {
  final repo = ref.watch(recurringRepositoryProvider);
  return repo.getRecurring();
});
