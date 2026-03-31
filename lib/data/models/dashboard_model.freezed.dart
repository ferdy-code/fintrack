// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) {
  return _DashboardModel.fromJson(json);
}

/// @nodoc
mixin _$DashboardModel {
  double get totalBalance => throw _privateConstructorUsedError;
  double get totalIncome => throw _privateConstructorUsedError;
  double get totalExpense => throw _privateConstructorUsedError;
  List<CategorySpending> get spendingByCategory =>
      throw _privateConstructorUsedError;
  List<MonthlyTrend> get monthlyTrends => throw _privateConstructorUsedError;
  List<BudgetAlert> get budgetAlerts => throw _privateConstructorUsedError;

  /// Serializes this DashboardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardModelCopyWith<DashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardModelCopyWith<$Res> {
  factory $DashboardModelCopyWith(
    DashboardModel value,
    $Res Function(DashboardModel) then,
  ) = _$DashboardModelCopyWithImpl<$Res, DashboardModel>;
  @useResult
  $Res call({
    double totalBalance,
    double totalIncome,
    double totalExpense,
    List<CategorySpending> spendingByCategory,
    List<MonthlyTrend> monthlyTrends,
    List<BudgetAlert> budgetAlerts,
  });
}

/// @nodoc
class _$DashboardModelCopyWithImpl<$Res, $Val extends DashboardModel>
    implements $DashboardModelCopyWith<$Res> {
  _$DashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBalance = null,
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? spendingByCategory = null,
    Object? monthlyTrends = null,
    Object? budgetAlerts = null,
  }) {
    return _then(
      _value.copyWith(
            totalBalance: null == totalBalance
                ? _value.totalBalance
                : totalBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            totalIncome: null == totalIncome
                ? _value.totalIncome
                : totalIncome // ignore: cast_nullable_to_non_nullable
                      as double,
            totalExpense: null == totalExpense
                ? _value.totalExpense
                : totalExpense // ignore: cast_nullable_to_non_nullable
                      as double,
            spendingByCategory: null == spendingByCategory
                ? _value.spendingByCategory
                : spendingByCategory // ignore: cast_nullable_to_non_nullable
                      as List<CategorySpending>,
            monthlyTrends: null == monthlyTrends
                ? _value.monthlyTrends
                : monthlyTrends // ignore: cast_nullable_to_non_nullable
                      as List<MonthlyTrend>,
            budgetAlerts: null == budgetAlerts
                ? _value.budgetAlerts
                : budgetAlerts // ignore: cast_nullable_to_non_nullable
                      as List<BudgetAlert>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardModelImplCopyWith<$Res>
    implements $DashboardModelCopyWith<$Res> {
  factory _$$DashboardModelImplCopyWith(
    _$DashboardModelImpl value,
    $Res Function(_$DashboardModelImpl) then,
  ) = __$$DashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double totalBalance,
    double totalIncome,
    double totalExpense,
    List<CategorySpending> spendingByCategory,
    List<MonthlyTrend> monthlyTrends,
    List<BudgetAlert> budgetAlerts,
  });
}

/// @nodoc
class __$$DashboardModelImplCopyWithImpl<$Res>
    extends _$DashboardModelCopyWithImpl<$Res, _$DashboardModelImpl>
    implements _$$DashboardModelImplCopyWith<$Res> {
  __$$DashboardModelImplCopyWithImpl(
    _$DashboardModelImpl _value,
    $Res Function(_$DashboardModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBalance = null,
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? spendingByCategory = null,
    Object? monthlyTrends = null,
    Object? budgetAlerts = null,
  }) {
    return _then(
      _$DashboardModelImpl(
        totalBalance: null == totalBalance
            ? _value.totalBalance
            : totalBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        totalIncome: null == totalIncome
            ? _value.totalIncome
            : totalIncome // ignore: cast_nullable_to_non_nullable
                  as double,
        totalExpense: null == totalExpense
            ? _value.totalExpense
            : totalExpense // ignore: cast_nullable_to_non_nullable
                  as double,
        spendingByCategory: null == spendingByCategory
            ? _value._spendingByCategory
            : spendingByCategory // ignore: cast_nullable_to_non_nullable
                  as List<CategorySpending>,
        monthlyTrends: null == monthlyTrends
            ? _value._monthlyTrends
            : monthlyTrends // ignore: cast_nullable_to_non_nullable
                  as List<MonthlyTrend>,
        budgetAlerts: null == budgetAlerts
            ? _value._budgetAlerts
            : budgetAlerts // ignore: cast_nullable_to_non_nullable
                  as List<BudgetAlert>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardModelImpl implements _DashboardModel {
  const _$DashboardModelImpl({
    required this.totalBalance,
    required this.totalIncome,
    required this.totalExpense,
    required final List<CategorySpending> spendingByCategory,
    required final List<MonthlyTrend> monthlyTrends,
    required final List<BudgetAlert> budgetAlerts,
  }) : _spendingByCategory = spendingByCategory,
       _monthlyTrends = monthlyTrends,
       _budgetAlerts = budgetAlerts;

  factory _$DashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardModelImplFromJson(json);

  @override
  final double totalBalance;
  @override
  final double totalIncome;
  @override
  final double totalExpense;
  final List<CategorySpending> _spendingByCategory;
  @override
  List<CategorySpending> get spendingByCategory {
    if (_spendingByCategory is EqualUnmodifiableListView)
      return _spendingByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spendingByCategory);
  }

  final List<MonthlyTrend> _monthlyTrends;
  @override
  List<MonthlyTrend> get monthlyTrends {
    if (_monthlyTrends is EqualUnmodifiableListView) return _monthlyTrends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyTrends);
  }

  final List<BudgetAlert> _budgetAlerts;
  @override
  List<BudgetAlert> get budgetAlerts {
    if (_budgetAlerts is EqualUnmodifiableListView) return _budgetAlerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_budgetAlerts);
  }

  @override
  String toString() {
    return 'DashboardModel(totalBalance: $totalBalance, totalIncome: $totalIncome, totalExpense: $totalExpense, spendingByCategory: $spendingByCategory, monthlyTrends: $monthlyTrends, budgetAlerts: $budgetAlerts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardModelImpl &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            const DeepCollectionEquality().equals(
              other._spendingByCategory,
              _spendingByCategory,
            ) &&
            const DeepCollectionEquality().equals(
              other._monthlyTrends,
              _monthlyTrends,
            ) &&
            const DeepCollectionEquality().equals(
              other._budgetAlerts,
              _budgetAlerts,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalBalance,
    totalIncome,
    totalExpense,
    const DeepCollectionEquality().hash(_spendingByCategory),
    const DeepCollectionEquality().hash(_monthlyTrends),
    const DeepCollectionEquality().hash(_budgetAlerts),
  );

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardModelImplCopyWith<_$DashboardModelImpl> get copyWith =>
      __$$DashboardModelImplCopyWithImpl<_$DashboardModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardModelImplToJson(this);
  }
}

abstract class _DashboardModel implements DashboardModel {
  const factory _DashboardModel({
    required final double totalBalance,
    required final double totalIncome,
    required final double totalExpense,
    required final List<CategorySpending> spendingByCategory,
    required final List<MonthlyTrend> monthlyTrends,
    required final List<BudgetAlert> budgetAlerts,
  }) = _$DashboardModelImpl;

  factory _DashboardModel.fromJson(Map<String, dynamic> json) =
      _$DashboardModelImpl.fromJson;

  @override
  double get totalBalance;
  @override
  double get totalIncome;
  @override
  double get totalExpense;
  @override
  List<CategorySpending> get spendingByCategory;
  @override
  List<MonthlyTrend> get monthlyTrends;
  @override
  List<BudgetAlert> get budgetAlerts;

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardModelImplCopyWith<_$DashboardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategorySpending _$CategorySpendingFromJson(Map<String, dynamic> json) {
  return _CategorySpending.fromJson(json);
}

/// @nodoc
mixin _$CategorySpending {
  String get categoryId => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  /// Serializes this CategorySpending to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategorySpending
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategorySpendingCopyWith<CategorySpending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySpendingCopyWith<$Res> {
  factory $CategorySpendingCopyWith(
    CategorySpending value,
    $Res Function(CategorySpending) then,
  ) = _$CategorySpendingCopyWithImpl<$Res, CategorySpending>;
  @useResult
  $Res call({
    String categoryId,
    String categoryName,
    double amount,
    String color,
  });
}

/// @nodoc
class _$CategorySpendingCopyWithImpl<$Res, $Val extends CategorySpending>
    implements $CategorySpendingCopyWith<$Res> {
  _$CategorySpendingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategorySpending
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? amount = null,
    Object? color = null,
  }) {
    return _then(
      _value.copyWith(
            categoryId: null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryName: null == categoryName
                ? _value.categoryName
                : categoryName // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            color: null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategorySpendingImplCopyWith<$Res>
    implements $CategorySpendingCopyWith<$Res> {
  factory _$$CategorySpendingImplCopyWith(
    _$CategorySpendingImpl value,
    $Res Function(_$CategorySpendingImpl) then,
  ) = __$$CategorySpendingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String categoryId,
    String categoryName,
    double amount,
    String color,
  });
}

/// @nodoc
class __$$CategorySpendingImplCopyWithImpl<$Res>
    extends _$CategorySpendingCopyWithImpl<$Res, _$CategorySpendingImpl>
    implements _$$CategorySpendingImplCopyWith<$Res> {
  __$$CategorySpendingImplCopyWithImpl(
    _$CategorySpendingImpl _value,
    $Res Function(_$CategorySpendingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategorySpending
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? amount = null,
    Object? color = null,
  }) {
    return _then(
      _$CategorySpendingImpl(
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryName: null == categoryName
            ? _value.categoryName
            : categoryName // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategorySpendingImpl implements _CategorySpending {
  const _$CategorySpendingImpl({
    required this.categoryId,
    required this.categoryName,
    required this.amount,
    required this.color,
  });

  factory _$CategorySpendingImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategorySpendingImplFromJson(json);

  @override
  final String categoryId;
  @override
  final String categoryName;
  @override
  final double amount;
  @override
  final String color;

  @override
  String toString() {
    return 'CategorySpending(categoryId: $categoryId, categoryName: $categoryName, amount: $amount, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySpendingImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryId, categoryName, amount, color);

  /// Create a copy of CategorySpending
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySpendingImplCopyWith<_$CategorySpendingImpl> get copyWith =>
      __$$CategorySpendingImplCopyWithImpl<_$CategorySpendingImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategorySpendingImplToJson(this);
  }
}

abstract class _CategorySpending implements CategorySpending {
  const factory _CategorySpending({
    required final String categoryId,
    required final String categoryName,
    required final double amount,
    required final String color,
  }) = _$CategorySpendingImpl;

  factory _CategorySpending.fromJson(Map<String, dynamic> json) =
      _$CategorySpendingImpl.fromJson;

  @override
  String get categoryId;
  @override
  String get categoryName;
  @override
  double get amount;
  @override
  String get color;

  /// Create a copy of CategorySpending
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategorySpendingImplCopyWith<_$CategorySpendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyTrend _$MonthlyTrendFromJson(Map<String, dynamic> json) {
  return _MonthlyTrend.fromJson(json);
}

/// @nodoc
mixin _$MonthlyTrend {
  String get month => throw _privateConstructorUsedError;
  double get income => throw _privateConstructorUsedError;
  double get expense => throw _privateConstructorUsedError;

  /// Serializes this MonthlyTrend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyTrend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyTrendCopyWith<MonthlyTrend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyTrendCopyWith<$Res> {
  factory $MonthlyTrendCopyWith(
    MonthlyTrend value,
    $Res Function(MonthlyTrend) then,
  ) = _$MonthlyTrendCopyWithImpl<$Res, MonthlyTrend>;
  @useResult
  $Res call({String month, double income, double expense});
}

/// @nodoc
class _$MonthlyTrendCopyWithImpl<$Res, $Val extends MonthlyTrend>
    implements $MonthlyTrendCopyWith<$Res> {
  _$MonthlyTrendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyTrend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? income = null,
    Object? expense = null,
  }) {
    return _then(
      _value.copyWith(
            month: null == month
                ? _value.month
                : month // ignore: cast_nullable_to_non_nullable
                      as String,
            income: null == income
                ? _value.income
                : income // ignore: cast_nullable_to_non_nullable
                      as double,
            expense: null == expense
                ? _value.expense
                : expense // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthlyTrendImplCopyWith<$Res>
    implements $MonthlyTrendCopyWith<$Res> {
  factory _$$MonthlyTrendImplCopyWith(
    _$MonthlyTrendImpl value,
    $Res Function(_$MonthlyTrendImpl) then,
  ) = __$$MonthlyTrendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String month, double income, double expense});
}

/// @nodoc
class __$$MonthlyTrendImplCopyWithImpl<$Res>
    extends _$MonthlyTrendCopyWithImpl<$Res, _$MonthlyTrendImpl>
    implements _$$MonthlyTrendImplCopyWith<$Res> {
  __$$MonthlyTrendImplCopyWithImpl(
    _$MonthlyTrendImpl _value,
    $Res Function(_$MonthlyTrendImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyTrend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? income = null,
    Object? expense = null,
  }) {
    return _then(
      _$MonthlyTrendImpl(
        month: null == month
            ? _value.month
            : month // ignore: cast_nullable_to_non_nullable
                  as String,
        income: null == income
            ? _value.income
            : income // ignore: cast_nullable_to_non_nullable
                  as double,
        expense: null == expense
            ? _value.expense
            : expense // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyTrendImpl implements _MonthlyTrend {
  const _$MonthlyTrendImpl({
    required this.month,
    required this.income,
    required this.expense,
  });

  factory _$MonthlyTrendImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyTrendImplFromJson(json);

  @override
  final String month;
  @override
  final double income;
  @override
  final double expense;

  @override
  String toString() {
    return 'MonthlyTrend(month: $month, income: $income, expense: $expense)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyTrendImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.expense, expense) || other.expense == expense));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, month, income, expense);

  /// Create a copy of MonthlyTrend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyTrendImplCopyWith<_$MonthlyTrendImpl> get copyWith =>
      __$$MonthlyTrendImplCopyWithImpl<_$MonthlyTrendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyTrendImplToJson(this);
  }
}

abstract class _MonthlyTrend implements MonthlyTrend {
  const factory _MonthlyTrend({
    required final String month,
    required final double income,
    required final double expense,
  }) = _$MonthlyTrendImpl;

  factory _MonthlyTrend.fromJson(Map<String, dynamic> json) =
      _$MonthlyTrendImpl.fromJson;

  @override
  String get month;
  @override
  double get income;
  @override
  double get expense;

  /// Create a copy of MonthlyTrend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyTrendImplCopyWith<_$MonthlyTrendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BudgetAlert _$BudgetAlertFromJson(Map<String, dynamic> json) {
  return _BudgetAlert.fromJson(json);
}

/// @nodoc
mixin _$BudgetAlert {
  String get budgetId => throw _privateConstructorUsedError;
  String get budgetName => throw _privateConstructorUsedError;
  double get budgetAmount => throw _privateConstructorUsedError;
  double get spentAmount => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  /// Serializes this BudgetAlert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BudgetAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetAlertCopyWith<BudgetAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetAlertCopyWith<$Res> {
  factory $BudgetAlertCopyWith(
    BudgetAlert value,
    $Res Function(BudgetAlert) then,
  ) = _$BudgetAlertCopyWithImpl<$Res, BudgetAlert>;
  @useResult
  $Res call({
    String budgetId,
    String budgetName,
    double budgetAmount,
    double spentAmount,
    double percentage,
  });
}

/// @nodoc
class _$BudgetAlertCopyWithImpl<$Res, $Val extends BudgetAlert>
    implements $BudgetAlertCopyWith<$Res> {
  _$BudgetAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetId = null,
    Object? budgetName = null,
    Object? budgetAmount = null,
    Object? spentAmount = null,
    Object? percentage = null,
  }) {
    return _then(
      _value.copyWith(
            budgetId: null == budgetId
                ? _value.budgetId
                : budgetId // ignore: cast_nullable_to_non_nullable
                      as String,
            budgetName: null == budgetName
                ? _value.budgetName
                : budgetName // ignore: cast_nullable_to_non_nullable
                      as String,
            budgetAmount: null == budgetAmount
                ? _value.budgetAmount
                : budgetAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            spentAmount: null == spentAmount
                ? _value.spentAmount
                : spentAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            percentage: null == percentage
                ? _value.percentage
                : percentage // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BudgetAlertImplCopyWith<$Res>
    implements $BudgetAlertCopyWith<$Res> {
  factory _$$BudgetAlertImplCopyWith(
    _$BudgetAlertImpl value,
    $Res Function(_$BudgetAlertImpl) then,
  ) = __$$BudgetAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String budgetId,
    String budgetName,
    double budgetAmount,
    double spentAmount,
    double percentage,
  });
}

/// @nodoc
class __$$BudgetAlertImplCopyWithImpl<$Res>
    extends _$BudgetAlertCopyWithImpl<$Res, _$BudgetAlertImpl>
    implements _$$BudgetAlertImplCopyWith<$Res> {
  __$$BudgetAlertImplCopyWithImpl(
    _$BudgetAlertImpl _value,
    $Res Function(_$BudgetAlertImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BudgetAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetId = null,
    Object? budgetName = null,
    Object? budgetAmount = null,
    Object? spentAmount = null,
    Object? percentage = null,
  }) {
    return _then(
      _$BudgetAlertImpl(
        budgetId: null == budgetId
            ? _value.budgetId
            : budgetId // ignore: cast_nullable_to_non_nullable
                  as String,
        budgetName: null == budgetName
            ? _value.budgetName
            : budgetName // ignore: cast_nullable_to_non_nullable
                  as String,
        budgetAmount: null == budgetAmount
            ? _value.budgetAmount
            : budgetAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        spentAmount: null == spentAmount
            ? _value.spentAmount
            : spentAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        percentage: null == percentage
            ? _value.percentage
            : percentage // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetAlertImpl implements _BudgetAlert {
  const _$BudgetAlertImpl({
    required this.budgetId,
    required this.budgetName,
    required this.budgetAmount,
    required this.spentAmount,
    required this.percentage,
  });

  factory _$BudgetAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetAlertImplFromJson(json);

  @override
  final String budgetId;
  @override
  final String budgetName;
  @override
  final double budgetAmount;
  @override
  final double spentAmount;
  @override
  final double percentage;

  @override
  String toString() {
    return 'BudgetAlert(budgetId: $budgetId, budgetName: $budgetName, budgetAmount: $budgetAmount, spentAmount: $spentAmount, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetAlertImpl &&
            (identical(other.budgetId, budgetId) ||
                other.budgetId == budgetId) &&
            (identical(other.budgetName, budgetName) ||
                other.budgetName == budgetName) &&
            (identical(other.budgetAmount, budgetAmount) ||
                other.budgetAmount == budgetAmount) &&
            (identical(other.spentAmount, spentAmount) ||
                other.spentAmount == spentAmount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    budgetId,
    budgetName,
    budgetAmount,
    spentAmount,
    percentage,
  );

  /// Create a copy of BudgetAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetAlertImplCopyWith<_$BudgetAlertImpl> get copyWith =>
      __$$BudgetAlertImplCopyWithImpl<_$BudgetAlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetAlertImplToJson(this);
  }
}

abstract class _BudgetAlert implements BudgetAlert {
  const factory _BudgetAlert({
    required final String budgetId,
    required final String budgetName,
    required final double budgetAmount,
    required final double spentAmount,
    required final double percentage,
  }) = _$BudgetAlertImpl;

  factory _BudgetAlert.fromJson(Map<String, dynamic> json) =
      _$BudgetAlertImpl.fromJson;

  @override
  String get budgetId;
  @override
  String get budgetName;
  @override
  double get budgetAmount;
  @override
  double get spentAmount;
  @override
  double get percentage;

  /// Create a copy of BudgetAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetAlertImplCopyWith<_$BudgetAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
