// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'wallet_model.dart';
import 'category_model.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

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
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required int id,
    required String type,
    @JsonKey(fromJson: _stringToDouble) required double amount,
    @JsonKey(readValue: _readNested) @Default('') String currencyCode,
    String? description,
    @JsonKey(name: 'merchant_name') String? merchantName,
    @JsonKey(name: 'transaction_date') required DateTime transactionDate,
    WalletModel? wallet,
    CategoryModel? category,
    @JsonKey(name: 'ai_categorized') @Default(false) bool aiCategorized,
    @JsonKey(name: 'ai_confidence') double? aiConfidence,
    String? notes,
    String? attachmentUrl,
    @JsonKey(name: 'is_recurring') @Default(false) bool isRecurring,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
