// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'wallet_model.dart';
import 'category_model.dart';

part 'recurring_transaction_model.freezed.dart';
part 'recurring_transaction_model.g.dart';

Object? _readNested(Map<dynamic, dynamic> map, String key) {
  final currency = map['currency'];
  if (currency is Map<String, dynamic>) {
    if (key == 'currencyCode') return currency['code'];
    if (key == 'currencySymbol') return currency['symbol'];
  }
  return null;
}

double _stringToDouble(Object value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  return double.parse(value.toString());
}

@freezed
class RecurringTransactionModel with _$RecurringTransactionModel {
  const factory RecurringTransactionModel({
    required int id,
    required WalletModel wallet,
    CategoryModel? category,
    required String type,
    @JsonKey(fromJson: _stringToDouble) required double amount,
    @JsonKey(readValue: _readNested) @Default('') String currencyCode,
    String? description,
    @JsonKey(name: 'merchant_name') String? merchantName,
    required String frequency,
    @JsonKey(name: 'next_due_date') required DateTime nextDueDate,
    @JsonKey(name: 'last_processed') DateTime? lastProcessed,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'auto_create') @Default(false) bool autoCreate,
  }) = _RecurringTransactionModel;

  factory RecurringTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$RecurringTransactionModelFromJson(json);
}
