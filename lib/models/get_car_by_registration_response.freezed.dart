// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_car_by_registration_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetCarByRegistrationResponse {

@JsonKey(name: "brand") String get brand;@JsonKey(name: "model") String get model;@JsonKey(name: "color") String get color;@JsonKey(name: "registration_number") String get registrationNumber;@JsonKey(name: "co2_emission") int get co2Emission;
/// Create a copy of GetCarByRegistrationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCarByRegistrationResponseCopyWith<GetCarByRegistrationResponse> get copyWith => _$GetCarByRegistrationResponseCopyWithImpl<GetCarByRegistrationResponse>(this as GetCarByRegistrationResponse, _$identity);

  /// Serializes this GetCarByRegistrationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCarByRegistrationResponse&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.color, color) || other.color == color)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.co2Emission, co2Emission) || other.co2Emission == co2Emission));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brand,model,color,registrationNumber,co2Emission);

@override
String toString() {
  return 'GetCarByRegistrationResponse(brand: $brand, model: $model, color: $color, registrationNumber: $registrationNumber, co2Emission: $co2Emission)';
}


}

/// @nodoc
abstract mixin class $GetCarByRegistrationResponseCopyWith<$Res>  {
  factory $GetCarByRegistrationResponseCopyWith(GetCarByRegistrationResponse value, $Res Function(GetCarByRegistrationResponse) _then) = _$GetCarByRegistrationResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "brand") String brand,@JsonKey(name: "model") String model,@JsonKey(name: "color") String color,@JsonKey(name: "registration_number") String registrationNumber,@JsonKey(name: "co2_emission") int co2Emission
});




}
/// @nodoc
class _$GetCarByRegistrationResponseCopyWithImpl<$Res>
    implements $GetCarByRegistrationResponseCopyWith<$Res> {
  _$GetCarByRegistrationResponseCopyWithImpl(this._self, this._then);

  final GetCarByRegistrationResponse _self;
  final $Res Function(GetCarByRegistrationResponse) _then;

/// Create a copy of GetCarByRegistrationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? brand = null,Object? model = null,Object? color = null,Object? registrationNumber = null,Object? co2Emission = null,}) {
  return _then(_self.copyWith(
brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,registrationNumber: null == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String,co2Emission: null == co2Emission ? _self.co2Emission : co2Emission // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GetCarByRegistrationResponse].
extension GetCarByRegistrationResponsePatterns on GetCarByRegistrationResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetCarByRegistrationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetCarByRegistrationResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetCarByRegistrationResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetCarByRegistrationResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetCarByRegistrationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetCarByRegistrationResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "brand")  String brand, @JsonKey(name: "model")  String model, @JsonKey(name: "color")  String color, @JsonKey(name: "registration_number")  String registrationNumber, @JsonKey(name: "co2_emission")  int co2Emission)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetCarByRegistrationResponse() when $default != null:
return $default(_that.brand,_that.model,_that.color,_that.registrationNumber,_that.co2Emission);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "brand")  String brand, @JsonKey(name: "model")  String model, @JsonKey(name: "color")  String color, @JsonKey(name: "registration_number")  String registrationNumber, @JsonKey(name: "co2_emission")  int co2Emission)  $default,) {final _that = this;
switch (_that) {
case _GetCarByRegistrationResponse():
return $default(_that.brand,_that.model,_that.color,_that.registrationNumber,_that.co2Emission);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "brand")  String brand, @JsonKey(name: "model")  String model, @JsonKey(name: "color")  String color, @JsonKey(name: "registration_number")  String registrationNumber, @JsonKey(name: "co2_emission")  int co2Emission)?  $default,) {final _that = this;
switch (_that) {
case _GetCarByRegistrationResponse() when $default != null:
return $default(_that.brand,_that.model,_that.color,_that.registrationNumber,_that.co2Emission);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetCarByRegistrationResponse implements GetCarByRegistrationResponse {
  const _GetCarByRegistrationResponse({@JsonKey(name: "brand") required this.brand, @JsonKey(name: "model") required this.model, @JsonKey(name: "color") required this.color, @JsonKey(name: "registration_number") required this.registrationNumber, @JsonKey(name: "co2_emission") required this.co2Emission});
  factory _GetCarByRegistrationResponse.fromJson(Map<String, dynamic> json) => _$GetCarByRegistrationResponseFromJson(json);

@override@JsonKey(name: "brand") final  String brand;
@override@JsonKey(name: "model") final  String model;
@override@JsonKey(name: "color") final  String color;
@override@JsonKey(name: "registration_number") final  String registrationNumber;
@override@JsonKey(name: "co2_emission") final  int co2Emission;

/// Create a copy of GetCarByRegistrationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCarByRegistrationResponseCopyWith<_GetCarByRegistrationResponse> get copyWith => __$GetCarByRegistrationResponseCopyWithImpl<_GetCarByRegistrationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetCarByRegistrationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCarByRegistrationResponse&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.color, color) || other.color == color)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.co2Emission, co2Emission) || other.co2Emission == co2Emission));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brand,model,color,registrationNumber,co2Emission);

@override
String toString() {
  return 'GetCarByRegistrationResponse(brand: $brand, model: $model, color: $color, registrationNumber: $registrationNumber, co2Emission: $co2Emission)';
}


}

/// @nodoc
abstract mixin class _$GetCarByRegistrationResponseCopyWith<$Res> implements $GetCarByRegistrationResponseCopyWith<$Res> {
  factory _$GetCarByRegistrationResponseCopyWith(_GetCarByRegistrationResponse value, $Res Function(_GetCarByRegistrationResponse) _then) = __$GetCarByRegistrationResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "brand") String brand,@JsonKey(name: "model") String model,@JsonKey(name: "color") String color,@JsonKey(name: "registration_number") String registrationNumber,@JsonKey(name: "co2_emission") int co2Emission
});




}
/// @nodoc
class __$GetCarByRegistrationResponseCopyWithImpl<$Res>
    implements _$GetCarByRegistrationResponseCopyWith<$Res> {
  __$GetCarByRegistrationResponseCopyWithImpl(this._self, this._then);

  final _GetCarByRegistrationResponse _self;
  final $Res Function(_GetCarByRegistrationResponse) _then;

/// Create a copy of GetCarByRegistrationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? brand = null,Object? model = null,Object? color = null,Object? registrationNumber = null,Object? co2Emission = null,}) {
  return _then(_GetCarByRegistrationResponse(
brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,registrationNumber: null == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String,co2Emission: null == co2Emission ? _self.co2Emission : co2Emission // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
