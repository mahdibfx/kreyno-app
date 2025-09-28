// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendOtpDto _$SendOtpDtoFromJson(Map<String, dynamic> json) {
  return _SendOtpDto.fromJson(json);
}

/// @nodoc
mixin _$SendOtpDto {
  @JsonKey(name: 'phone')
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this SendOtpDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendOtpDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendOtpDtoCopyWith<SendOtpDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOtpDtoCopyWith<$Res> {
  factory $SendOtpDtoCopyWith(
          SendOtpDto value, $Res Function(SendOtpDto) then) =
      _$SendOtpDtoCopyWithImpl<$Res, SendOtpDto>;
  @useResult
  $Res call({@JsonKey(name: 'phone') String phoneNumber});
}

/// @nodoc
class _$SendOtpDtoCopyWithImpl<$Res, $Val extends SendOtpDto>
    implements $SendOtpDtoCopyWith<$Res> {
  _$SendOtpDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendOtpDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendOtpDtoImplCopyWith<$Res>
    implements $SendOtpDtoCopyWith<$Res> {
  factory _$$SendOtpDtoImplCopyWith(
          _$SendOtpDtoImpl value, $Res Function(_$SendOtpDtoImpl) then) =
      __$$SendOtpDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'phone') String phoneNumber});
}

/// @nodoc
class __$$SendOtpDtoImplCopyWithImpl<$Res>
    extends _$SendOtpDtoCopyWithImpl<$Res, _$SendOtpDtoImpl>
    implements _$$SendOtpDtoImplCopyWith<$Res> {
  __$$SendOtpDtoImplCopyWithImpl(
      _$SendOtpDtoImpl _value, $Res Function(_$SendOtpDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendOtpDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$SendOtpDtoImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendOtpDtoImpl implements _SendOtpDto {
  const _$SendOtpDtoImpl({@JsonKey(name: 'phone') required this.phoneNumber});

  factory _$SendOtpDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendOtpDtoImplFromJson(json);

  @override
  @JsonKey(name: 'phone')
  final String phoneNumber;

  @override
  String toString() {
    return 'SendOtpDto(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpDtoImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of SendOtpDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpDtoImplCopyWith<_$SendOtpDtoImpl> get copyWith =>
      __$$SendOtpDtoImplCopyWithImpl<_$SendOtpDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendOtpDtoImplToJson(
      this,
    );
  }
}

abstract class _SendOtpDto implements SendOtpDto {
  const factory _SendOtpDto(
          {@JsonKey(name: 'phone') required final String phoneNumber}) =
      _$SendOtpDtoImpl;

  factory _SendOtpDto.fromJson(Map<String, dynamic> json) =
      _$SendOtpDtoImpl.fromJson;

  @override
  @JsonKey(name: 'phone')
  String get phoneNumber;

  /// Create a copy of SendOtpDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOtpDtoImplCopyWith<_$SendOtpDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
