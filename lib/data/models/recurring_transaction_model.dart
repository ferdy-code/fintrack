import 'package:freezed_annotation/freezed_annotation.dart';

part 'recurring_transaction_model.freezed.dart';
part 'recurring_transaction_model.g.dart';

@freezed
class RecurringTransactionModel with _$RecurringTransactionModel {
  const factory RecurringTransactionModel({
    required String id,
    required String type,
    required double amount,
    required String categoryId,
    required String walletId,
    required String frequency,
    required DateTime startDate,
    String? description,
    DateTime? endDate,
    bool? isActive,
    DateTime? lastExecuted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RecurringTransactionModel;

  factory RecurringTransactionModel.fromJson(Map<String, dynamic> json) => _$RecurringTransactionModelFromJson(json);
}
