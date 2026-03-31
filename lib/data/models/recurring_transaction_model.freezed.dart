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
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get walletId => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  DateTime? get lastExecuted => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

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
    String id,
    String type,
    double amount,
    String categoryId,
    String walletId,
    String frequency,
    DateTime startDate,
    String? description,
    DateTime? endDate,
    bool? isActive,
    DateTime? lastExecuted,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
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
    Object? type = null,
    Object? amount = null,
    Object? categoryId = null,
    Object? walletId = null,
    Object? frequency = null,
    Object? startDate = null,
    Object? description = freezed,
    Object? endDate = freezed,
    Object? isActive = freezed,
    Object? lastExecuted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            categoryId: null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String,
            walletId: null == walletId
                ? _value.walletId
                : walletId // ignore: cast_nullable_to_non_nullable
                      as String,
            frequency: null == frequency
                ? _value.frequency
                : frequency // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isActive: freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool?,
            lastExecuted: freezed == lastExecuted
                ? _value.lastExecuted
                : lastExecuted // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
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
    String id,
    String type,
    double amount,
    String categoryId,
    String walletId,
    String frequency,
    DateTime startDate,
    String? description,
    DateTime? endDate,
    bool? isActive,
    DateTime? lastExecuted,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
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
    Object? type = null,
    Object? amount = null,
    Object? categoryId = null,
    Object? walletId = null,
    Object? frequency = null,
    Object? startDate = null,
    Object? description = freezed,
    Object? endDate = freezed,
    Object? isActive = freezed,
    Object? lastExecuted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$RecurringTransactionModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        walletId: null == walletId
            ? _value.walletId
            : walletId // ignore: cast_nullable_to_non_nullable
                  as String,
        frequency: null == frequency
            ? _value.frequency
            : frequency // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isActive: freezed == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool?,
        lastExecuted: freezed == lastExecuted
            ? _value.lastExecuted
            : lastExecuted // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecurringTransactionModelImpl implements _RecurringTransactionModel {
  const _$RecurringTransactionModelImpl({
    required this.id,
    required this.type,
    required this.amount,
    required this.categoryId,
    required this.walletId,
    required this.frequency,
    required this.startDate,
    this.description,
    this.endDate,
    this.isActive,
    this.lastExecuted,
    this.createdAt,
    this.updatedAt,
  });

  factory _$RecurringTransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecurringTransactionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final double amount;
  @override
  final String categoryId;
  @override
  final String walletId;
  @override
  final String frequency;
  @override
  final DateTime startDate;
  @override
  final String? description;
  @override
  final DateTime? endDate;
  @override
  final bool? isActive;
  @override
  final DateTime? lastExecuted;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'RecurringTransactionModel(id: $id, type: $type, amount: $amount, categoryId: $categoryId, walletId: $walletId, frequency: $frequency, startDate: $startDate, description: $description, endDate: $endDate, isActive: $isActive, lastExecuted: $lastExecuted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringTransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastExecuted, lastExecuted) ||
                other.lastExecuted == lastExecuted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    amount,
    categoryId,
    walletId,
    frequency,
    startDate,
    description,
    endDate,
    isActive,
    lastExecuted,
    createdAt,
    updatedAt,
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
    required final String id,
    required final String type,
    required final double amount,
    required final String categoryId,
    required final String walletId,
    required final String frequency,
    required final DateTime startDate,
    final String? description,
    final DateTime? endDate,
    final bool? isActive,
    final DateTime? lastExecuted,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$RecurringTransactionModelImpl;

  factory _RecurringTransactionModel.fromJson(Map<String, dynamic> json) =
      _$RecurringTransactionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  double get amount;
  @override
  String get categoryId;
  @override
  String get walletId;
  @override
  String get frequency;
  @override
  DateTime get startDate;
  @override
  String? get description;
  @override
  DateTime? get endDate;
  @override
  bool? get isActive;
  @override
  DateTime? get lastExecuted;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of RecurringTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecurringTransactionModelImplCopyWith<_$RecurringTransactionModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
