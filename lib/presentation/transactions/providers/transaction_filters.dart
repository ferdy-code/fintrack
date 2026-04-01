import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_filters.freezed.dart';
part 'transaction_filters.g.dart';

@freezed
class TransactionFilters with _$TransactionFilters {
  const factory TransactionFilters({
    String? walletId,
    String? categoryId,
    String? type,
    DateTime? startDate,
    DateTime? endDate,
    String? search,
  }) = _TransactionFilters;

  factory TransactionFilters.fromJson(Map<String, dynamic> json) =>
      _$TransactionFiltersFromJson(json);
}
