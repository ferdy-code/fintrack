import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_model.freezed.dart';
part 'budget_model.g.dart';

@freezed
class BudgetModel with _$BudgetModel {
  const factory BudgetModel({
    required String id,
    required String name,
    required double amount,
    required double spent,
    required String categoryId,
    required String period,
    DateTime? startDate,
    DateTime? endDate,
    double? alertThreshold,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BudgetModel;

  factory BudgetModel.fromJson(Map<String, dynamic> json) => _$BudgetModelFromJson(json);
}
