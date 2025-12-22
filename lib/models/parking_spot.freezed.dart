// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_spot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParkingSpot {

@JsonKey(name: "id") int get id;@JsonKey(name: "address") String get address;@JsonKey(name: "longitude") double get longitude;@JsonKey(name: "latitude") double get latitude;@JsonKey(name: "geohash") String get geoHash;@JsonKey(name: "price") double get price;@JsonKey(name: "total_paid_price") double get totalPaidPrice;@JsonKey(name: "electric_charge_station") bool get electricChargeStation;@JsonKey(name: "reserved") bool get reserved;@JsonKey(name: "seller") Seller? get seller;@JsonKey(name: "validated_at") DateTime? get validatedAt;@JsonKey(name: "created_at") DateTime get createdAt;
/// Create a copy of ParkingSpot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingSpotCopyWith<ParkingSpot> get copyWith => _$ParkingSpotCopyWithImpl<ParkingSpot>(this as ParkingSpot, _$identity);

  /// Serializes this ParkingSpot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingSpot&&(identical(other.id, id) || other.id == id)&&(identical(other.address, address) || other.address == address)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.geoHash, geoHash) || other.geoHash == geoHash)&&(identical(other.price, price) || other.price == price)&&(identical(other.totalPaidPrice, totalPaidPrice) || other.totalPaidPrice == totalPaidPrice)&&(identical(other.electricChargeStation, electricChargeStation) || other.electricChargeStation == electricChargeStation)&&(identical(other.reserved, reserved) || other.reserved == reserved)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.validatedAt, validatedAt) || other.validatedAt == validatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,address,longitude,latitude,geoHash,price,totalPaidPrice,electricChargeStation,reserved,seller,validatedAt,createdAt);

@override
String toString() {
  return 'ParkingSpot(id: $id, address: $address, longitude: $longitude, latitude: $latitude, geoHash: $geoHash, price: $price, totalPaidPrice: $totalPaidPrice, electricChargeStation: $electricChargeStation, reserved: $reserved, seller: $seller, validatedAt: $validatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ParkingSpotCopyWith<$Res>  {
  factory $ParkingSpotCopyWith(ParkingSpot value, $Res Function(ParkingSpot) _then) = _$ParkingSpotCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "address") String address,@JsonKey(name: "longitude") double longitude,@JsonKey(name: "latitude") double latitude,@JsonKey(name: "geohash") String geoHash,@JsonKey(name: "price") double price,@JsonKey(name: "total_paid_price") double totalPaidPrice,@JsonKey(name: "electric_charge_station") bool electricChargeStation,@JsonKey(name: "reserved") bool reserved,@JsonKey(name: "seller") Seller? seller,@JsonKey(name: "validated_at") DateTime? validatedAt,@JsonKey(name: "created_at") DateTime createdAt
});


$SellerCopyWith<$Res>? get seller;

}
/// @nodoc
class _$ParkingSpotCopyWithImpl<$Res>
    implements $ParkingSpotCopyWith<$Res> {
  _$ParkingSpotCopyWithImpl(this._self, this._then);

  final ParkingSpot _self;
  final $Res Function(ParkingSpot) _then;

/// Create a copy of ParkingSpot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? address = null,Object? longitude = null,Object? latitude = null,Object? geoHash = null,Object? price = null,Object? totalPaidPrice = null,Object? electricChargeStation = null,Object? reserved = null,Object? seller = freezed,Object? validatedAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,geoHash: null == geoHash ? _self.geoHash : geoHash // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,totalPaidPrice: null == totalPaidPrice ? _self.totalPaidPrice : totalPaidPrice // ignore: cast_nullable_to_non_nullable
as double,electricChargeStation: null == electricChargeStation ? _self.electricChargeStation : electricChargeStation // ignore: cast_nullable_to_non_nullable
as bool,reserved: null == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as bool,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as Seller?,validatedAt: freezed == validatedAt ? _self.validatedAt : validatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of ParkingSpot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $SellerCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}


/// Adds pattern-matching-related methods to [ParkingSpot].
extension ParkingSpotPatterns on ParkingSpot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParkingSpot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParkingSpot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParkingSpot value)  $default,){
final _that = this;
switch (_that) {
case _ParkingSpot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParkingSpot value)?  $default,){
final _that = this;
switch (_that) {
case _ParkingSpot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "address")  String address, @JsonKey(name: "longitude")  double longitude, @JsonKey(name: "latitude")  double latitude, @JsonKey(name: "geohash")  String geoHash, @JsonKey(name: "price")  double price, @JsonKey(name: "total_paid_price")  double totalPaidPrice, @JsonKey(name: "electric_charge_station")  bool electricChargeStation, @JsonKey(name: "reserved")  bool reserved, @JsonKey(name: "seller")  Seller? seller, @JsonKey(name: "validated_at")  DateTime? validatedAt, @JsonKey(name: "created_at")  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParkingSpot() when $default != null:
return $default(_that.id,_that.address,_that.longitude,_that.latitude,_that.geoHash,_that.price,_that.totalPaidPrice,_that.electricChargeStation,_that.reserved,_that.seller,_that.validatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "address")  String address, @JsonKey(name: "longitude")  double longitude, @JsonKey(name: "latitude")  double latitude, @JsonKey(name: "geohash")  String geoHash, @JsonKey(name: "price")  double price, @JsonKey(name: "total_paid_price")  double totalPaidPrice, @JsonKey(name: "electric_charge_station")  bool electricChargeStation, @JsonKey(name: "reserved")  bool reserved, @JsonKey(name: "seller")  Seller? seller, @JsonKey(name: "validated_at")  DateTime? validatedAt, @JsonKey(name: "created_at")  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ParkingSpot():
return $default(_that.id,_that.address,_that.longitude,_that.latitude,_that.geoHash,_that.price,_that.totalPaidPrice,_that.electricChargeStation,_that.reserved,_that.seller,_that.validatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "address")  String address, @JsonKey(name: "longitude")  double longitude, @JsonKey(name: "latitude")  double latitude, @JsonKey(name: "geohash")  String geoHash, @JsonKey(name: "price")  double price, @JsonKey(name: "total_paid_price")  double totalPaidPrice, @JsonKey(name: "electric_charge_station")  bool electricChargeStation, @JsonKey(name: "reserved")  bool reserved, @JsonKey(name: "seller")  Seller? seller, @JsonKey(name: "validated_at")  DateTime? validatedAt, @JsonKey(name: "created_at")  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ParkingSpot() when $default != null:
return $default(_that.id,_that.address,_that.longitude,_that.latitude,_that.geoHash,_that.price,_that.totalPaidPrice,_that.electricChargeStation,_that.reserved,_that.seller,_that.validatedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParkingSpot implements ParkingSpot {
  const _ParkingSpot({@JsonKey(name: "id") required this.id, @JsonKey(name: "address") required this.address, @JsonKey(name: "longitude") required this.longitude, @JsonKey(name: "latitude") required this.latitude, @JsonKey(name: "geohash") required this.geoHash, @JsonKey(name: "price") required this.price, @JsonKey(name: "total_paid_price") required this.totalPaidPrice, @JsonKey(name: "electric_charge_station") required this.electricChargeStation, @JsonKey(name: "reserved") required this.reserved, @JsonKey(name: "seller") this.seller, @JsonKey(name: "validated_at") this.validatedAt, @JsonKey(name: "created_at") required this.createdAt});
  factory _ParkingSpot.fromJson(Map<String, dynamic> json) => _$ParkingSpotFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "address") final  String address;
@override@JsonKey(name: "longitude") final  double longitude;
@override@JsonKey(name: "latitude") final  double latitude;
@override@JsonKey(name: "geohash") final  String geoHash;
@override@JsonKey(name: "price") final  double price;
@override@JsonKey(name: "total_paid_price") final  double totalPaidPrice;
@override@JsonKey(name: "electric_charge_station") final  bool electricChargeStation;
@override@JsonKey(name: "reserved") final  bool reserved;
@override@JsonKey(name: "seller") final  Seller? seller;
@override@JsonKey(name: "validated_at") final  DateTime? validatedAt;
@override@JsonKey(name: "created_at") final  DateTime createdAt;

/// Create a copy of ParkingSpot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkingSpotCopyWith<_ParkingSpot> get copyWith => __$ParkingSpotCopyWithImpl<_ParkingSpot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParkingSpotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingSpot&&(identical(other.id, id) || other.id == id)&&(identical(other.address, address) || other.address == address)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.geoHash, geoHash) || other.geoHash == geoHash)&&(identical(other.price, price) || other.price == price)&&(identical(other.totalPaidPrice, totalPaidPrice) || other.totalPaidPrice == totalPaidPrice)&&(identical(other.electricChargeStation, electricChargeStation) || other.electricChargeStation == electricChargeStation)&&(identical(other.reserved, reserved) || other.reserved == reserved)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.validatedAt, validatedAt) || other.validatedAt == validatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,address,longitude,latitude,geoHash,price,totalPaidPrice,electricChargeStation,reserved,seller,validatedAt,createdAt);

@override
String toString() {
  return 'ParkingSpot(id: $id, address: $address, longitude: $longitude, latitude: $latitude, geoHash: $geoHash, price: $price, totalPaidPrice: $totalPaidPrice, electricChargeStation: $electricChargeStation, reserved: $reserved, seller: $seller, validatedAt: $validatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ParkingSpotCopyWith<$Res> implements $ParkingSpotCopyWith<$Res> {
  factory _$ParkingSpotCopyWith(_ParkingSpot value, $Res Function(_ParkingSpot) _then) = __$ParkingSpotCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "address") String address,@JsonKey(name: "longitude") double longitude,@JsonKey(name: "latitude") double latitude,@JsonKey(name: "geohash") String geoHash,@JsonKey(name: "price") double price,@JsonKey(name: "total_paid_price") double totalPaidPrice,@JsonKey(name: "electric_charge_station") bool electricChargeStation,@JsonKey(name: "reserved") bool reserved,@JsonKey(name: "seller") Seller? seller,@JsonKey(name: "validated_at") DateTime? validatedAt,@JsonKey(name: "created_at") DateTime createdAt
});


@override $SellerCopyWith<$Res>? get seller;

}
/// @nodoc
class __$ParkingSpotCopyWithImpl<$Res>
    implements _$ParkingSpotCopyWith<$Res> {
  __$ParkingSpotCopyWithImpl(this._self, this._then);

  final _ParkingSpot _self;
  final $Res Function(_ParkingSpot) _then;

/// Create a copy of ParkingSpot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? address = null,Object? longitude = null,Object? latitude = null,Object? geoHash = null,Object? price = null,Object? totalPaidPrice = null,Object? electricChargeStation = null,Object? reserved = null,Object? seller = freezed,Object? validatedAt = freezed,Object? createdAt = null,}) {
  return _then(_ParkingSpot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,geoHash: null == geoHash ? _self.geoHash : geoHash // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,totalPaidPrice: null == totalPaidPrice ? _self.totalPaidPrice : totalPaidPrice // ignore: cast_nullable_to_non_nullable
as double,electricChargeStation: null == electricChargeStation ? _self.electricChargeStation : electricChargeStation // ignore: cast_nullable_to_non_nullable
as bool,reserved: null == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as bool,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as Seller?,validatedAt: freezed == validatedAt ? _self.validatedAt : validatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of ParkingSpot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $SellerCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}


/// @nodoc
mixin _$Seller {

@JsonKey(name: "username") String get username;@JsonKey(name: "first_name") String get firstName;@JsonKey(name: "last_name") String get lastName;@JsonKey(name: "phone") String get phone;@JsonKey(name: 'car') Car? get car;@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) Avatar? get avatar;
/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerCopyWith<Seller> get copyWith => _$SellerCopyWithImpl<Seller>(this as Seller, _$identity);

  /// Serializes this Seller to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Seller&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.car, car) || other.car == car)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,firstName,lastName,phone,car,avatar);

@override
String toString() {
  return 'Seller(username: $username, firstName: $firstName, lastName: $lastName, phone: $phone, car: $car, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $SellerCopyWith<$Res>  {
  factory $SellerCopyWith(Seller value, $Res Function(Seller) _then) = _$SellerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "username") String username,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName,@JsonKey(name: "phone") String phone,@JsonKey(name: 'car') Car? car,@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) Avatar? avatar
});


$CarCopyWith<$Res>? get car;$AvatarCopyWith<$Res>? get avatar;

}
/// @nodoc
class _$SellerCopyWithImpl<$Res>
    implements $SellerCopyWith<$Res> {
  _$SellerCopyWithImpl(this._self, this._then);

  final Seller _self;
  final $Res Function(Seller) _then;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? firstName = null,Object? lastName = null,Object? phone = null,Object? car = freezed,Object? avatar = freezed,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,car: freezed == car ? _self.car : car // ignore: cast_nullable_to_non_nullable
as Car?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Avatar?,
  ));
}
/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarCopyWith<$Res>? get car {
    if (_self.car == null) {
    return null;
  }

  return $CarCopyWith<$Res>(_self.car!, (value) {
    return _then(_self.copyWith(car: value));
  });
}/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AvatarCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $AvatarCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}
}


/// Adds pattern-matching-related methods to [Seller].
extension SellerPatterns on Seller {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Seller value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Seller() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Seller value)  $default,){
final _that = this;
switch (_that) {
case _Seller():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Seller value)?  $default,){
final _that = this;
switch (_that) {
case _Seller() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "username")  String username, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "phone")  String phone, @JsonKey(name: 'car')  Car? car, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)  Avatar? avatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Seller() when $default != null:
return $default(_that.username,_that.firstName,_that.lastName,_that.phone,_that.car,_that.avatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "username")  String username, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "phone")  String phone, @JsonKey(name: 'car')  Car? car, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)  Avatar? avatar)  $default,) {final _that = this;
switch (_that) {
case _Seller():
return $default(_that.username,_that.firstName,_that.lastName,_that.phone,_that.car,_that.avatar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "username")  String username, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "phone")  String phone, @JsonKey(name: 'car')  Car? car, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)  Avatar? avatar)?  $default,) {final _that = this;
switch (_that) {
case _Seller() when $default != null:
return $default(_that.username,_that.firstName,_that.lastName,_that.phone,_that.car,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Seller implements Seller {
  const _Seller({@JsonKey(name: "username") required this.username, @JsonKey(name: "first_name") required this.firstName, @JsonKey(name: "last_name") required this.lastName, @JsonKey(name: "phone") required this.phone, @JsonKey(name: 'car') this.car, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) this.avatar});
  factory _Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);

@override@JsonKey(name: "username") final  String username;
@override@JsonKey(name: "first_name") final  String firstName;
@override@JsonKey(name: "last_name") final  String lastName;
@override@JsonKey(name: "phone") final  String phone;
@override@JsonKey(name: 'car') final  Car? car;
@override@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) final  Avatar? avatar;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerCopyWith<_Seller> get copyWith => __$SellerCopyWithImpl<_Seller>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seller&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.car, car) || other.car == car)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,firstName,lastName,phone,car,avatar);

@override
String toString() {
  return 'Seller(username: $username, firstName: $firstName, lastName: $lastName, phone: $phone, car: $car, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$SellerCopyWith<$Res> implements $SellerCopyWith<$Res> {
  factory _$SellerCopyWith(_Seller value, $Res Function(_Seller) _then) = __$SellerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "username") String username,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName,@JsonKey(name: "phone") String phone,@JsonKey(name: 'car') Car? car,@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) Avatar? avatar
});


@override $CarCopyWith<$Res>? get car;@override $AvatarCopyWith<$Res>? get avatar;

}
/// @nodoc
class __$SellerCopyWithImpl<$Res>
    implements _$SellerCopyWith<$Res> {
  __$SellerCopyWithImpl(this._self, this._then);

  final _Seller _self;
  final $Res Function(_Seller) _then;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? firstName = null,Object? lastName = null,Object? phone = null,Object? car = freezed,Object? avatar = freezed,}) {
  return _then(_Seller(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,car: freezed == car ? _self.car : car // ignore: cast_nullable_to_non_nullable
as Car?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Avatar?,
  ));
}

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarCopyWith<$Res>? get car {
    if (_self.car == null) {
    return null;
  }

  return $CarCopyWith<$Res>(_self.car!, (value) {
    return _then(_self.copyWith(car: value));
  });
}/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AvatarCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $AvatarCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}
}

// dart format on
