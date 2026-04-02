// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_insight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AiInsightModel _$AiInsightModelFromJson(Map<String, dynamic> json) {
  return _AiInsightModel.fromJson(json);
}

/// @nodoc
mixin _$AiInsightModel {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'potential_savings')
  double? get potentialSavings => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this AiInsightModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiInsightModelCopyWith<AiInsightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiInsightModelCopyWith<$Res> {
  factory $AiInsightModelCopyWith(
    AiInsightModel value,
    $Res Function(AiInsightModel) then,
  ) = _$AiInsightModelCopyWithImpl<$Res, AiInsightModel>;
  @useResult
  $Res call({
    String title,
    String description,
    @JsonKey(name: 'potential_savings') double? potentialSavings,
    String priority,
    String? category,
  });
}

/// @nodoc
class _$AiInsightModelCopyWithImpl<$Res, $Val extends AiInsightModel>
    implements $AiInsightModelCopyWith<$Res> {
  _$AiInsightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? potentialSavings = freezed,
    Object? priority = null,
    Object? category = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            potentialSavings: freezed == potentialSavings
                ? _value.potentialSavings
                : potentialSavings // ignore: cast_nullable_to_non_nullable
                      as double?,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as String,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiInsightModelImplCopyWith<$Res>
    implements $AiInsightModelCopyWith<$Res> {
  factory _$$AiInsightModelImplCopyWith(
    _$AiInsightModelImpl value,
    $Res Function(_$AiInsightModelImpl) then,
  ) = __$$AiInsightModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String description,
    @JsonKey(name: 'potential_savings') double? potentialSavings,
    String priority,
    String? category,
  });
}

/// @nodoc
class __$$AiInsightModelImplCopyWithImpl<$Res>
    extends _$AiInsightModelCopyWithImpl<$Res, _$AiInsightModelImpl>
    implements _$$AiInsightModelImplCopyWith<$Res> {
  __$$AiInsightModelImplCopyWithImpl(
    _$AiInsightModelImpl _value,
    $Res Function(_$AiInsightModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? potentialSavings = freezed,
    Object? priority = null,
    Object? category = freezed,
  }) {
    return _then(
      _$AiInsightModelImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        potentialSavings: freezed == potentialSavings
            ? _value.potentialSavings
            : potentialSavings // ignore: cast_nullable_to_non_nullable
                  as double?,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as String,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiInsightModelImpl implements _AiInsightModel {
  const _$AiInsightModelImpl({
    required this.title,
    required this.description,
    @JsonKey(name: 'potential_savings') this.potentialSavings,
    required this.priority,
    this.category,
  });

  factory _$AiInsightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiInsightModelImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: 'potential_savings')
  final double? potentialSavings;
  @override
  final String priority;
  @override
  final String? category;

  @override
  String toString() {
    return 'AiInsightModel(title: $title, description: $description, potentialSavings: $potentialSavings, priority: $priority, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiInsightModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.potentialSavings, potentialSavings) ||
                other.potentialSavings == potentialSavings) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    potentialSavings,
    priority,
    category,
  );

  /// Create a copy of AiInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiInsightModelImplCopyWith<_$AiInsightModelImpl> get copyWith =>
      __$$AiInsightModelImplCopyWithImpl<_$AiInsightModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiInsightModelImplToJson(this);
  }
}

abstract class _AiInsightModel implements AiInsightModel {
  const factory _AiInsightModel({
    required final String title,
    required final String description,
    @JsonKey(name: 'potential_savings') final double? potentialSavings,
    required final String priority,
    final String? category,
  }) = _$AiInsightModelImpl;

  factory _AiInsightModel.fromJson(Map<String, dynamic> json) =
      _$AiInsightModelImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'potential_savings')
  double? get potentialSavings;
  @override
  String get priority;
  @override
  String? get category;

  /// Create a copy of AiInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiInsightModelImplCopyWith<_$AiInsightModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
