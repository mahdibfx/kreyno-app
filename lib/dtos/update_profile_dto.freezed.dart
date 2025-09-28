// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateProfileDto _$UpdateProfileDtoFromJson(Map<String, dynamic> json) {
  return _UpdateProfileDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateProfileDto {
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  DateTime? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;

  /// Serializes this UpdateProfileDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateProfileDtoCopyWith<UpdateProfileDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileDtoCopyWith<$Res> {
  factory $UpdateProfileDtoCopyWith(
          UpdateProfileDto value, $Res Function(UpdateProfileDto) then) =
      _$UpdateProfileDtoCopyWithImpl<$Res, UpdateProfileDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'gender') Gender? gender,
      @JsonKey(name: 'birth_date') DateTime? birthDate,
      @JsonKey(name: 'address') String? address});
}

/// @nodoc
class _$UpdateProfileDtoCopyWithImpl<$Res, $Val extends UpdateProfileDto>
    implements $UpdateProfileDtoCopyWith<$Res> {
  _$UpdateProfileDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? birthDate = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateProfileDtoImplCopyWith<$Res>
    implements $UpdateProfileDtoCopyWith<$Res> {
  factory _$$UpdateProfileDtoImplCopyWith(_$UpdateProfileDtoImpl value,
          $Res Function(_$UpdateProfileDtoImpl) then) =
      __$$UpdateProfileDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'gender') Gender? gender,
      @JsonKey(name: 'birth_date') DateTime? birthDate,
      @JsonKey(name: 'address') String? address});
}

/// @nodoc
class __$$UpdateProfileDtoImplCopyWithImpl<$Res>
    extends _$UpdateProfileDtoCopyWithImpl<$Res, _$UpdateProfileDtoImpl>
    implements _$$UpdateProfileDtoImplCopyWith<$Res> {
  __$$UpdateProfileDtoImplCopyWithImpl(_$UpdateProfileDtoImpl _value,
      $Res Function(_$UpdateProfileDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? birthDate = freezed,
    Object? address = freezed,
  }) {
    return _then(_$UpdateProfileDtoImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateProfileDtoImpl implements _UpdateProfileDto {
  const _$UpdateProfileDtoImpl(
      {@JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'birth_date') this.birthDate,
      @JsonKey(name: 'address') this.address});

  factory _$UpdateProfileDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateProfileDtoImplFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'gender')
  final Gender? gender;
  @override
  @JsonKey(name: 'birth_date')
  final DateTime? birthDate;
  @override
  @JsonKey(name: 'address')
  final String? address;

  @override
  String toString() {
    return 'UpdateProfileDto(firstName: $firstName, lastName: $lastName, email: $email, gender: $gender, birthDate: $birthDate, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileDtoImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstName, lastName, email, gender, birthDate, address);

  /// Create a copy of UpdateProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileDtoImplCopyWith<_$UpdateProfileDtoImpl> get copyWith =>
      __$$UpdateProfileDtoImplCopyWithImpl<_$UpdateProfileDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateProfileDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateProfileDto implements UpdateProfileDto {
  const factory _UpdateProfileDto(
          {@JsonKey(name: 'first_name') final String? firstName,
          @JsonKey(name: 'last_name') final String? lastName,
          @JsonKey(name: 'email') final String? email,
          @JsonKey(name: 'gender') final Gender? gender,
          @JsonKey(name: 'birth_date') final DateTime? birthDate,
          @JsonKey(name: 'address') final String? address}) =
      _$UpdateProfileDtoImpl;

  factory _UpdateProfileDto.fromJson(Map<String, dynamic> json) =
      _$UpdateProfileDtoImpl.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'gender')
  Gender? get gender;
  @override
  @JsonKey(name: 'birth_date')
  DateTime? get birthDate;
  @override
  @JsonKey(name: 'address')
  String? get address;

  /// Create a copy of UpdateProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProfileDtoImplCopyWith<_$UpdateProfileDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
