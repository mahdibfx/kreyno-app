// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_exists_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserExistsDto _$UserExistsDtoFromJson(Map<String, dynamic> json) {
  return _UserExistsDto.fromJson(json);
}

/// @nodoc
mixin _$UserExistsDto {
  @JsonKey(name: 'attribute')
  UniqueExistenceId get attribute => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  String get value => throw _privateConstructorUsedError;

  /// Serializes this UserExistsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserExistsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserExistsDtoCopyWith<UserExistsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserExistsDtoCopyWith<$Res> {
  factory $UserExistsDtoCopyWith(
          UserExistsDto value, $Res Function(UserExistsDto) then) =
      _$UserExistsDtoCopyWithImpl<$Res, UserExistsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attribute') UniqueExistenceId attribute,
      @JsonKey(name: 'value') String value});
}

/// @nodoc
class _$UserExistsDtoCopyWithImpl<$Res, $Val extends UserExistsDto>
    implements $UserExistsDtoCopyWith<$Res> {
  _$UserExistsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserExistsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attribute = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as UniqueExistenceId,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserExistsDtoImplCopyWith<$Res>
    implements $UserExistsDtoCopyWith<$Res> {
  factory _$$UserExistsDtoImplCopyWith(
          _$UserExistsDtoImpl value, $Res Function(_$UserExistsDtoImpl) then) =
      __$$UserExistsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attribute') UniqueExistenceId attribute,
      @JsonKey(name: 'value') String value});
}

/// @nodoc
class __$$UserExistsDtoImplCopyWithImpl<$Res>
    extends _$UserExistsDtoCopyWithImpl<$Res, _$UserExistsDtoImpl>
    implements _$$UserExistsDtoImplCopyWith<$Res> {
  __$$UserExistsDtoImplCopyWithImpl(
      _$UserExistsDtoImpl _value, $Res Function(_$UserExistsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserExistsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attribute = null,
    Object? value = null,
  }) {
    return _then(_$UserExistsDtoImpl(
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as UniqueExistenceId,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserExistsDtoImpl implements _UserExistsDto {
  const _$UserExistsDtoImpl(
      {@JsonKey(name: 'attribute') required this.attribute,
      @JsonKey(name: 'value') required this.value});

  factory _$UserExistsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserExistsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'attribute')
  final UniqueExistenceId attribute;
  @override
  @JsonKey(name: 'value')
  final String value;

  @override
  String toString() {
    return 'UserExistsDto(attribute: $attribute, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserExistsDtoImpl &&
            (identical(other.attribute, attribute) ||
                other.attribute == attribute) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attribute, value);

  /// Create a copy of UserExistsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserExistsDtoImplCopyWith<_$UserExistsDtoImpl> get copyWith =>
      __$$UserExistsDtoImplCopyWithImpl<_$UserExistsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserExistsDtoImplToJson(
      this,
    );
  }
}

abstract class _UserExistsDto implements UserExistsDto {
  const factory _UserExistsDto(
      {@JsonKey(name: 'attribute') required final UniqueExistenceId attribute,
      @JsonKey(name: 'value')
      required final String value}) = _$UserExistsDtoImpl;

  factory _UserExistsDto.fromJson(Map<String, dynamic> json) =
      _$UserExistsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'attribute')
  UniqueExistenceId get attribute;
  @override
  @JsonKey(name: 'value')
  String get value;

  /// Create a copy of UserExistsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserExistsDtoImplCopyWith<_$UserExistsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
