// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recurring_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecurringTransactionModel _$RecurringTransactionModelFromJson(
  Map<String, dynamic> json,
) {
  return _RecurringTransactionModel.fromJson(json);
}

/// @nodoc
mixin _$RecurringTransactionModel {
  int get id => throw _privateConstructorUsedError;
  WalletModel get wallet => throw _privateConstructorUsedError;
  CategoryModel? get category => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringToDouble)
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readNested)
  String get currencyCode => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'merchant_name')
  String? get merchantName => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_due_date')
  DateTime get nextDueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_processed')
  DateTime? get lastProcessed => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'auto_create')
  bool get autoCreate => throw _privateConstructorUsedError;

  /// Serializes this RecurringTransactionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecurringTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecurringTransactionModelCopyWith<RecurringTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurringTransactionModelCopyWith<$Res> {
  factory $RecurringTransactionModelCopyWith(
    RecurringTransactionModel value,
    $Res Function(RecurringTransactionModel) then,
  ) = _$RecurringTransactionModelCopyWithImpl<$Res, RecurringTransactionModel>;
  @useResult
  $Res call({
    int id,
    WalletModel wallet,
    CategoryModel? category,
    String type,
    @JsonKey(fromJson: _stringToDouble) double amount,
    @JsonKey(readValue: _readNested) String currencyCode,
    String? description,
    @JsonKey(name: 'merchant_name') String? merchantName,
    String frequency,
    @JsonKey(name: 'next_due_date') DateTime nextDueDate,
    @JsonKey(name: 'last_processed') DateTime? lastProcessed,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'auto_create') bool autoCreate,
  });

  $WalletModelCopyWith<$Res> get wallet;
  $CategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class _$RecurringTransactionModelCopyWithImpl<
  $Res,
  $Val extends RecurringTransactionModel
>
    implements $RecurringTransactionModelCopyWith<$Res> {
  _$RecurringTransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecurringTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? wallet = null,
    Object? category = freezed,
    Object? type = null,
    Object? amount = null,
    Object? currencyCode = null,
    Object? description = freezed,
    Object? merchantName = freezed,
    Object? frequency = null,
    Object? nextDueDate = null,
    Object? lastProcessed = freezed,
    Object? isActive = null,
    Object? autoCreate = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            wallet: null == wallet
                ? _value.wallet
                : wallet // ignore: cast_nullable_to_non_nullable
                      as WalletModel,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as CategoryModel?,
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
            frequency: null == frequency
                ? _value.frequency
                : frequency // ignore: cast_nullable_to_non_nullable
                      as String,
            nextDueDate: null == nextDueDate
                ? _value.nextDueDate
                : nextDueDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastProcessed: freezed == lastProcessed
                ? _value.lastProcessed
                : lastProcessed // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            autoCreate: null == autoCreate
                ? _value.autoCreate
                : autoCreate // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of RecurringTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletModelCopyWith<$Res> get wallet {
    return $WalletModelCopyWith<$Res>(_value.wallet, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }

  /// Create a copy of RecurringTransactionModel
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
abstract class _$$RecurringTransactionModelImplCopyWith<$Res>
    implements $RecurringTransactionModelCopyWith<$Res> {
  factory _$$RecurringTransactionModelImplCopyWith(
    _$RecurringTransactionModelImpl value,
    $Res Function(_$RecurringTransactionModelImpl) then,
  ) = __$$RecurringTransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    WalletModel wallet,
    CategoryModel? category,
    String type,
    @JsonKey(fromJson: _stringToDouble) double amount,
    @JsonKey(readValue: _readNested) String currencyCode,
    String? description,
    @JsonKey(name: 'merchant_name') String? merchantName,
    String frequency,
    @JsonKey(name: 'next_due_date') DateTime nextDueDate,
    @JsonKey(name: 'last_processed') DateTime? lastProcessed,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'auto_create') bool autoCreate,
  });

  @override
  $WalletModelCopyWith<$Res> get wallet;
  @override
  $CategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class __$$RecurringTransactionModelImplCopyWithImpl<$Res>
    extends
        _$RecurringTransactionModelCopyWithImpl<
          $Res,
          _$RecurringTransactionModelImpl
        >
    implements _$$RecurringTransactionModelImplCopyWith<$Res> {
  __$$RecurringTransactionModelImplCopyWithImpl(
    _$RecurringTransactionModelImpl _value,
    $Res Function(_$RecurringTransactionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecurringTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? wallet = null,
    Object? category = freezed,
    Object? type = null,
    Object? amount = null,
    Object? currencyCode = null,
    Object? description = freezed,
    Object? merchantName = freezed,
    Object? frequency = null,
    Object? nextDueDate = null,
    Object? lastProcessed = freezed,
    Object? isActive = null,
    Object? autoCreate = null,
  }) {
    return _then(
      _$RecurringTransactionModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        wallet: null == wallet
            ? _value.wallet
            : wallet // ignore: cast_nullable_to_non_nullable
                  as WalletModel,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as CategoryModel?,
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
        frequency: null == frequency
            ? _value.frequency
            : frequency // ignore: cast_nullable_to_non_nullable
                  as String,
        nextDueDate: null == nextDueDate
            ? _value.nextDueDate
            : nextDueDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastProcessed: freezed == lastProcessed
            ? _value.lastProcessed
            : lastProcessed // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        autoCreate: null == autoCreate
            ? _value.autoCreate
            : autoCreate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecurringTransactionModelImpl implements _RecurringTransactionModel {
  const _$RecurringTransactionModelImpl({
    required this.id,
    required this.wallet,
    this.category,
    required this.type,
    @JsonKey(fromJson: _stringToDouble) required this.amount,
    @JsonKey(readValue: _readNested) this.currencyCode = '',
    this.description,
    @JsonKey(name: 'merchant_name') this.merchantName,
    required this.frequency,
    @JsonKey(name: 'next_due_date') required this.nextDueDate,
    @JsonKey(name: 'last_processed') this.lastProcessed,
    @JsonKey(name: 'is_active') this.isActive = true,
    @JsonKey(name: 'auto_create') this.autoCreate = false,
  });

  factory _$RecurringTransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecurringTransactionModelImplFromJson(json);

  @override
  final int id;
  @override
  final WalletModel wallet;
  @override
  final CategoryModel? category;
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
  final String frequency;
  @override
  @JsonKey(name: 'next_due_date')
  final DateTime nextDueDate;
  @override
  @JsonKey(name: 'last_processed')
  final DateTime? lastProcessed;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'auto_create')
  final bool autoCreate;

  @override
  String toString() {
    return 'RecurringTransactionModel(id: $id, wallet: $wallet, category: $category, type: $type, amount: $amount, currencyCode: $currencyCode, description: $description, merchantName: $merchantName, frequency: $frequency, nextDueDate: $nextDueDate, lastProcessed: $lastProcessed, isActive: $isActive, autoCreate: $autoCreate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringTransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.nextDueDate, nextDueDate) ||
                other.nextDueDate == nextDueDate) &&
            (identical(other.lastProcessed, lastProcessed) ||
                other.lastProcessed == lastProcessed) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.autoCreate, autoCreate) ||
                other.autoCreate == autoCreate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    wallet,
    category,
    type,
    amount,
    currencyCode,
    description,
    merchantName,
    frequency,
    nextDueDate,
    lastProcessed,
    isActive,
    autoCreate,
  );

  /// Create a copy of RecurringTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurringTransactionModelImplCopyWith<_$RecurringTransactionModelImpl>
  get copyWith =>
      __$$RecurringTransactionModelImplCopyWithImpl<
        _$RecurringTransactionModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecurringTransactionModelImplToJson(this);
  }
}

abstract class _RecurringTransactionModel implements RecurringTransactionModel {
  const factory _RecurringTransactionModel({
    required final int id,
    required final WalletModel wallet,
    final CategoryModel? category,
    required final String type,
    @JsonKey(fromJson: _stringToDouble) required final double amount,
    @JsonKey(readValue: _readNested) final String currencyCode,
    final String? description,
    @JsonKey(name: 'merchant_name') final String? merchantName,
    required final String frequency,
    @JsonKey(name: 'next_due_date') required final DateTime nextDueDate,
    @JsonKey(name: 'last_processed') final DateTime? lastProcessed,
    @JsonKey(name: 'is_active') final bool isActive,
    @JsonKey(name: 'auto_create') final bool autoCreate,
  }) = _$RecurringTransactionModelImpl;

  factory _RecurringTransactionModel.fromJson(Map<String, dynamic> json) =
      _$RecurringTransactionModelImpl.fromJson;

  @override
  int get id;
  @override
  WalletModel get wallet;
  @override
  CategoryModel? get category;
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
  String get frequency;
  @override
  @JsonKey(name: 'next_due_date')
  DateTime get nextDueDate;
  @override
  @JsonKey(name: 'last_processed')
  DateTime? get lastProcessed;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'auto_create')
  bool get autoCreate;

  /// Create a copy of RecurringTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecurringTransactionModelImplCopyWith<_$RecurringTransactionModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
