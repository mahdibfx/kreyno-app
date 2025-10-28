// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_parking_spot_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateParkingSpotDto {

@JsonKey(name: "latitude") double get latitude;@JsonKey(name: "longitude") double get longitude;@JsonKey(name: "address") String get address;@JsonKey(name: "price") double get price;@JsonKey(name: "electric_charge_station") bool get electricChargeStation;
/// Create a copy of CreateParkingSpotDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateParkingSpotDtoCopyWith<CreateParkingSpotDto> get copyWith => _$CreateParkingSpotDtoCopyWithImpl<CreateParkingSpotDto>(this as CreateParkingSpotDto, _$identity);

  /// Serializes this CreateParkingSpotDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateParkingSpotDto&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address)&&(identical(other.price, price) || other.price == price)&&(identical(other.electricChargeStation, electricChargeStation) || other.electricChargeStation == electricChargeStation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,address,price,electricChargeStation);

@override
String toString() {
  return 'CreateParkingSpotDto(latitude: $latitude, longitude: $longitude, address: $address, price: $price, electricChargeStation: $electricChargeStation)';
}


}

/// @nodoc
abstract mixin class $CreateParkingSpotDtoCopyWith<$Res>  {
  factory $CreateParkingSpotDtoCopyWith(CreateParkingSpotDto value, $Res Function(CreateParkingSpotDto) _then) = _$CreateParkingSpotDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "latitude") double latitude,@JsonKey(name: "longitude") double longitude,@JsonKey(name: "address") String address,@JsonKey(name: "price") double price,@JsonKey(name: "electric_charge_station") bool electricChargeStation
});




}
/// @nodoc
class _$CreateParkingSpotDtoCopyWithImpl<$Res>
    implements $CreateParkingSpotDtoCopyWith<$Res> {
  _$CreateParkingSpotDtoCopyWithImpl(this._self, this._then);

  final CreateParkingSpotDto _self;
  final $Res Function(CreateParkingSpotDto) _then;

/// Create a copy of CreateParkingSpotDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? address = null,Object? price = null,Object? electricChargeStation = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,electricChargeStation: null == electricChargeStation ? _self.electricChargeStation : electricChargeStation // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateParkingSpotDto].
extension CreateParkingSpotDtoPatterns on CreateParkingSpotDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateParkingSpotDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateParkingSpotDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateParkingSpotDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateParkingSpotDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateParkingSpotDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateParkingSpotDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "latitude")  double latitude, @JsonKey(name: "longitude")  double longitude, @JsonKey(name: "address")  String address, @JsonKey(name: "price")  double price, @JsonKey(name: "electric_charge_station")  bool electricChargeStation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateParkingSpotDto() when $default != null:
return $default(_that.latitude,_that.longitude,_that.address,_that.price,_that.electricChargeStation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "latitude")  double latitude, @JsonKey(name: "longitude")  double longitude, @JsonKey(name: "address")  String address, @JsonKey(name: "price")  double price, @JsonKey(name: "electric_charge_station")  bool electricChargeStation)  $default,) {final _that = this;
switch (_that) {
case _CreateParkingSpotDto():
return $default(_that.latitude,_that.longitude,_that.address,_that.price,_that.electricChargeStation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "latitude")  double latitude, @JsonKey(name: "longitude")  double longitude, @JsonKey(name: "address")  String address, @JsonKey(name: "price")  double price, @JsonKey(name: "electric_charge_station")  bool electricChargeStation)?  $default,) {final _that = this;
switch (_that) {
case _CreateParkingSpotDto() when $default != null:
return $default(_that.latitude,_that.longitude,_that.address,_that.price,_that.electricChargeStation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateParkingSpotDto implements CreateParkingSpotDto {
  const _CreateParkingSpotDto({@JsonKey(name: "latitude") required this.latitude, @JsonKey(name: "longitude") required this.longitude, @JsonKey(name: "address") required this.address, @JsonKey(name: "price") required this.price, @JsonKey(name: "electric_charge_station") required this.electricChargeStation});
  factory _CreateParkingSpotDto.fromJson(Map<String, dynamic> json) => _$CreateParkingSpotDtoFromJson(json);

@override@JsonKey(name: "latitude") final  double latitude;
@override@JsonKey(name: "longitude") final  double longitude;
@override@JsonKey(name: "address") final  String address;
@override@JsonKey(name: "price") final  double price;
@override@JsonKey(name: "electric_charge_station") final  bool electricChargeStation;

/// Create a copy of CreateParkingSpotDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateParkingSpotDtoCopyWith<_CreateParkingSpotDto> get copyWith => __$CreateParkingSpotDtoCopyWithImpl<_CreateParkingSpotDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateParkingSpotDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateParkingSpotDto&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address)&&(identical(other.price, price) || other.price == price)&&(identical(other.electricChargeStation, electricChargeStation) || other.electricChargeStation == electricChargeStation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,address,price,electricChargeStation);

@override
String toString() {
  return 'CreateParkingSpotDto(latitude: $latitude, longitude: $longitude, address: $address, price: $price, electricChargeStation: $electricChargeStation)';
}


}

/// @nodoc
abstract mixin class _$CreateParkingSpotDtoCopyWith<$Res> implements $CreateParkingSpotDtoCopyWith<$Res> {
  factory _$CreateParkingSpotDtoCopyWith(_CreateParkingSpotDto value, $Res Function(_CreateParkingSpotDto) _then) = __$CreateParkingSpotDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "latitude") double latitude,@JsonKey(name: "longitude") double longitude,@JsonKey(name: "address") String address,@JsonKey(name: "price") double price,@JsonKey(name: "electric_charge_station") bool electricChargeStation
});




}
/// @nodoc
class __$CreateParkingSpotDtoCopyWithImpl<$Res>
    implements _$CreateParkingSpotDtoCopyWith<$Res> {
  __$CreateParkingSpotDtoCopyWithImpl(this._self, this._then);

  final _CreateParkingSpotDto _self;
  final $Res Function(_CreateParkingSpotDto) _then;

/// Create a copy of CreateParkingSpotDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? address = null,Object? price = null,Object? electricChargeStation = null,}) {
  return _then(_CreateParkingSpotDto(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,electricChargeStation: null == electricChargeStation ? _self.electricChargeStation : electricChargeStation // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
