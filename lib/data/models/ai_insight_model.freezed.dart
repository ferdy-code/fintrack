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
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get severity => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

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
    String id,
    String type,
    String title,
    String content,
    String? severity,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
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
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? content = null,
    Object? severity = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
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
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            severity: freezed == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
    String id,
    String type,
    String title,
    String content,
    String? severity,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
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
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? content = null,
    Object? severity = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$AiInsightModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        severity: freezed == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
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
class _$AiInsightModelImpl implements _AiInsightModel {
  const _$AiInsightModelImpl({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    this.severity,
    final Map<String, dynamic>? metadata,
    this.createdAt,
  }) : _metadata = metadata;

  factory _$AiInsightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiInsightModelImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String title;
  @override
  final String content;
  @override
  final String? severity;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'AiInsightModel(id: $id, type: $type, title: $title, content: $content, severity: $severity, metadata: $metadata, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiInsightModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    title,
    content,
    severity,
    const DeepCollectionEquality().hash(_metadata),
    createdAt,
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
    required final String id,
    required final String type,
    required final String title,
    required final String content,
    final String? severity,
    final Map<String, dynamic>? metadata,
    final DateTime? createdAt,
  }) = _$AiInsightModelImpl;

  factory _AiInsightModel.fromJson(Map<String, dynamic> json) =
      _$AiInsightModelImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get title;
  @override
  String get content;
  @override
  String? get severity;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;

  /// Create a copy of AiInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiInsightModelImplCopyWith<_$AiInsightModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
