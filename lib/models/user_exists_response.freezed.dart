// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_exists_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserExistsResponse _$UserExistsResponseFromJson(Map<String, dynamic> json) {
  return _UserExistsResponse.fromJson(json);
}

/// @nodoc
mixin _$UserExistsResponse {
  @JsonKey(name: 'exists')
  bool get exists => throw _privateConstructorUsedError;

  /// Serializes this UserExistsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserExistsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserExistsResponseCopyWith<UserExistsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserExistsResponseCopyWith<$Res> {
  factory $UserExistsResponseCopyWith(
          UserExistsResponse value, $Res Function(UserExistsResponse) then) =
      _$UserExistsResponseCopyWithImpl<$Res, UserExistsResponse>;
  @useResult
  $Res call({@JsonKey(name: 'exists') bool exists});
}

/// @nodoc
class _$UserExistsResponseCopyWithImpl<$Res, $Val extends UserExistsResponse>
    implements $UserExistsResponseCopyWith<$Res> {
  _$UserExistsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserExistsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exists = null,
  }) {
    return _then(_value.copyWith(
      exists: null == exists
          ? _value.exists
          : exists // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserExistsResponseImplCopyWith<$Res>
    implements $UserExistsResponseCopyWith<$Res> {
  factory _$$UserExistsResponseImplCopyWith(_$UserExistsResponseImpl value,
          $Res Function(_$UserExistsResponseImpl) then) =
      __$$UserExistsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'exists') bool exists});
}

/// @nodoc
class __$$UserExistsResponseImplCopyWithImpl<$Res>
    extends _$UserExistsResponseCopyWithImpl<$Res, _$UserExistsResponseImpl>
    implements _$$UserExistsResponseImplCopyWith<$Res> {
  __$$UserExistsResponseImplCopyWithImpl(_$UserExistsResponseImpl _value,
      $Res Function(_$UserExistsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserExistsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exists = null,
  }) {
    return _then(_$UserExistsResponseImpl(
      exists: null == exists
          ? _value.exists
          : exists // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserExistsResponseImpl implements _UserExistsResponse {
  const _$UserExistsResponseImpl(
      {@JsonKey(name: 'exists') required this.exists});

  factory _$UserExistsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserExistsResponseImplFromJson(json);

  @override
  @JsonKey(name: 'exists')
  final bool exists;

  @override
  String toString() {
    return 'UserExistsResponse(exists: $exists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserExistsResponseImpl &&
            (identical(other.exists, exists) || other.exists == exists));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, exists);

  /// Create a copy of UserExistsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserExistsResponseImplCopyWith<_$UserExistsResponseImpl> get copyWith =>
      __$$UserExistsResponseImplCopyWithImpl<_$UserExistsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserExistsResponseImplToJson(
      this,
    );
  }
}

abstract class _UserExistsResponse implements UserExistsResponse {
  const factory _UserExistsResponse(
          {@JsonKey(name: 'exists') required final bool exists}) =
      _$UserExistsResponseImpl;

  factory _UserExistsResponse.fromJson(Map<String, dynamic> json) =
      _$UserExistsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'exists')
  bool get exists;

  /// Create a copy of UserExistsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserExistsResponseImplCopyWith<_$UserExistsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
