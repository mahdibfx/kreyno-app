// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_car_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateCarDto _$UpdateCarDtoFromJson(Map<String, dynamic> json) {
  return _UpdateCarDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateCarDto {
  @JsonKey(name: "car_type")
  VehicleType? get vehicleType => throw _privateConstructorUsedError;
  @JsonKey(name: "brand")
  String? get brand => throw _privateConstructorUsedError;
  @JsonKey(name: "model")
  String? get model => throw _privateConstructorUsedError;
  @JsonKey(name: "color")
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: "registration_number")
  String? get registrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "co2_emission")
  String? get co2Emission => throw _privateConstructorUsedError;
  @JsonKey(name: "is_selected")
  bool? get isSelected => throw _privateConstructorUsedError;

  /// Serializes this UpdateCarDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateCarDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateCarDtoCopyWith<UpdateCarDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCarDtoCopyWith<$Res> {
  factory $UpdateCarDtoCopyWith(
          UpdateCarDto value, $Res Function(UpdateCarDto) then) =
      _$UpdateCarDtoCopyWithImpl<$Res, UpdateCarDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "car_type") VehicleType? vehicleType,
      @JsonKey(name: "brand") String? brand,
      @JsonKey(name: "model") String? model,
      @JsonKey(name: "color") String? color,
      @JsonKey(name: "registration_number") String? registrationNumber,
      @JsonKey(name: "co2_emission") String? co2Emission,
      @JsonKey(name: "is_selected") bool? isSelected});
}

/// @nodoc
class _$UpdateCarDtoCopyWithImpl<$Res, $Val extends UpdateCarDto>
    implements $UpdateCarDtoCopyWith<$Res> {
  _$UpdateCarDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateCarDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleType = freezed,
    Object? brand = freezed,
    Object? model = freezed,
    Object? color = freezed,
    Object? registrationNumber = freezed,
    Object? co2Emission = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as VehicleType?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationNumber: freezed == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      co2Emission: freezed == co2Emission
          ? _value.co2Emission
          : co2Emission // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateCarDtoImplCopyWith<$Res>
    implements $UpdateCarDtoCopyWith<$Res> {
  factory _$$UpdateCarDtoImplCopyWith(
          _$UpdateCarDtoImpl value, $Res Function(_$UpdateCarDtoImpl) then) =
      __$$UpdateCarDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "car_type") VehicleType? vehicleType,
      @JsonKey(name: "brand") String? brand,
      @JsonKey(name: "model") String? model,
      @JsonKey(name: "color") String? color,
      @JsonKey(name: "registration_number") String? registrationNumber,
      @JsonKey(name: "co2_emission") String? co2Emission,
      @JsonKey(name: "is_selected") bool? isSelected});
}

/// @nodoc
class __$$UpdateCarDtoImplCopyWithImpl<$Res>
    extends _$UpdateCarDtoCopyWithImpl<$Res, _$UpdateCarDtoImpl>
    implements _$$UpdateCarDtoImplCopyWith<$Res> {
  __$$UpdateCarDtoImplCopyWithImpl(
      _$UpdateCarDtoImpl _value, $Res Function(_$UpdateCarDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateCarDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleType = freezed,
    Object? brand = freezed,
    Object? model = freezed,
    Object? color = freezed,
    Object? registrationNumber = freezed,
    Object? co2Emission = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_$UpdateCarDtoImpl(
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as VehicleType?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationNumber: freezed == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      co2Emission: freezed == co2Emission
          ? _value.co2Emission
          : co2Emission // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateCarDtoImpl implements _UpdateCarDto {
  const _$UpdateCarDtoImpl(
      {@JsonKey(name: "car_type") this.vehicleType,
      @JsonKey(name: "brand") this.brand,
      @JsonKey(name: "model") this.model,
      @JsonKey(name: "color") this.color,
      @JsonKey(name: "registration_number") this.registrationNumber,
      @JsonKey(name: "co2_emission") this.co2Emission,
      @JsonKey(name: "is_selected") this.isSelected});

  factory _$UpdateCarDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateCarDtoImplFromJson(json);

  @override
  @JsonKey(name: "car_type")
  final VehicleType? vehicleType;
  @override
  @JsonKey(name: "brand")
  final String? brand;
  @override
  @JsonKey(name: "model")
  final String? model;
  @override
  @JsonKey(name: "color")
  final String? color;
  @override
  @JsonKey(name: "registration_number")
  final String? registrationNumber;
  @override
  @JsonKey(name: "co2_emission")
  final String? co2Emission;
  @override
  @JsonKey(name: "is_selected")
  final bool? isSelected;

  @override
  String toString() {
    return 'UpdateCarDto(vehicleType: $vehicleType, brand: $brand, model: $model, color: $color, registrationNumber: $registrationNumber, co2Emission: $co2Emission, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCarDtoImpl &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.registrationNumber, registrationNumber) ||
                other.registrationNumber == registrationNumber) &&
            (identical(other.co2Emission, co2Emission) ||
                other.co2Emission == co2Emission) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vehicleType, brand, model, color,
      registrationNumber, co2Emission, isSelected);

  /// Create a copy of UpdateCarDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCarDtoImplCopyWith<_$UpdateCarDtoImpl> get copyWith =>
      __$$UpdateCarDtoImplCopyWithImpl<_$UpdateCarDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateCarDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateCarDto implements UpdateCarDto {
  const factory _UpdateCarDto(
      {@JsonKey(name: "car_type") final VehicleType? vehicleType,
      @JsonKey(name: "brand") final String? brand,
      @JsonKey(name: "model") final String? model,
      @JsonKey(name: "color") final String? color,
      @JsonKey(name: "registration_number") final String? registrationNumber,
      @JsonKey(name: "co2_emission") final String? co2Emission,
      @JsonKey(name: "is_selected")
      final bool? isSelected}) = _$UpdateCarDtoImpl;

  factory _UpdateCarDto.fromJson(Map<String, dynamic> json) =
      _$UpdateCarDtoImpl.fromJson;

  @override
  @JsonKey(name: "car_type")
  VehicleType? get vehicleType;
  @override
  @JsonKey(name: "brand")
  String? get brand;
  @override
  @JsonKey(name: "model")
  String? get model;
  @override
  @JsonKey(name: "color")
  String? get color;
  @override
  @JsonKey(name: "registration_number")
  String? get registrationNumber;
  @override
  @JsonKey(name: "co2_emission")
  String? get co2Emission;
  @override
  @JsonKey(name: "is_selected")
  bool? get isSelected;

  /// Create a copy of UpdateCarDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateCarDtoImplCopyWith<_$UpdateCarDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
