// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Car _$CarFromJson(Map<String, dynamic> json) {
  return _Car.fromJson(json);
}

/// @nodoc
mixin _$Car {
// @JsonKey(name: "id") required int id,
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

  /// Serializes this Car to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Car
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarCopyWith<Car> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarCopyWith<$Res> {
  factory $CarCopyWith(Car value, $Res Function(Car) then) =
      _$CarCopyWithImpl<$Res, Car>;
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
class _$CarCopyWithImpl<$Res, $Val extends Car> implements $CarCopyWith<$Res> {
  _$CarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Car
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
abstract class _$$CarImplCopyWith<$Res> implements $CarCopyWith<$Res> {
  factory _$$CarImplCopyWith(_$CarImpl value, $Res Function(_$CarImpl) then) =
      __$$CarImplCopyWithImpl<$Res>;
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
class __$$CarImplCopyWithImpl<$Res> extends _$CarCopyWithImpl<$Res, _$CarImpl>
    implements _$$CarImplCopyWith<$Res> {
  __$$CarImplCopyWithImpl(_$CarImpl _value, $Res Function(_$CarImpl) _then)
      : super(_value, _then);

  /// Create a copy of Car
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
    return _then(_$CarImpl(
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
class _$CarImpl implements _Car {
  const _$CarImpl(
      {@JsonKey(name: "car_type") required this.vehicleType,
      @JsonKey(name: "brand") required this.brand,
      @JsonKey(name: "model") required this.model,
      @JsonKey(name: "color") required this.color,
      @JsonKey(name: "registration_number") required this.registrationNumber,
      @JsonKey(name: "co2_emission") required this.co2Emission,
      @JsonKey(name: "is_selected") this.isSelected = false});

  factory _$CarImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarImplFromJson(json);

// @JsonKey(name: "id") required int id,
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
    return 'Car(vehicleType: $vehicleType, brand: $brand, model: $model, color: $color, registrationNumber: $registrationNumber, co2Emission: $co2Emission, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarImpl &&
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

  /// Create a copy of Car
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarImplCopyWith<_$CarImpl> get copyWith =>
      __$$CarImplCopyWithImpl<_$CarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarImplToJson(
      this,
    );
  }
}

abstract class _Car implements Car {
  const factory _Car(
      {@JsonKey(name: "car_type") required final VehicleType vehicleType,
      @JsonKey(name: "brand") required final String brand,
      @JsonKey(name: "model") required final String model,
      @JsonKey(name: "color") required final String color,
      @JsonKey(name: "registration_number")
      required final String registrationNumber,
      @JsonKey(name: "co2_emission") required final String co2Emission,
      @JsonKey(name: "is_selected") final bool isSelected}) = _$CarImpl;

  factory _Car.fromJson(Map<String, dynamic> json) = _$CarImpl.fromJson;

// @JsonKey(name: "id") required int id,
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

  /// Create a copy of Car
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarImplCopyWith<_$CarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
