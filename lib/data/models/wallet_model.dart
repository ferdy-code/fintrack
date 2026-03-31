// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

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
class WalletModel with _$WalletModel {
  const factory WalletModel({
    required int id,
    required String name,
    required String type,
    @JsonKey(readValue: _readNested) required String currencyCode,
    @JsonKey(readValue: _readNested) required String currencySymbol,
    @JsonKey(fromJson: _stringToDouble) required double balance,
    String? icon,
    String? color,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
}
