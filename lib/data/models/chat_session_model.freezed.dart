// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatSessionModel _$ChatSessionModelFromJson(Map<String, dynamic> json) {
  return _ChatSessionModel.fromJson(json);
}

/// @nodoc
mixin _$ChatSessionModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ChatSessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatSessionModelCopyWith<ChatSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSessionModelCopyWith<$Res> {
  factory $ChatSessionModelCopyWith(
    ChatSessionModel value,
    $Res Function(ChatSessionModel) then,
  ) = _$ChatSessionModelCopyWithImpl<$Res, ChatSessionModel>;
  @useResult
  $Res call({
    String id,
    String title,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$ChatSessionModelCopyWithImpl<$Res, $Val extends ChatSessionModel>
    implements $ChatSessionModelCopyWith<$Res> {
  _$ChatSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$ChatSessionModelImplCopyWith<$Res>
    implements $ChatSessionModelCopyWith<$Res> {
  factory _$$ChatSessionModelImplCopyWith(
    _$ChatSessionModelImpl value,
    $Res Function(_$ChatSessionModelImpl) then,
  ) = __$$ChatSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$ChatSessionModelImplCopyWithImpl<$Res>
    extends _$ChatSessionModelCopyWithImpl<$Res, _$ChatSessionModelImpl>
    implements _$$ChatSessionModelImplCopyWith<$Res> {
  __$$ChatSessionModelImplCopyWithImpl(
    _$ChatSessionModelImpl _value,
    $Res Function(_$ChatSessionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ChatSessionModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$ChatSessionModelImpl implements _ChatSessionModel {
  const _$ChatSessionModelImpl({
    required this.id,
    required this.title,
    this.createdAt,
    this.updatedAt,
  });

  factory _$ChatSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatSessionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ChatSessionModel(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSessionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, createdAt, updatedAt);

  /// Create a copy of ChatSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSessionModelImplCopyWith<_$ChatSessionModelImpl> get copyWith =>
      __$$ChatSessionModelImplCopyWithImpl<_$ChatSessionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatSessionModelImplToJson(this);
  }
}

abstract class _ChatSessionModel implements ChatSessionModel {
  const factory _ChatSessionModel({
    required final String id,
    required final String title,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$ChatSessionModelImpl;

  factory _ChatSessionModel.fromJson(Map<String, dynamic> json) =
      _$ChatSessionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of ChatSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatSessionModelImplCopyWith<_$ChatSessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
