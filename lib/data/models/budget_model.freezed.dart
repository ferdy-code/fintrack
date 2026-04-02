// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BudgetModel _$BudgetModelFromJson(Map<String, dynamic> json) {
  return _BudgetModel.fromJson(json);
}

/// @nodoc
mixin _$BudgetModel {
  int get id => throw _privateConstructorUsedError;
  CategoryModel get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringToDouble)
  double get amount => throw _privateConstructorUsedError;
  String get currencyCode => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'alert_threshold')
  double get alertThreshold => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringToDouble)
  double get spent => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringToDouble)
  double get remaining => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringToDouble)
  double get percentageUsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_over_budget')
  bool get isOverBudget => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_start')
  String? get periodStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_end')
  String? get periodEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_remaining')
  int get daysRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;

  /// Serializes this BudgetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetModelCopyWith<BudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetModelCopyWith<$Res> {
  factory $BudgetModelCopyWith(
    BudgetModel value,
    $Res Function(BudgetModel) then,
  ) = _$BudgetModelCopyWithImpl<$Res, BudgetModel>;
  @useResult
  $Res call({
    int id,
    CategoryModel category,
    @JsonKey(fromJson: _stringToDouble) double amount,
    String currencyCode,
    String period,
    @JsonKey(name: 'alert_threshold') double alertThreshold,
    @JsonKey(fromJson: _stringToDouble) double spent,
    @JsonKey(fromJson: _stringToDouble) double remaining,
    @JsonKey(fromJson: _stringToDouble) double percentageUsed,
    @JsonKey(name: 'is_over_budget') bool isOverBudget,
    @JsonKey(name: 'period_start') String? periodStart,
    @JsonKey(name: 'period_end') String? periodEnd,
    @JsonKey(name: 'days_remaining') int daysRemaining,
    @JsonKey(name: 'start_date') DateTime? startDate,
  });

  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class _$BudgetModelCopyWithImpl<$Res, $Val extends BudgetModel>
    implements $BudgetModelCopyWith<$Res> {
  _$BudgetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? amount = null,
    Object? currencyCode = null,
    Object? period = null,
    Object? alertThreshold = null,
    Object? spent = null,
    Object? remaining = null,
    Object? percentageUsed = null,
    Object? isOverBudget = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
    Object? daysRemaining = null,
    Object? startDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as CategoryModel,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currencyCode: null == currencyCode
                ? _value.currencyCode
                : currencyCode // ignore: cast_nullable_to_non_nullable
                      as String,
            period: null == period
                ? _value.period
                : period // ignore: cast_nullable_to_non_nullable
                      as String,
            alertThreshold: null == alertThreshold
                ? _value.alertThreshold
                : alertThreshold // ignore: cast_nullable_to_non_nullable
                      as double,
            spent: null == spent
                ? _value.spent
                : spent // ignore: cast_nullable_to_non_nullable
                      as double,
            remaining: null == remaining
                ? _value.remaining
                : remaining // ignore: cast_nullable_to_non_nullable
                      as double,
            percentageUsed: null == percentageUsed
                ? _value.percentageUsed
                : percentageUsed // ignore: cast_nullable_to_non_nullable
                      as double,
            isOverBudget: null == isOverBudget
                ? _value.isOverBudget
                : isOverBudget // ignore: cast_nullable_to_non_nullable
                      as bool,
            periodStart: freezed == periodStart
                ? _value.periodStart
                : periodStart // ignore: cast_nullable_to_non_nullable
                      as String?,
            periodEnd: freezed == periodEnd
                ? _value.periodEnd
                : periodEnd // ignore: cast_nullable_to_non_nullable
                      as String?,
            daysRemaining: null == daysRemaining
                ? _value.daysRemaining
                : daysRemaining // ignore: cast_nullable_to_non_nullable
                      as int,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res> get category {
    return $CategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BudgetModelImplCopyWith<$Res>
    implements $BudgetModelCopyWith<$Res> {
  factory _$$BudgetModelImplCopyWith(
    _$BudgetModelImpl value,
    $Res Function(_$BudgetModelImpl) then,
  ) = __$$BudgetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    CategoryModel category,
    @JsonKey(fromJson: _stringToDouble) double amount,
    String currencyCode,
    String period,
    @JsonKey(name: 'alert_threshold') double alertThreshold,
    @JsonKey(fromJson: _stringToDouble) double spent,
    @JsonKey(fromJson: _stringToDouble) double remaining,
    @JsonKey(fromJson: _stringToDouble) double percentageUsed,
    @JsonKey(name: 'is_over_budget') bool isOverBudget,
    @JsonKey(name: 'period_start') String? periodStart,
    @JsonKey(name: 'period_end') String? periodEnd,
    @JsonKey(name: 'days_remaining') int daysRemaining,
    @JsonKey(name: 'start_date') DateTime? startDate,
  });

  @override
  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$$BudgetModelImplCopyWithImpl<$Res>
    extends _$BudgetModelCopyWithImpl<$Res, _$BudgetModelImpl>
    implements _$$BudgetModelImplCopyWith<$Res> {
  __$$BudgetModelImplCopyWithImpl(
    _$BudgetModelImpl _value,
    $Res Function(_$BudgetModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? amount = null,
    Object? currencyCode = null,
    Object? period = null,
    Object? alertThreshold = null,
    Object? spent = null,
    Object? remaining = null,
    Object? percentageUsed = null,
    Object? isOverBudget = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
    Object? daysRemaining = null,
    Object? startDate = freezed,
  }) {
    return _then(
      _$BudgetModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as CategoryModel,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currencyCode: null == currencyCode
            ? _value.currencyCode
            : currencyCode // ignore: cast_nullable_to_non_nullable
                  as String,
        period: null == period
            ? _value.period
            : period // ignore: cast_nullable_to_non_nullable
                  as String,
        alertThreshold: null == alertThreshold
            ? _value.alertThreshold
            : alertThreshold // ignore: cast_nullable_to_non_nullable
                  as double,
        spent: null == spent
            ? _value.spent
            : spent // ignore: cast_nullable_to_non_nullable
                  as double,
        remaining: null == remaining
            ? _value.remaining
            : remaining // ignore: cast_nullable_to_non_nullable
                  as double,
        percentageUsed: null == percentageUsed
            ? _value.percentageUsed
            : percentageUsed // ignore: cast_nullable_to_non_nullable
                  as double,
        isOverBudget: null == isOverBudget
            ? _value.isOverBudget
            : isOverBudget // ignore: cast_nullable_to_non_nullable
                  as bool,
        periodStart: freezed == periodStart
            ? _value.periodStart
            : periodStart // ignore: cast_nullable_to_non_nullable
                  as String?,
        periodEnd: freezed == periodEnd
            ? _value.periodEnd
            : periodEnd // ignore: cast_nullable_to_non_nullable
                  as String?,
        daysRemaining: null == daysRemaining
            ? _value.daysRemaining
            : daysRemaining // ignore: cast_nullable_to_non_nullable
                  as int,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetModelImpl implements _BudgetModel {
  const _$BudgetModelImpl({
    required this.id,
    required this.category,
    @JsonKey(fromJson: _stringToDouble) required this.amount,
    this.currencyCode = '',
    this.period = 'monthly',
    @JsonKey(name: 'alert_threshold') this.alertThreshold = 0.8,
    @JsonKey(fromJson: _stringToDouble) this.spent = 0,
    @JsonKey(fromJson: _stringToDouble) this.remaining = 0,
    @JsonKey(fromJson: _stringToDouble) this.percentageUsed = 0,
    @JsonKey(name: 'is_over_budget') this.isOverBudget = false,
    @JsonKey(name: 'period_start') this.periodStart,
    @JsonKey(name: 'period_end') this.periodEnd,
    @JsonKey(name: 'days_remaining') this.daysRemaining = 0,
    @JsonKey(name: 'start_date') this.startDate,
  });

  factory _$BudgetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetModelImplFromJson(json);

  @override
  final int id;
  @override
  final CategoryModel category;
  @override
  @JsonKey(fromJson: _stringToDouble)
  final double amount;
  @override
  @JsonKey()
  final String currencyCode;
  @override
  @JsonKey()
  final String period;
  @override
  @JsonKey(name: 'alert_threshold')
  final double alertThreshold;
  @override
  @JsonKey(fromJson: _stringToDouble)
  final double spent;
  @override
  @JsonKey(fromJson: _stringToDouble)
  final double remaining;
  @override
  @JsonKey(fromJson: _stringToDouble)
  final double percentageUsed;
  @override
  @JsonKey(name: 'is_over_budget')
  final bool isOverBudget;
  @override
  @JsonKey(name: 'period_start')
  final String? periodStart;
  @override
  @JsonKey(name: 'period_end')
  final String? periodEnd;
  @override
  @JsonKey(name: 'days_remaining')
  final int daysRemaining;
  @override
  @JsonKey(name: 'start_date')
  final DateTime? startDate;

  @override
  String toString() {
    return 'BudgetModel(id: $id, category: $category, amount: $amount, currencyCode: $currencyCode, period: $period, alertThreshold: $alertThreshold, spent: $spent, remaining: $remaining, percentageUsed: $percentageUsed, isOverBudget: $isOverBudget, periodStart: $periodStart, periodEnd: $periodEnd, daysRemaining: $daysRemaining, startDate: $startDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.alertThreshold, alertThreshold) ||
                other.alertThreshold == alertThreshold) &&
            (identical(other.spent, spent) || other.spent == spent) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.percentageUsed, percentageUsed) ||
                other.percentageUsed == percentageUsed) &&
            (identical(other.isOverBudget, isOverBudget) ||
                other.isOverBudget == isOverBudget) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.daysRemaining, daysRemaining) ||
                other.daysRemaining == daysRemaining) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    category,
    amount,
    currencyCode,
    period,
    alertThreshold,
    spent,
    remaining,
    percentageUsed,
    isOverBudget,
    periodStart,
    periodEnd,
    daysRemaining,
    startDate,
  );

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetModelImplCopyWith<_$BudgetModelImpl> get copyWith =>
      __$$BudgetModelImplCopyWithImpl<_$BudgetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetModelImplToJson(this);
  }
}

abstract class _BudgetModel implements BudgetModel {
  const factory _BudgetModel({
    required final int id,
    required final CategoryModel category,
    @JsonKey(fromJson: _stringToDouble) required final double amount,
    final String currencyCode,
    final String period,
    @JsonKey(name: 'alert_threshold') final double alertThreshold,
    @JsonKey(fromJson: _stringToDouble) final double spent,
    @JsonKey(fromJson: _stringToDouble) final double remaining,
    @JsonKey(fromJson: _stringToDouble) final double percentageUsed,
    @JsonKey(name: 'is_over_budget') final bool isOverBudget,
    @JsonKey(name: 'period_start') final String? periodStart,
    @JsonKey(name: 'period_end') final String? periodEnd,
    @JsonKey(name: 'days_remaining') final int daysRemaining,
    @JsonKey(name: 'start_date') final DateTime? startDate,
  }) = _$BudgetModelImpl;

  factory _BudgetModel.fromJson(Map<String, dynamic> json) =
      _$BudgetModelImpl.fromJson;

  @override
  int get id;
  @override
  CategoryModel get category;
  @override
  @JsonKey(fromJson: _stringToDouble)
  double get amount;
  @override
  String get currencyCode;
  @override
  String get period;
  @override
  @JsonKey(name: 'alert_threshold')
  double get alertThreshold;
  @override
  @JsonKey(fromJson: _stringToDouble)
  double get spent;
  @override
  @JsonKey(fromJson: _stringToDouble)
  double get remaining;
  @override
  @JsonKey(fromJson: _stringToDouble)
  double get percentageUsed;
  @override
  @JsonKey(name: 'is_over_budget')
  bool get isOverBudget;
  @override
  @JsonKey(name: 'period_start')
  String? get periodStart;
  @override
  @JsonKey(name: 'period_end')
  String? get periodEnd;
  @override
  @JsonKey(name: 'days_remaining')
  int get daysRemaining;
  @override
  @JsonKey(name: 'start_date')
  DateTime? get startDate;

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetModelImplCopyWith<_$BudgetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
