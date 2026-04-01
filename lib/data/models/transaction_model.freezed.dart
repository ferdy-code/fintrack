// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringToDouble)
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readNested)
  String get currencyCode => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'merchant_name')
  String? get merchantName => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date')
  DateTime get transactionDate => throw _privateConstructorUsedError;
  WalletModel? get wallet => throw _privateConstructorUsedError;
  CategoryModel? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_categorized')
  bool get aiCategorized => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_confidence')
  double? get aiConfidence => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get attachmentUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_recurring')
  bool get isRecurring => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
    TransactionModel value,
    $Res Function(TransactionModel) then,
  ) = _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call({
    int id,
    String type,
    @JsonKey(fromJson: _stringToDouble) double amount,
    @JsonKey(readValue: _readNested) String currencyCode,
    String? description,
    @JsonKey(name: 'merchant_name') String? merchantName,
    @JsonKey(name: 'transaction_date') DateTime transactionDate,
    WalletModel? wallet,
    CategoryModel? category,
    @JsonKey(name: 'ai_categorized') bool aiCategorized,
    @JsonKey(name: 'ai_confidence') double? aiConfidence,
    String? notes,
    String? attachmentUrl,
    @JsonKey(name: 'is_recurring') bool isRecurring,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  });

  $WalletModelCopyWith<$Res>? get wallet;
  $CategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? currencyCode = null,
    Object? description = freezed,
    Object? merchantName = freezed,
    Object? transactionDate = null,
    Object? wallet = freezed,
    Object? category = freezed,
    Object? aiCategorized = null,
    Object? aiConfidence = freezed,
    Object? notes = freezed,
    Object? attachmentUrl = freezed,
    Object? isRecurring = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currencyCode: null == currencyCode
                ? _value.currencyCode
                : currencyCode // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            merchantName: freezed == merchantName
                ? _value.merchantName
                : merchantName // ignore: cast_nullable_to_non_nullable
                      as String?,
            transactionDate: null == transactionDate
                ? _value.transactionDate
                : transactionDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            wallet: freezed == wallet
                ? _value.wallet
                : wallet // ignore: cast_nullable_to_non_nullable
                      as WalletModel?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as CategoryModel?,
            aiCategorized: null == aiCategorized
                ? _value.aiCategorized
                : aiCategorized // ignore: cast_nullable_to_non_nullable
                      as bool,
            aiConfidence: freezed == aiConfidence
                ? _value.aiConfidence
                : aiConfidence // ignore: cast_nullable_to_non_nullable
                      as double?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            attachmentUrl: freezed == attachmentUrl
                ? _value.attachmentUrl
                : attachmentUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isRecurring: null == isRecurring
                ? _value.isRecurring
                : isRecurring // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletModelCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletModelCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(
    _$TransactionModelImpl value,
    $Res Function(_$TransactionModelImpl) then,
  ) = __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String type,
    @JsonKey(fromJson: _stringToDouble) double amount,
    @JsonKey(readValue: _readNested) String currencyCode,
    String? description,
    @JsonKey(name: 'merchant_name') String? merchantName,
    @JsonKey(name: 'transaction_date') DateTime transactionDate,
    WalletModel? wallet,
    CategoryModel? category,
    @JsonKey(name: 'ai_categorized') bool aiCategorized,
    @JsonKey(name: 'ai_confidence') double? aiConfidence,
    String? notes,
    String? attachmentUrl,
    @JsonKey(name: 'is_recurring') bool isRecurring,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  });

  @override
  $WalletModelCopyWith<$Res>? get wallet;
  @override
  $CategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(
    _$TransactionModelImpl _value,
    $Res Function(_$TransactionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? currencyCode = null,
    Object? description = freezed,
    Object? merchantName = freezed,
    Object? transactionDate = null,
    Object? wallet = freezed,
    Object? category = freezed,
    Object? aiCategorized = null,
    Object? aiConfidence = freezed,
    Object? notes = freezed,
    Object? attachmentUrl = freezed,
    Object? isRecurring = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$TransactionModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currencyCode: null == currencyCode
            ? _value.currencyCode
            : currencyCode // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        merchantName: freezed == merchantName
            ? _value.merchantName
            : merchantName // ignore: cast_nullable_to_non_nullable
                  as String?,
        transactionDate: null == transactionDate
            ? _value.transactionDate
            : transactionDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        wallet: freezed == wallet
            ? _value.wallet
            : wallet // ignore: cast_nullable_to_non_nullable
                  as WalletModel?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as CategoryModel?,
        aiCategorized: null == aiCategorized
            ? _value.aiCategorized
            : aiCategorized // ignore: cast_nullable_to_non_nullable
                  as bool,
        aiConfidence: freezed == aiConfidence
            ? _value.aiConfidence
            : aiConfidence // ignore: cast_nullable_to_non_nullable
                  as double?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        attachmentUrl: freezed == attachmentUrl
            ? _value.attachmentUrl
            : attachmentUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isRecurring: null == isRecurring
            ? _value.isRecurring
            : isRecurring // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionModelImpl implements _TransactionModel {
  const _$TransactionModelImpl({
    required this.id,
    required this.type,
    @JsonKey(fromJson: _stringToDouble) required this.amount,
    @JsonKey(readValue: _readNested) this.currencyCode = '',
    this.description,
    @JsonKey(name: 'merchant_name') this.merchantName,
    @JsonKey(name: 'transaction_date') required this.transactionDate,
    this.wallet,
    this.category,
    @JsonKey(name: 'ai_categorized') this.aiCategorized = false,
    @JsonKey(name: 'ai_confidence') this.aiConfidence,
    this.notes,
    this.attachmentUrl,
    @JsonKey(name: 'is_recurring') this.isRecurring = false,
    @JsonKey(name: 'created_at') this.createdAt,
  });

  factory _$TransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String type;
  @override
  @JsonKey(fromJson: _stringToDouble)
  final double amount;
  @override
  @JsonKey(readValue: _readNested)
  final String currencyCode;
  @override
  final String? description;
  @override
  @JsonKey(name: 'merchant_name')
  final String? merchantName;
  @override
  @JsonKey(name: 'transaction_date')
  final DateTime transactionDate;
  @override
  final WalletModel? wallet;
  @override
  final CategoryModel? category;
  @override
  @JsonKey(name: 'ai_categorized')
  final bool aiCategorized;
  @override
  @JsonKey(name: 'ai_confidence')
  final double? aiConfidence;
  @override
  final String? notes;
  @override
  final String? attachmentUrl;
  @override
  @JsonKey(name: 'is_recurring')
  final bool isRecurring;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'TransactionModel(id: $id, type: $type, amount: $amount, currencyCode: $currencyCode, description: $description, merchantName: $merchantName, transactionDate: $transactionDate, wallet: $wallet, category: $category, aiCategorized: $aiCategorized, aiConfidence: $aiConfidence, notes: $notes, attachmentUrl: $attachmentUrl, isRecurring: $isRecurring, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.aiCategorized, aiCategorized) ||
                other.aiCategorized == aiCategorized) &&
            (identical(other.aiConfidence, aiConfidence) ||
                other.aiConfidence == aiConfidence) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.attachmentUrl, attachmentUrl) ||
                other.attachmentUrl == attachmentUrl) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    amount,
    currencyCode,
    description,
    merchantName,
    transactionDate,
    wallet,
    category,
    aiCategorized,
    aiConfidence,
    notes,
    attachmentUrl,
    isRecurring,
    createdAt,
  );

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionModelImplToJson(this);
  }
}

abstract class _TransactionModel implements TransactionModel {
  const factory _TransactionModel({
    required final int id,
    required final String type,
    @JsonKey(fromJson: _stringToDouble) required final double amount,
    @JsonKey(readValue: _readNested) final String currencyCode,
    final String? description,
    @JsonKey(name: 'merchant_name') final String? merchantName,
    @JsonKey(name: 'transaction_date') required final DateTime transactionDate,
    final WalletModel? wallet,
    final CategoryModel? category,
    @JsonKey(name: 'ai_categorized') final bool aiCategorized,
    @JsonKey(name: 'ai_confidence') final double? aiConfidence,
    final String? notes,
    final String? attachmentUrl,
    @JsonKey(name: 'is_recurring') final bool isRecurring,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
  }) = _$TransactionModelImpl;

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$TransactionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override
  @JsonKey(fromJson: _stringToDouble)
  double get amount;
  @override
  @JsonKey(readValue: _readNested)
  String get currencyCode;
  @override
  String? get description;
  @override
  @JsonKey(name: 'merchant_name')
  String? get merchantName;
  @override
  @JsonKey(name: 'transaction_date')
  DateTime get transactionDate;
  @override
  WalletModel? get wallet;
  @override
  CategoryModel? get category;
  @override
  @JsonKey(name: 'ai_categorized')
  bool get aiCategorized;
  @override
  @JsonKey(name: 'ai_confidence')
  double? get aiConfidence;
  @override
  String? get notes;
  @override
  String? get attachmentUrl;
  @override
  @JsonKey(name: 'is_recurring')
  bool get isRecurring;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
