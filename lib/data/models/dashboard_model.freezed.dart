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
  @JsonKey(name: 'total_balance', fromJson: _stringToDouble)
  double get totalBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_currency')
  String get defaultCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'month_summary')
  MonthSummary get monthSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_breakdown')
  List<CategoryBreakdown> get categoryBreakdown =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_alerts')
  List<BudgetModel> get budgetAlerts => throw _privateConstructorUsedError;
  @JsonKey(name: 'recent_transactions')
  List<TransactionModel> get recentTransactions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_trend')
  List<MonthlyTrend> get monthlyTrend => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_balances')
  List<WalletModel> get walletBalances => throw _privateConstructorUsedError;

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
    @JsonKey(name: 'total_balance', fromJson: _stringToDouble)
    double totalBalance,
    @JsonKey(name: 'default_currency') String defaultCurrency,
    @JsonKey(name: 'month_summary') MonthSummary monthSummary,
    @JsonKey(name: 'category_breakdown')
    List<CategoryBreakdown> categoryBreakdown,
    @JsonKey(name: 'budget_alerts') List<BudgetModel> budgetAlerts,
    @JsonKey(name: 'recent_transactions')
    List<TransactionModel> recentTransactions,
    @JsonKey(name: 'monthly_trend') List<MonthlyTrend> monthlyTrend,
    @JsonKey(name: 'wallet_balances') List<WalletModel> walletBalances,
  });

  $MonthSummaryCopyWith<$Res> get monthSummary;
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
    Object? defaultCurrency = null,
    Object? monthSummary = null,
    Object? categoryBreakdown = null,
    Object? budgetAlerts = null,
    Object? recentTransactions = null,
    Object? monthlyTrend = null,
    Object? walletBalances = null,
  }) {
    return _then(
      _value.copyWith(
            totalBalance: null == totalBalance
                ? _value.totalBalance
                : totalBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            defaultCurrency: null == defaultCurrency
                ? _value.defaultCurrency
                : defaultCurrency // ignore: cast_nullable_to_non_nullable
                      as String,
            monthSummary: null == monthSummary
                ? _value.monthSummary
                : monthSummary // ignore: cast_nullable_to_non_nullable
                      as MonthSummary,
            categoryBreakdown: null == categoryBreakdown
                ? _value.categoryBreakdown
                : categoryBreakdown // ignore: cast_nullable_to_non_nullable
                      as List<CategoryBreakdown>,
            budgetAlerts: null == budgetAlerts
                ? _value.budgetAlerts
                : budgetAlerts // ignore: cast_nullable_to_non_nullable
                      as List<BudgetModel>,
            recentTransactions: null == recentTransactions
                ? _value.recentTransactions
                : recentTransactions // ignore: cast_nullable_to_non_nullable
                      as List<TransactionModel>,
            monthlyTrend: null == monthlyTrend
                ? _value.monthlyTrend
                : monthlyTrend // ignore: cast_nullable_to_non_nullable
                      as List<MonthlyTrend>,
            walletBalances: null == walletBalances
                ? _value.walletBalances
                : walletBalances // ignore: cast_nullable_to_non_nullable
                      as List<WalletModel>,
          )
          as $Val,
    );
  }

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MonthSummaryCopyWith<$Res> get monthSummary {
    return $MonthSummaryCopyWith<$Res>(_value.monthSummary, (value) {
      return _then(_value.copyWith(monthSummary: value) as $Val);
    });
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
    @JsonKey(name: 'total_balance', fromJson: _stringToDouble)
    double totalBalance,
    @JsonKey(name: 'default_currency') String defaultCurrency,
    @JsonKey(name: 'month_summary') MonthSummary monthSummary,
    @JsonKey(name: 'category_breakdown')
    List<CategoryBreakdown> categoryBreakdown,
    @JsonKey(name: 'budget_alerts') List<BudgetModel> budgetAlerts,
    @JsonKey(name: 'recent_transactions')
    List<TransactionModel> recentTransactions,
    @JsonKey(name: 'monthly_trend') List<MonthlyTrend> monthlyTrend,
    @JsonKey(name: 'wallet_balances') List<WalletModel> walletBalances,
  });

  @override
  $MonthSummaryCopyWith<$Res> get monthSummary;
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
    Object? defaultCurrency = null,
    Object? monthSummary = null,
    Object? categoryBreakdown = null,
    Object? budgetAlerts = null,
    Object? recentTransactions = null,
    Object? monthlyTrend = null,
    Object? walletBalances = null,
  }) {
    return _then(
      _$DashboardModelImpl(
        totalBalance: null == totalBalance
            ? _value.totalBalance
            : totalBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        defaultCurrency: null == defaultCurrency
            ? _value.defaultCurrency
            : defaultCurrency // ignore: cast_nullable_to_non_nullable
                  as String,
        monthSummary: null == monthSummary
            ? _value.monthSummary
            : monthSummary // ignore: cast_nullable_to_non_nullable
                  as MonthSummary,
        categoryBreakdown: null == categoryBreakdown
            ? _value._categoryBreakdown
            : categoryBreakdown // ignore: cast_nullable_to_non_nullable
                  as List<CategoryBreakdown>,
        budgetAlerts: null == budgetAlerts
            ? _value._budgetAlerts
            : budgetAlerts // ignore: cast_nullable_to_non_nullable
                  as List<BudgetModel>,
        recentTransactions: null == recentTransactions
            ? _value._recentTransactions
            : recentTransactions // ignore: cast_nullable_to_non_nullable
                  as List<TransactionModel>,
        monthlyTrend: null == monthlyTrend
            ? _value._monthlyTrend
            : monthlyTrend // ignore: cast_nullable_to_non_nullable
                  as List<MonthlyTrend>,
        walletBalances: null == walletBalances
            ? _value._walletBalances
            : walletBalances // ignore: cast_nullable_to_non_nullable
                  as List<WalletModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardModelImpl implements _DashboardModel {
  const _$DashboardModelImpl({
    @JsonKey(name: 'total_balance', fromJson: _stringToDouble)
    required this.totalBalance,
    @JsonKey(name: 'default_currency') this.defaultCurrency = 'IDR',
    @JsonKey(name: 'month_summary') required this.monthSummary,
    @JsonKey(name: 'category_breakdown')
    required final List<CategoryBreakdown> categoryBreakdown,
    @JsonKey(name: 'budget_alerts')
    required final List<BudgetModel> budgetAlerts,
    @JsonKey(name: 'recent_transactions')
    required final List<TransactionModel> recentTransactions,
    @JsonKey(name: 'monthly_trend')
    required final List<MonthlyTrend> monthlyTrend,
    @JsonKey(name: 'wallet_balances')
    required final List<WalletModel> walletBalances,
  }) : _categoryBreakdown = categoryBreakdown,
       _budgetAlerts = budgetAlerts,
       _recentTransactions = recentTransactions,
       _monthlyTrend = monthlyTrend,
       _walletBalances = walletBalances;

  factory _$DashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardModelImplFromJson(json);

  @override
  @JsonKey(name: 'total_balance', fromJson: _stringToDouble)
  final double totalBalance;
  @override
  @JsonKey(name: 'default_currency')
  final String defaultCurrency;
  @override
  @JsonKey(name: 'month_summary')
  final MonthSummary monthSummary;
  final List<CategoryBreakdown> _categoryBreakdown;
  @override
  @JsonKey(name: 'category_breakdown')
  List<CategoryBreakdown> get categoryBreakdown {
    if (_categoryBreakdown is EqualUnmodifiableListView)
      return _categoryBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryBreakdown);
  }

  final List<BudgetModel> _budgetAlerts;
  @override
  @JsonKey(name: 'budget_alerts')
  List<BudgetModel> get budgetAlerts {
    if (_budgetAlerts is EqualUnmodifiableListView) return _budgetAlerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_budgetAlerts);
  }

  final List<TransactionModel> _recentTransactions;
  @override
  @JsonKey(name: 'recent_transactions')
  List<TransactionModel> get recentTransactions {
    if (_recentTransactions is EqualUnmodifiableListView)
      return _recentTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentTransactions);
  }

  final List<MonthlyTrend> _monthlyTrend;
  @override
  @JsonKey(name: 'monthly_trend')
  List<MonthlyTrend> get monthlyTrend {
    if (_monthlyTrend is EqualUnmodifiableListView) return _monthlyTrend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyTrend);
  }

  final List<WalletModel> _walletBalances;
  @override
  @JsonKey(name: 'wallet_balances')
  List<WalletModel> get walletBalances {
    if (_walletBalances is EqualUnmodifiableListView) return _walletBalances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_walletBalances);
  }

  @override
  String toString() {
    return 'DashboardModel(totalBalance: $totalBalance, defaultCurrency: $defaultCurrency, monthSummary: $monthSummary, categoryBreakdown: $categoryBreakdown, budgetAlerts: $budgetAlerts, recentTransactions: $recentTransactions, monthlyTrend: $monthlyTrend, walletBalances: $walletBalances)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardModelImpl &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance) &&
            (identical(other.defaultCurrency, defaultCurrency) ||
                other.defaultCurrency == defaultCurrency) &&
            (identical(other.monthSummary, monthSummary) ||
                other.monthSummary == monthSummary) &&
            const DeepCollectionEquality().equals(
              other._categoryBreakdown,
              _categoryBreakdown,
            ) &&
            const DeepCollectionEquality().equals(
              other._budgetAlerts,
              _budgetAlerts,
            ) &&
            const DeepCollectionEquality().equals(
              other._recentTransactions,
              _recentTransactions,
            ) &&
            const DeepCollectionEquality().equals(
              other._monthlyTrend,
              _monthlyTrend,
            ) &&
            const DeepCollectionEquality().equals(
              other._walletBalances,
              _walletBalances,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalBalance,
    defaultCurrency,
    monthSummary,
    const DeepCollectionEquality().hash(_categoryBreakdown),
    const DeepCollectionEquality().hash(_budgetAlerts),
    const DeepCollectionEquality().hash(_recentTransactions),
    const DeepCollectionEquality().hash(_monthlyTrend),
    const DeepCollectionEquality().hash(_walletBalances),
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
    @JsonKey(name: 'total_balance', fromJson: _stringToDouble)
    required final double totalBalance,
    @JsonKey(name: 'default_currency') final String defaultCurrency,
    @JsonKey(name: 'month_summary') required final MonthSummary monthSummary,
    @JsonKey(name: 'category_breakdown')
    required final List<CategoryBreakdown> categoryBreakdown,
    @JsonKey(name: 'budget_alerts')
    required final List<BudgetModel> budgetAlerts,
    @JsonKey(name: 'recent_transactions')
    required final List<TransactionModel> recentTransactions,
    @JsonKey(name: 'monthly_trend')
    required final List<MonthlyTrend> monthlyTrend,
    @JsonKey(name: 'wallet_balances')
    required final List<WalletModel> walletBalances,
  }) = _$DashboardModelImpl;

  factory _DashboardModel.fromJson(Map<String, dynamic> json) =
      _$DashboardModelImpl.fromJson;

  @override
  @JsonKey(name: 'total_balance', fromJson: _stringToDouble)
  double get totalBalance;
  @override
  @JsonKey(name: 'default_currency')
  String get defaultCurrency;
  @override
  @JsonKey(name: 'month_summary')
  MonthSummary get monthSummary;
  @override
  @JsonKey(name: 'category_breakdown')
  List<CategoryBreakdown> get categoryBreakdown;
  @override
  @JsonKey(name: 'budget_alerts')
  List<BudgetModel> get budgetAlerts;
  @override
  @JsonKey(name: 'recent_transactions')
  List<TransactionModel> get recentTransactions;
  @override
  @JsonKey(name: 'monthly_trend')
  List<MonthlyTrend> get monthlyTrend;
  @override
  @JsonKey(name: 'wallet_balances')
  List<WalletModel> get walletBalances;

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardModelImplCopyWith<_$DashboardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthSummary _$MonthSummaryFromJson(Map<String, dynamic> json) {
  return _MonthSummary.fromJson(json);
}

/// @nodoc
mixin _$MonthSummary {
  @JsonKey(fromJson: _stringToDouble)
  double get income => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringToDouble)
  double get expense => throw _privateConstructorUsedError;
  @JsonKey(name: 'savings_rate', fromJson: _stringToDouble)
  double get savingsRate => throw _privateConstructorUsedError;

  /// Serializes this MonthSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthSummaryCopyWith<MonthSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthSummaryCopyWith<$Res> {
  factory $MonthSummaryCopyWith(
    MonthSummary value,
    $Res Function(MonthSummary) then,
  ) = _$MonthSummaryCopyWithImpl<$Res, MonthSummary>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _stringToDouble) double income,
    @JsonKey(fromJson: _stringToDouble) double expense,
    @JsonKey(name: 'savings_rate', fromJson: _stringToDouble)
    double savingsRate,
  });
}

/// @nodoc
class _$MonthSummaryCopyWithImpl<$Res, $Val extends MonthSummary>
    implements $MonthSummaryCopyWith<$Res> {
  _$MonthSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? expense = null,
    Object? savingsRate = null,
  }) {
    return _then(
      _value.copyWith(
            income: null == income
                ? _value.income
                : income // ignore: cast_nullable_to_non_nullable
                      as double,
            expense: null == expense
                ? _value.expense
                : expense // ignore: cast_nullable_to_non_nullable
                      as double,
            savingsRate: null == savingsRate
                ? _value.savingsRate
                : savingsRate // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthSummaryImplCopyWith<$Res>
    implements $MonthSummaryCopyWith<$Res> {
  factory _$$MonthSummaryImplCopyWith(
    _$MonthSummaryImpl value,
    $Res Function(_$MonthSummaryImpl) then,
  ) = __$$MonthSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _stringToDouble) double income,
    @JsonKey(fromJson: _stringToDouble) double expense,
    @JsonKey(name: 'savings_rate', fromJson: _stringToDouble)
    double savingsRate,
  });
}

/// @nodoc
class __$$MonthSummaryImplCopyWithImpl<$Res>
    extends _$MonthSummaryCopyWithImpl<$Res, _$MonthSummaryImpl>
    implements _$$MonthSummaryImplCopyWith<$Res> {
  __$$MonthSummaryImplCopyWithImpl(
    _$MonthSummaryImpl _value,
    $Res Function(_$MonthSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? expense = null,
    Object? savingsRate = null,
  }) {
    return _then(
      _$MonthSummaryImpl(
        income: null == income
            ? _value.income
            : income // ignore: cast_nullable_to_non_nullable
                  as double,
        expense: null == expense
            ? _value.expense
            : expense // ignore: cast_nullable_to_non_nullable
                  as double,
        savingsRate: null == savingsRate
            ? _value.savingsRate
            : savingsRate // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthSummaryImpl implements _MonthSummary {
  const _$MonthSummaryImpl({
    @JsonKey(fromJson: _stringToDouble) required this.income,
    @JsonKey(fromJson: _stringToDouble) required this.expense,
    @JsonKey(name: 'savings_rate', fromJson: _stringToDouble)
    this.savingsRate = 0,
  });

  factory _$MonthSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthSummaryImplFromJson(json);

  @override
  @JsonKey(fromJson: _stringToDouble)
  final double income;
  @override
  @JsonKey(fromJson: _stringToDouble)
  final double expense;
  @override
  @JsonKey(name: 'savings_rate', fromJson: _stringToDouble)
  final double savingsRate;

  @override
  String toString() {
    return 'MonthSummary(income: $income, expense: $expense, savingsRate: $savingsRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthSummaryImpl &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.expense, expense) || other.expense == expense) &&
            (identical(other.savingsRate, savingsRate) ||
                other.savingsRate == savingsRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, income, expense, savingsRate);

  /// Create a copy of MonthSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthSummaryImplCopyWith<_$MonthSummaryImpl> get copyWith =>
      __$$MonthSummaryImplCopyWithImpl<_$MonthSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthSummaryImplToJson(this);
  }
}

abstract class _MonthSummary implements MonthSummary {
  const factory _MonthSummary({
    @JsonKey(fromJson: _stringToDouble) required final double income,
    @JsonKey(fromJson: _stringToDouble) required final double expense,
    @JsonKey(name: 'savings_rate', fromJson: _stringToDouble)
    final double savingsRate,
  }) = _$MonthSummaryImpl;

  factory _MonthSummary.fromJson(Map<String, dynamic> json) =
      _$MonthSummaryImpl.fromJson;

  @override
  @JsonKey(fromJson: _stringToDouble)
  double get income;
  @override
  @JsonKey(fromJson: _stringToDouble)
  double get expense;
  @override
  @JsonKey(name: 'savings_rate', fromJson: _stringToDouble)
  double get savingsRate;

  /// Create a copy of MonthSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthSummaryImplCopyWith<_$MonthSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryBreakdown _$CategoryBreakdownFromJson(Map<String, dynamic> json) {
  return _CategoryBreakdown.fromJson(json);
}

/// @nodoc
mixin _$CategoryBreakdown {
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringToDouble)
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringToDouble)
  double get percentage => throw _privateConstructorUsedError;

  /// Serializes this CategoryBreakdown to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryBreakdownCopyWith<CategoryBreakdown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryBreakdownCopyWith<$Res> {
  factory $CategoryBreakdownCopyWith(
    CategoryBreakdown value,
    $Res Function(CategoryBreakdown) then,
  ) = _$CategoryBreakdownCopyWithImpl<$Res, CategoryBreakdown>;
  @useResult
  $Res call({
    String name,
    String icon,
    String color,
    @JsonKey(fromJson: _stringToDouble) double amount,
    @JsonKey(fromJson: _stringToDouble) double percentage,
  });
}

/// @nodoc
class _$CategoryBreakdownCopyWithImpl<$Res, $Val extends CategoryBreakdown>
    implements $CategoryBreakdownCopyWith<$Res> {
  _$CategoryBreakdownCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? color = null,
    Object? amount = null,
    Object? percentage = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String,
            color: null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CategoryBreakdownImplCopyWith<$Res>
    implements $CategoryBreakdownCopyWith<$Res> {
  factory _$$CategoryBreakdownImplCopyWith(
    _$CategoryBreakdownImpl value,
    $Res Function(_$CategoryBreakdownImpl) then,
  ) = __$$CategoryBreakdownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String icon,
    String color,
    @JsonKey(fromJson: _stringToDouble) double amount,
    @JsonKey(fromJson: _stringToDouble) double percentage,
  });
}

/// @nodoc
class __$$CategoryBreakdownImplCopyWithImpl<$Res>
    extends _$CategoryBreakdownCopyWithImpl<$Res, _$CategoryBreakdownImpl>
    implements _$$CategoryBreakdownImplCopyWith<$Res> {
  __$$CategoryBreakdownImplCopyWithImpl(
    _$CategoryBreakdownImpl _value,
    $Res Function(_$CategoryBreakdownImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? color = null,
    Object? amount = null,
    Object? percentage = null,
  }) {
    return _then(
      _$CategoryBreakdownImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String,
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
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
class _$CategoryBreakdownImpl implements _CategoryBreakdown {
  const _$CategoryBreakdownImpl({
    required this.name,
    this.icon = 'category',
    required this.color,
    @JsonKey(fromJson: _stringToDouble) required this.amount,
    @JsonKey(fromJson: _stringToDouble) this.percentage = 0,
  });

  factory _$CategoryBreakdownImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryBreakdownImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final String icon;
  @override
  final String color;
  @override
  @JsonKey(fromJson: _stringToDouble)
  final double amount;
  @override
  @JsonKey(fromJson: _stringToDouble)
  final double percentage;

  @override
  String toString() {
    return 'CategoryBreakdown(name: $name, icon: $icon, color: $color, amount: $amount, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryBreakdownImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, icon, color, amount, percentage);

  /// Create a copy of CategoryBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryBreakdownImplCopyWith<_$CategoryBreakdownImpl> get copyWith =>
      __$$CategoryBreakdownImplCopyWithImpl<_$CategoryBreakdownImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryBreakdownImplToJson(this);
  }
}

abstract class _CategoryBreakdown implements CategoryBreakdown {
  const factory _CategoryBreakdown({
    required final String name,
    final String icon,
    required final String color,
    @JsonKey(fromJson: _stringToDouble) required final double amount,
    @JsonKey(fromJson: _stringToDouble) final double percentage,
  }) = _$CategoryBreakdownImpl;

  factory _CategoryBreakdown.fromJson(Map<String, dynamic> json) =
      _$CategoryBreakdownImpl.fromJson;

  @override
  String get name;
  @override
  String get icon;
  @override
  String get color;
  @override
  @JsonKey(fromJson: _stringToDouble)
  double get amount;
  @override
  @JsonKey(fromJson: _stringToDouble)
  double get percentage;

  /// Create a copy of CategoryBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryBreakdownImplCopyWith<_$CategoryBreakdownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyTrend _$MonthlyTrendFromJson(Map<String, dynamic> json) {
  return _MonthlyTrend.fromJson(json);
}

/// @nodoc
mixin _$MonthlyTrend {
  String get month => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringToDouble)
  double get income => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringToDouble)
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
  $Res call({
    String month,
    @JsonKey(fromJson: _stringToDouble) double income,
    @JsonKey(fromJson: _stringToDouble) double expense,
  });
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
  $Res call({
    String month,
    @JsonKey(fromJson: _stringToDouble) double income,
    @JsonKey(fromJson: _stringToDouble) double expense,
  });
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
    @JsonKey(fromJson: _stringToDouble) required this.income,
    @JsonKey(fromJson: _stringToDouble) required this.expense,
  });

  factory _$MonthlyTrendImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyTrendImplFromJson(json);

  @override
  final String month;
  @override
  @JsonKey(fromJson: _stringToDouble)
  final double income;
  @override
  @JsonKey(fromJson: _stringToDouble)
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
    @JsonKey(fromJson: _stringToDouble) required final double income,
    @JsonKey(fromJson: _stringToDouble) required final double expense,
  }) = _$MonthlyTrendImpl;

  factory _MonthlyTrend.fromJson(Map<String, dynamic> json) =
      _$MonthlyTrendImpl.fromJson;

  @override
  String get month;
  @override
  @JsonKey(fromJson: _stringToDouble)
  double get income;
  @override
  @JsonKey(fromJson: _stringToDouble)
  double get expense;

  /// Create a copy of MonthlyTrend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyTrendImplCopyWith<_$MonthlyTrendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
