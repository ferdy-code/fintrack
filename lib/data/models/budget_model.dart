// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'category_model.dart';

part 'budget_model.freezed.dart';
part 'budget_model.g.dart';

double _stringToDouble(Object? value) {
  if (value == null) return 0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  return double.tryParse(value.toString()) ?? 0;
}

@freezed
class BudgetModel with _$BudgetModel {
  const factory BudgetModel({
    required int id,
    required CategoryModel category,
    @JsonKey(fromJson: _stringToDouble) required double amount,
    @Default('') String currencyCode,
    @Default('monthly') String period,
    @JsonKey(name: 'alert_threshold') @Default(0.8) double alertThreshold,
    @JsonKey(name: 'spent', fromJson: _stringToDouble) @Default(0) double spent,
    @JsonKey(name: 'remaining', fromJson: _stringToDouble)
    @Default(0)
    double remaining,
    @JsonKey(name: 'percentage_used', fromJson: _stringToDouble)
    @Default(0)
    double percentageUsed,
    @JsonKey(name: 'is_over_budget') @Default(false) bool isOverBudget,
    @JsonKey(name: 'period_start') String? periodStart,
    @JsonKey(name: 'period_end') String? periodEnd,
    @JsonKey(name: 'days_remaining') @Default(0) int daysRemaining,
    @JsonKey(name: 'start_date') DateTime? startDate,
  }) = _BudgetModel;

  factory BudgetModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetModelFromJson(json);
}
