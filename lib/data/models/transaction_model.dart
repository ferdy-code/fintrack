import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,
    required String type,
    required double amount,
    required String categoryId,
    required String walletId,
    String? description,
    String? note,
    DateTime? date,
    String? recurringId,
    List<String>? tags,
    String? attachment,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
}
