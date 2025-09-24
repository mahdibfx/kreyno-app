// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_car_by_registration_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetCarByRegistrationResponse _$GetCarByRegistrationResponseFromJson(
    Map<String, dynamic> json) {
  return _GetCarByRegistrationResponse.fromJson(json);
}

/// @nodoc
mixin _$GetCarByRegistrationResponse {
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

  /// Serializes this GetCarByRegistrationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetCarByRegistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetCarByRegistrationResponseCopyWith<GetCarByRegistrationResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCarByRegistrationResponseCopyWith<$Res> {
  factory $GetCarByRegistrationResponseCopyWith(
          GetCarByRegistrationResponse value,
          $Res Function(GetCarByRegistrationResponse) then) =
      _$GetCarByRegistrationResponseCopyWithImpl<$Res,
          GetCarByRegistrationResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "brand") String brand,
      @JsonKey(name: "model") String model,
      @JsonKey(name: "color") String color,
      @JsonKey(name: "registration_number") String registrationNumber,
      @JsonKey(name: "co2_emission") String co2Emission});
}

/// @nodoc
class _$GetCarByRegistrationResponseCopyWithImpl<$Res,
        $Val extends GetCarByRegistrationResponse>
    implements $GetCarByRegistrationResponseCopyWith<$Res> {
  _$GetCarByRegistrationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetCarByRegistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = null,
    Object? model = null,
    Object? color = null,
    Object? registrationNumber = null,
    Object? co2Emission = null,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCarByRegistrationResponseImplCopyWith<$Res>
    implements $GetCarByRegistrationResponseCopyWith<$Res> {
  factory _$$GetCarByRegistrationResponseImplCopyWith(
          _$GetCarByRegistrationResponseImpl value,
          $Res Function(_$GetCarByRegistrationResponseImpl) then) =
      __$$GetCarByRegistrationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "brand") String brand,
      @JsonKey(name: "model") String model,
      @JsonKey(name: "color") String color,
      @JsonKey(name: "registration_number") String registrationNumber,
      @JsonKey(name: "co2_emission") String co2Emission});
}

/// @nodoc
class __$$GetCarByRegistrationResponseImplCopyWithImpl<$Res>
    extends _$GetCarByRegistrationResponseCopyWithImpl<$Res,
        _$GetCarByRegistrationResponseImpl>
    implements _$$GetCarByRegistrationResponseImplCopyWith<$Res> {
  __$$GetCarByRegistrationResponseImplCopyWithImpl(
      _$GetCarByRegistrationResponseImpl _value,
      $Res Function(_$GetCarByRegistrationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetCarByRegistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = null,
    Object? model = null,
    Object? color = null,
    Object? registrationNumber = null,
    Object? co2Emission = null,
  }) {
    return _then(_$GetCarByRegistrationResponseImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetCarByRegistrationResponseImpl
    implements _GetCarByRegistrationResponse {
  const _$GetCarByRegistrationResponseImpl(
      {@JsonKey(name: "brand") required this.brand,
      @JsonKey(name: "model") required this.model,
      @JsonKey(name: "color") required this.color,
      @JsonKey(name: "registration_number") required this.registrationNumber,
      @JsonKey(name: "co2_emission") required this.co2Emission});

  factory _$GetCarByRegistrationResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetCarByRegistrationResponseImplFromJson(json);

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
  String toString() {
    return 'GetCarByRegistrationResponse(brand: $brand, model: $model, color: $color, registrationNumber: $registrationNumber, co2Emission: $co2Emission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCarByRegistrationResponseImpl &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.registrationNumber, registrationNumber) ||
                other.registrationNumber == registrationNumber) &&
            (identical(other.co2Emission, co2Emission) ||
                other.co2Emission == co2Emission));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, brand, model, color, registrationNumber, co2Emission);

  /// Create a copy of GetCarByRegistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCarByRegistrationResponseImplCopyWith<
          _$GetCarByRegistrationResponseImpl>
      get copyWith => __$$GetCarByRegistrationResponseImplCopyWithImpl<
          _$GetCarByRegistrationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCarByRegistrationResponseImplToJson(
      this,
    );
  }
}

abstract class _GetCarByRegistrationResponse
    implements GetCarByRegistrationResponse {
  const factory _GetCarByRegistrationResponse(
          {@JsonKey(name: "brand") required final String brand,
          @JsonKey(name: "model") required final String model,
          @JsonKey(name: "color") required final String color,
          @JsonKey(name: "registration_number")
          required final String registrationNumber,
          @JsonKey(name: "co2_emission") required final String co2Emission}) =
      _$GetCarByRegistrationResponseImpl;

  factory _GetCarByRegistrationResponse.fromJson(Map<String, dynamic> json) =
      _$GetCarByRegistrationResponseImpl.fromJson;

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

  /// Create a copy of GetCarByRegistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCarByRegistrationResponseImplCopyWith<
          _$GetCarByRegistrationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
