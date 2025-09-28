// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_car_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateCarDto _$CreateCarDtoFromJson(Map<String, dynamic> json) {
  return _CreateCarDto.fromJson(json);
}

/// @nodoc
mixin _$CreateCarDto {
  @JsonKey(name: "car_type")
  VehicleType get vehicleType => throw _privateConstructorUsedError;
  @JsonKey(name: "brand")
  String get brand => throw _privateConstructorUsedError;
  @JsonKey(name: "model")
  String get model => throw _privateConstructorUsedError;
  @JsonKey(name: "color")
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: "registration_number")
  String get registrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "co2_emission")
  String get co2Emission => throw _privateConstructorUsedError;
  @JsonKey(name: "is_selected")
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this CreateCarDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateCarDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateCarDtoCopyWith<CreateCarDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCarDtoCopyWith<$Res> {
  factory $CreateCarDtoCopyWith(
          CreateCarDto value, $Res Function(CreateCarDto) then) =
      _$CreateCarDtoCopyWithImpl<$Res, CreateCarDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "car_type") VehicleType vehicleType,
      @JsonKey(name: "brand") String brand,
      @JsonKey(name: "model") String model,
      @JsonKey(name: "color") String color,
      @JsonKey(name: "registration_number") String registrationNumber,
      @JsonKey(name: "co2_emission") String co2Emission,
      @JsonKey(name: "is_selected") bool isSelected});
}

/// @nodoc
class _$CreateCarDtoCopyWithImpl<$Res, $Val extends CreateCarDto>
    implements $CreateCarDtoCopyWith<$Res> {
  _$CreateCarDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateCarDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleType = null,
    Object? brand = null,
    Object? model = null,
    Object? color = null,
    Object? registrationNumber = null,
    Object? co2Emission = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as VehicleType,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      co2Emission: null == co2Emission
          ? _value.co2Emission
          : co2Emission // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateCarDtoImplCopyWith<$Res>
    implements $CreateCarDtoCopyWith<$Res> {
  factory _$$CreateCarDtoImplCopyWith(
          _$CreateCarDtoImpl value, $Res Function(_$CreateCarDtoImpl) then) =
      __$$CreateCarDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "car_type") VehicleType vehicleType,
      @JsonKey(name: "brand") String brand,
      @JsonKey(name: "model") String model,
      @JsonKey(name: "color") String color,
      @JsonKey(name: "registration_number") String registrationNumber,
      @JsonKey(name: "co2_emission") String co2Emission,
      @JsonKey(name: "is_selected") bool isSelected});
}

/// @nodoc
class __$$CreateCarDtoImplCopyWithImpl<$Res>
    extends _$CreateCarDtoCopyWithImpl<$Res, _$CreateCarDtoImpl>
    implements _$$CreateCarDtoImplCopyWith<$Res> {
  __$$CreateCarDtoImplCopyWithImpl(
      _$CreateCarDtoImpl _value, $Res Function(_$CreateCarDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateCarDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleType = null,
    Object? brand = null,
    Object? model = null,
    Object? color = null,
    Object? registrationNumber = null,
    Object? co2Emission = null,
    Object? isSelected = null,
  }) {
    return _then(_$CreateCarDtoImpl(
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as VehicleType,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      co2Emission: null == co2Emission
          ? _value.co2Emission
          : co2Emission // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateCarDtoImpl implements _CreateCarDto {
  const _$CreateCarDtoImpl(
      {@JsonKey(name: "car_type") required this.vehicleType,
      @JsonKey(name: "brand") required this.brand,
      @JsonKey(name: "model") required this.model,
      @JsonKey(name: "color") required this.color,
      @JsonKey(name: "registration_number") required this.registrationNumber,
      @JsonKey(name: "co2_emission") required this.co2Emission,
      @JsonKey(name: "is_selected") this.isSelected = false});

  factory _$CreateCarDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateCarDtoImplFromJson(json);

  @override
  @JsonKey(name: "car_type")
  final VehicleType vehicleType;
  @override
  @JsonKey(name: "brand")
  final String brand;
  @override
  @JsonKey(name: "model")
  final String model;
  @override
  @JsonKey(name: "color")
  final String color;
  @override
  @JsonKey(name: "registration_number")
  final String registrationNumber;
  @override
  @JsonKey(name: "co2_emission")
  final String co2Emission;
  @override
  @JsonKey(name: "is_selected")
  final bool isSelected;

  @override
  String toString() {
    return 'CreateCarDto(vehicleType: $vehicleType, brand: $brand, model: $model, color: $color, registrationNumber: $registrationNumber, co2Emission: $co2Emission, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCarDtoImpl &&
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

  /// Create a copy of CreateCarDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCarDtoImplCopyWith<_$CreateCarDtoImpl> get copyWith =>
      __$$CreateCarDtoImplCopyWithImpl<_$CreateCarDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateCarDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateCarDto implements CreateCarDto {
  const factory _CreateCarDto(
          {@JsonKey(name: "car_type") required final VehicleType vehicleType,
          @JsonKey(name: "brand") required final String brand,
          @JsonKey(name: "model") required final String model,
          @JsonKey(name: "color") required final String color,
          @JsonKey(name: "registration_number")
          required final String registrationNumber,
          @JsonKey(name: "co2_emission") required final String co2Emission,
          @JsonKey(name: "is_selected") final bool isSelected}) =
      _$CreateCarDtoImpl;

  factory _CreateCarDto.fromJson(Map<String, dynamic> json) =
      _$CreateCarDtoImpl.fromJson;

  @override
  @JsonKey(name: "car_type")
  VehicleType get vehicleType;
  @override
  @JsonKey(name: "brand")
  String get brand;
  @override
  @JsonKey(name: "model")
  String get model;
  @override
  @JsonKey(name: "color")
  String get color;
  @override
  @JsonKey(name: "registration_number")
  String get registrationNumber;
  @override
  @JsonKey(name: "co2_emission")
  String get co2Emission;
  @override
  @JsonKey(name: "is_selected")
  bool get isSelected;

  /// Create a copy of CreateCarDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateCarDtoImplCopyWith<_$CreateCarDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
