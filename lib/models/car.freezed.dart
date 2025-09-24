// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Car {

@JsonKey(name: "car_type") VehicleType get vehicleType;@JsonKey(name: "brand") String get brand;@JsonKey(name: "model") String get model;@JsonKey(name: "color") String get color;@JsonKey(name: "registration_number") String get registrationNumber;@JsonKey(name: "co2_emission") String get co2Emission;@JsonKey(name: "is_selected") bool get isSelected;
/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarCopyWith<Car> get copyWith => _$CarCopyWithImpl<Car>(this as Car, _$identity);

  /// Serializes this Car to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Car&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.color, color) || other.color == color)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.co2Emission, co2Emission) || other.co2Emission == co2Emission)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleType,brand,model,color,registrationNumber,co2Emission,isSelected);

@override
String toString() {
  return 'Car(vehicleType: $vehicleType, brand: $brand, model: $model, color: $color, registrationNumber: $registrationNumber, co2Emission: $co2Emission, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class $CarCopyWith<$Res>  {
  factory $CarCopyWith(Car value, $Res Function(Car) _then) = _$CarCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "car_type") VehicleType vehicleType,@JsonKey(name: "brand") String brand,@JsonKey(name: "model") String model,@JsonKey(name: "color") String color,@JsonKey(name: "registration_number") String registrationNumber,@JsonKey(name: "co2_emission") String co2Emission,@JsonKey(name: "is_selected") bool isSelected
});




}
/// @nodoc
class _$CarCopyWithImpl<$Res>
    implements $CarCopyWith<$Res> {
  _$CarCopyWithImpl(this._self, this._then);

  final Car _self;
  final $Res Function(Car) _then;

/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicleType = null,Object? brand = null,Object? model = null,Object? color = null,Object? registrationNumber = null,Object? co2Emission = null,Object? isSelected = null,}) {
  return _then(_self.copyWith(
vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,registrationNumber: null == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String,co2Emission: null == co2Emission ? _self.co2Emission : co2Emission // ignore: cast_nullable_to_non_nullable
as String,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Car].
extension CarPatterns on Car {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Car value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Car() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Car value)  $default,){
final _that = this;
switch (_that) {
case _Car():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Car value)?  $default,){
final _that = this;
switch (_that) {
case _Car() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "car_type")  VehicleType vehicleType, @JsonKey(name: "brand")  String brand, @JsonKey(name: "model")  String model, @JsonKey(name: "color")  String color, @JsonKey(name: "registration_number")  String registrationNumber, @JsonKey(name: "co2_emission")  String co2Emission, @JsonKey(name: "is_selected")  bool isSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Car() when $default != null:
return $default(_that.vehicleType,_that.brand,_that.model,_that.color,_that.registrationNumber,_that.co2Emission,_that.isSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "car_type")  VehicleType vehicleType, @JsonKey(name: "brand")  String brand, @JsonKey(name: "model")  String model, @JsonKey(name: "color")  String color, @JsonKey(name: "registration_number")  String registrationNumber, @JsonKey(name: "co2_emission")  String co2Emission, @JsonKey(name: "is_selected")  bool isSelected)  $default,) {final _that = this;
switch (_that) {
case _Car():
return $default(_that.vehicleType,_that.brand,_that.model,_that.color,_that.registrationNumber,_that.co2Emission,_that.isSelected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "car_type")  VehicleType vehicleType, @JsonKey(name: "brand")  String brand, @JsonKey(name: "model")  String model, @JsonKey(name: "color")  String color, @JsonKey(name: "registration_number")  String registrationNumber, @JsonKey(name: "co2_emission")  String co2Emission, @JsonKey(name: "is_selected")  bool isSelected)?  $default,) {final _that = this;
switch (_that) {
case _Car() when $default != null:
return $default(_that.vehicleType,_that.brand,_that.model,_that.color,_that.registrationNumber,_that.co2Emission,_that.isSelected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Car implements Car {
  const _Car({@JsonKey(name: "car_type") required this.vehicleType, @JsonKey(name: "brand") required this.brand, @JsonKey(name: "model") required this.model, @JsonKey(name: "color") required this.color, @JsonKey(name: "registration_number") required this.registrationNumber, @JsonKey(name: "co2_emission") required this.co2Emission, @JsonKey(name: "is_selected") this.isSelected = false});
  factory _Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

@override@JsonKey(name: "car_type") final  VehicleType vehicleType;
@override@JsonKey(name: "brand") final  String brand;
@override@JsonKey(name: "model") final  String model;
@override@JsonKey(name: "color") final  String color;
@override@JsonKey(name: "registration_number") final  String registrationNumber;
@override@JsonKey(name: "co2_emission") final  String co2Emission;
@override@JsonKey(name: "is_selected") final  bool isSelected;

/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarCopyWith<_Car> get copyWith => __$CarCopyWithImpl<_Car>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Car&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.color, color) || other.color == color)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.co2Emission, co2Emission) || other.co2Emission == co2Emission)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vehicleType,brand,model,color,registrationNumber,co2Emission,isSelected);

@override
String toString() {
  return 'Car(vehicleType: $vehicleType, brand: $brand, model: $model, color: $color, registrationNumber: $registrationNumber, co2Emission: $co2Emission, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$CarCopyWith<$Res> implements $CarCopyWith<$Res> {
  factory _$CarCopyWith(_Car value, $Res Function(_Car) _then) = __$CarCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "car_type") VehicleType vehicleType,@JsonKey(name: "brand") String brand,@JsonKey(name: "model") String model,@JsonKey(name: "color") String color,@JsonKey(name: "registration_number") String registrationNumber,@JsonKey(name: "co2_emission") String co2Emission,@JsonKey(name: "is_selected") bool isSelected
});




}
/// @nodoc
class __$CarCopyWithImpl<$Res>
    implements _$CarCopyWith<$Res> {
  __$CarCopyWithImpl(this._self, this._then);

  final _Car _self;
  final $Res Function(_Car) _then;

/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicleType = null,Object? brand = null,Object? model = null,Object? color = null,Object? registrationNumber = null,Object? co2Emission = null,Object? isSelected = null,}) {
  return _then(_Car(
vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,registrationNumber: null == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String,co2Emission: null == co2Emission ? _self.co2Emission : co2Emission // ignore: cast_nullable_to_non_nullable
as String,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
