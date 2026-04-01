// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TransactionFilters _$TransactionFiltersFromJson(Map<String, dynamic> json) {
  return _TransactionFilters.fromJson(json);
}

/// @nodoc
mixin _$TransactionFilters {
  String? get walletId => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;

  /// Serializes this TransactionFilters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionFiltersCopyWith<TransactionFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFiltersCopyWith<$Res> {
  factory $TransactionFiltersCopyWith(
    TransactionFilters value,
    $Res Function(TransactionFilters) then,
  ) = _$TransactionFiltersCopyWithImpl<$Res, TransactionFilters>;
  @useResult
  $Res call({
    String? walletId,
    String? categoryId,
    String? type,
    DateTime? startDate,
    DateTime? endDate,
    String? search,
  });
}

/// @nodoc
class _$TransactionFiltersCopyWithImpl<$Res, $Val extends TransactionFilters>
    implements $TransactionFiltersCopyWith<$Res> {
  _$TransactionFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? categoryId = freezed,
    Object? type = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? search = freezed,
  }) {
    return _then(
      _value.copyWith(
            walletId: freezed == walletId
                ? _value.walletId
                : walletId // ignore: cast_nullable_to_non_nullable
                      as String?,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            search: freezed == search
                ? _value.search
                : search // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TransactionFiltersImplCopyWith<$Res>
    implements $TransactionFiltersCopyWith<$Res> {
  factory _$$TransactionFiltersImplCopyWith(
    _$TransactionFiltersImpl value,
    $Res Function(_$TransactionFiltersImpl) then,
  ) = __$$TransactionFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? walletId,
    String? categoryId,
    String? type,
    DateTime? startDate,
    DateTime? endDate,
    String? search,
  });
}

/// @nodoc
class __$$TransactionFiltersImplCopyWithImpl<$Res>
    extends _$TransactionFiltersCopyWithImpl<$Res, _$TransactionFiltersImpl>
    implements _$$TransactionFiltersImplCopyWith<$Res> {
  __$$TransactionFiltersImplCopyWithImpl(
    _$TransactionFiltersImpl _value,
    $Res Function(_$TransactionFiltersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransactionFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? categoryId = freezed,
    Object? type = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? search = freezed,
  }) {
    return _then(
      _$TransactionFiltersImpl(
        walletId: freezed == walletId
            ? _value.walletId
            : walletId // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        search: freezed == search
            ? _value.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionFiltersImpl implements _TransactionFilters {
  const _$TransactionFiltersImpl({
    this.walletId,
    this.categoryId,
    this.type,
    this.startDate,
    this.endDate,
    this.search,
  });

  factory _$TransactionFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionFiltersImplFromJson(json);

  @override
  final String? walletId;
  @override
  final String? categoryId;
  @override
  final String? type;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? search;

  @override
  String toString() {
    return 'TransactionFilters(walletId: $walletId, categoryId: $categoryId, type: $type, startDate: $startDate, endDate: $endDate, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionFiltersImpl &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.search, search) || other.search == search));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    walletId,
    categoryId,
    type,
    startDate,
    endDate,
    search,
  );

  /// Create a copy of TransactionFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionFiltersImplCopyWith<_$TransactionFiltersImpl> get copyWith =>
      __$$TransactionFiltersImplCopyWithImpl<_$TransactionFiltersImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionFiltersImplToJson(this);
  }
}

abstract class _TransactionFilters implements TransactionFilters {
  const factory _TransactionFilters({
    final String? walletId,
    final String? categoryId,
    final String? type,
    final DateTime? startDate,
    final DateTime? endDate,
    final String? search,
  }) = _$TransactionFiltersImpl;

  factory _TransactionFilters.fromJson(Map<String, dynamic> json) =
      _$TransactionFiltersImpl.fromJson;

  @override
  String? get walletId;
  @override
  String? get categoryId;
  @override
  String? get type;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  String? get search;

  /// Create a copy of TransactionFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionFiltersImplCopyWith<_$TransactionFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
