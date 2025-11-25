// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reservation {

@JsonKey(name: "id") int get id;@JsonKey(name: "buyer") Buyer get buyer;@JsonKey(name: "parking_place") ParkingPlace get parkingPlace;// Changed from parkingSpot to match JSON
@JsonKey(name: "status") ReservationStatus get status;@JsonKey(name: "observation") String? get observation;// Made nullable since it can be null
@JsonKey(name: "validated_at") DateTime? get validatedAt;// Added missing field
@JsonKey(name: "created_at") DateTime get createdAt;
/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationCopyWith<Reservation> get copyWith => _$ReservationCopyWithImpl<Reservation>(this as Reservation, _$identity);

  /// Serializes this Reservation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reservation&&(identical(other.id, id) || other.id == id)&&(identical(other.buyer, buyer) || other.buyer == buyer)&&(identical(other.parkingPlace, parkingPlace) || other.parkingPlace == parkingPlace)&&(identical(other.status, status) || other.status == status)&&(identical(other.observation, observation) || other.observation == observation)&&(identical(other.validatedAt, validatedAt) || other.validatedAt == validatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,buyer,parkingPlace,status,observation,validatedAt,createdAt);

@override
String toString() {
  return 'Reservation(id: $id, buyer: $buyer, parkingPlace: $parkingPlace, status: $status, observation: $observation, validatedAt: $validatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ReservationCopyWith<$Res>  {
  factory $ReservationCopyWith(Reservation value, $Res Function(Reservation) _then) = _$ReservationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "buyer") Buyer buyer,@JsonKey(name: "parking_place") ParkingPlace parkingPlace,@JsonKey(name: "status") ReservationStatus status,@JsonKey(name: "observation") String? observation,@JsonKey(name: "validated_at") DateTime? validatedAt,@JsonKey(name: "created_at") DateTime createdAt
});


$BuyerCopyWith<$Res> get buyer;$ParkingPlaceCopyWith<$Res> get parkingPlace;

}
/// @nodoc
class _$ReservationCopyWithImpl<$Res>
    implements $ReservationCopyWith<$Res> {
  _$ReservationCopyWithImpl(this._self, this._then);

  final Reservation _self;
  final $Res Function(Reservation) _then;

/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? buyer = null,Object? parkingPlace = null,Object? status = null,Object? observation = freezed,Object? validatedAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,buyer: null == buyer ? _self.buyer : buyer // ignore: cast_nullable_to_non_nullable
as Buyer,parkingPlace: null == parkingPlace ? _self.parkingPlace : parkingPlace // ignore: cast_nullable_to_non_nullable
as ParkingPlace,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReservationStatus,observation: freezed == observation ? _self.observation : observation // ignore: cast_nullable_to_non_nullable
as String?,validatedAt: freezed == validatedAt ? _self.validatedAt : validatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerCopyWith<$Res> get buyer {
  
  return $BuyerCopyWith<$Res>(_self.buyer, (value) {
    return _then(_self.copyWith(buyer: value));
  });
}/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParkingPlaceCopyWith<$Res> get parkingPlace {
  
  return $ParkingPlaceCopyWith<$Res>(_self.parkingPlace, (value) {
    return _then(_self.copyWith(parkingPlace: value));
  });
}
}


/// Adds pattern-matching-related methods to [Reservation].
extension ReservationPatterns on Reservation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reservation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reservation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reservation value)  $default,){
final _that = this;
switch (_that) {
case _Reservation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reservation value)?  $default,){
final _that = this;
switch (_that) {
case _Reservation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "buyer")  Buyer buyer, @JsonKey(name: "parking_place")  ParkingPlace parkingPlace, @JsonKey(name: "status")  ReservationStatus status, @JsonKey(name: "observation")  String? observation, @JsonKey(name: "validated_at")  DateTime? validatedAt, @JsonKey(name: "created_at")  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reservation() when $default != null:
return $default(_that.id,_that.buyer,_that.parkingPlace,_that.status,_that.observation,_that.validatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "buyer")  Buyer buyer, @JsonKey(name: "parking_place")  ParkingPlace parkingPlace, @JsonKey(name: "status")  ReservationStatus status, @JsonKey(name: "observation")  String? observation, @JsonKey(name: "validated_at")  DateTime? validatedAt, @JsonKey(name: "created_at")  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Reservation():
return $default(_that.id,_that.buyer,_that.parkingPlace,_that.status,_that.observation,_that.validatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "buyer")  Buyer buyer, @JsonKey(name: "parking_place")  ParkingPlace parkingPlace, @JsonKey(name: "status")  ReservationStatus status, @JsonKey(name: "observation")  String? observation, @JsonKey(name: "validated_at")  DateTime? validatedAt, @JsonKey(name: "created_at")  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Reservation() when $default != null:
return $default(_that.id,_that.buyer,_that.parkingPlace,_that.status,_that.observation,_that.validatedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reservation implements Reservation {
  const _Reservation({@JsonKey(name: "id") required this.id, @JsonKey(name: "buyer") required this.buyer, @JsonKey(name: "parking_place") required this.parkingPlace, @JsonKey(name: "status") required this.status, @JsonKey(name: "observation") this.observation, @JsonKey(name: "validated_at") this.validatedAt, @JsonKey(name: "created_at") required this.createdAt});
  factory _Reservation.fromJson(Map<String, dynamic> json) => _$ReservationFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "buyer") final  Buyer buyer;
@override@JsonKey(name: "parking_place") final  ParkingPlace parkingPlace;
// Changed from parkingSpot to match JSON
@override@JsonKey(name: "status") final  ReservationStatus status;
@override@JsonKey(name: "observation") final  String? observation;
// Made nullable since it can be null
@override@JsonKey(name: "validated_at") final  DateTime? validatedAt;
// Added missing field
@override@JsonKey(name: "created_at") final  DateTime createdAt;

/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationCopyWith<_Reservation> get copyWith => __$ReservationCopyWithImpl<_Reservation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reservation&&(identical(other.id, id) || other.id == id)&&(identical(other.buyer, buyer) || other.buyer == buyer)&&(identical(other.parkingPlace, parkingPlace) || other.parkingPlace == parkingPlace)&&(identical(other.status, status) || other.status == status)&&(identical(other.observation, observation) || other.observation == observation)&&(identical(other.validatedAt, validatedAt) || other.validatedAt == validatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,buyer,parkingPlace,status,observation,validatedAt,createdAt);

@override
String toString() {
  return 'Reservation(id: $id, buyer: $buyer, parkingPlace: $parkingPlace, status: $status, observation: $observation, validatedAt: $validatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReservationCopyWith<$Res> implements $ReservationCopyWith<$Res> {
  factory _$ReservationCopyWith(_Reservation value, $Res Function(_Reservation) _then) = __$ReservationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "buyer") Buyer buyer,@JsonKey(name: "parking_place") ParkingPlace parkingPlace,@JsonKey(name: "status") ReservationStatus status,@JsonKey(name: "observation") String? observation,@JsonKey(name: "validated_at") DateTime? validatedAt,@JsonKey(name: "created_at") DateTime createdAt
});


@override $BuyerCopyWith<$Res> get buyer;@override $ParkingPlaceCopyWith<$Res> get parkingPlace;

}
/// @nodoc
class __$ReservationCopyWithImpl<$Res>
    implements _$ReservationCopyWith<$Res> {
  __$ReservationCopyWithImpl(this._self, this._then);

  final _Reservation _self;
  final $Res Function(_Reservation) _then;

/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? buyer = null,Object? parkingPlace = null,Object? status = null,Object? observation = freezed,Object? validatedAt = freezed,Object? createdAt = null,}) {
  return _then(_Reservation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,buyer: null == buyer ? _self.buyer : buyer // ignore: cast_nullable_to_non_nullable
as Buyer,parkingPlace: null == parkingPlace ? _self.parkingPlace : parkingPlace // ignore: cast_nullable_to_non_nullable
as ParkingPlace,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReservationStatus,observation: freezed == observation ? _self.observation : observation // ignore: cast_nullable_to_non_nullable
as String?,validatedAt: freezed == validatedAt ? _self.validatedAt : validatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerCopyWith<$Res> get buyer {
  
  return $BuyerCopyWith<$Res>(_self.buyer, (value) {
    return _then(_self.copyWith(buyer: value));
  });
}/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParkingPlaceCopyWith<$Res> get parkingPlace {
  
  return $ParkingPlaceCopyWith<$Res>(_self.parkingPlace, (value) {
    return _then(_self.copyWith(parkingPlace: value));
  });
}
}


/// @nodoc
mixin _$Buyer {

@JsonKey(name: "username") String get username;@JsonKey(name: "first_name") String get firstName;@JsonKey(name: "last_name") String get lastName;@JsonKey(name: "phone") String get phone;@JsonKey(name: 'car') Car get car;@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) Avatar? get avatar;
/// Create a copy of Buyer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyerCopyWith<Buyer> get copyWith => _$BuyerCopyWithImpl<Buyer>(this as Buyer, _$identity);

  /// Serializes this Buyer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Buyer&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.car, car) || other.car == car)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,firstName,lastName,phone,car,avatar);

@override
String toString() {
  return 'Buyer(username: $username, firstName: $firstName, lastName: $lastName, phone: $phone, car: $car, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $BuyerCopyWith<$Res>  {
  factory $BuyerCopyWith(Buyer value, $Res Function(Buyer) _then) = _$BuyerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "username") String username,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName,@JsonKey(name: "phone") String phone,@JsonKey(name: 'car') Car car,@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) Avatar? avatar
});


$CarCopyWith<$Res> get car;$AvatarCopyWith<$Res>? get avatar;

}
/// @nodoc
class _$BuyerCopyWithImpl<$Res>
    implements $BuyerCopyWith<$Res> {
  _$BuyerCopyWithImpl(this._self, this._then);

  final Buyer _self;
  final $Res Function(Buyer) _then;

/// Create a copy of Buyer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? firstName = null,Object? lastName = null,Object? phone = null,Object? car = null,Object? avatar = freezed,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,car: null == car ? _self.car : car // ignore: cast_nullable_to_non_nullable
as Car,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Avatar?,
  ));
}
/// Create a copy of Buyer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarCopyWith<$Res> get car {
  
  return $CarCopyWith<$Res>(_self.car, (value) {
    return _then(_self.copyWith(car: value));
  });
}/// Create a copy of Buyer
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


/// Adds pattern-matching-related methods to [Buyer].
extension BuyerPatterns on Buyer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Buyer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Buyer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Buyer value)  $default,){
final _that = this;
switch (_that) {
case _Buyer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Buyer value)?  $default,){
final _that = this;
switch (_that) {
case _Buyer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "username")  String username, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "phone")  String phone, @JsonKey(name: 'car')  Car car, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)  Avatar? avatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Buyer() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "username")  String username, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "phone")  String phone, @JsonKey(name: 'car')  Car car, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)  Avatar? avatar)  $default,) {final _that = this;
switch (_that) {
case _Buyer():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "username")  String username, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "phone")  String phone, @JsonKey(name: 'car')  Car car, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)  Avatar? avatar)?  $default,) {final _that = this;
switch (_that) {
case _Buyer() when $default != null:
return $default(_that.username,_that.firstName,_that.lastName,_that.phone,_that.car,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Buyer implements Buyer {
  const _Buyer({@JsonKey(name: "username") required this.username, @JsonKey(name: "first_name") required this.firstName, @JsonKey(name: "last_name") required this.lastName, @JsonKey(name: "phone") required this.phone, @JsonKey(name: 'car') required this.car, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) this.avatar});
  factory _Buyer.fromJson(Map<String, dynamic> json) => _$BuyerFromJson(json);

@override@JsonKey(name: "username") final  String username;
@override@JsonKey(name: "first_name") final  String firstName;
@override@JsonKey(name: "last_name") final  String lastName;
@override@JsonKey(name: "phone") final  String phone;
@override@JsonKey(name: 'car') final  Car car;
@override@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) final  Avatar? avatar;

/// Create a copy of Buyer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyerCopyWith<_Buyer> get copyWith => __$BuyerCopyWithImpl<_Buyer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuyerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Buyer&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.car, car) || other.car == car)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,firstName,lastName,phone,car,avatar);

@override
String toString() {
  return 'Buyer(username: $username, firstName: $firstName, lastName: $lastName, phone: $phone, car: $car, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$BuyerCopyWith<$Res> implements $BuyerCopyWith<$Res> {
  factory _$BuyerCopyWith(_Buyer value, $Res Function(_Buyer) _then) = __$BuyerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "username") String username,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName,@JsonKey(name: "phone") String phone,@JsonKey(name: 'car') Car car,@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) Avatar? avatar
});


@override $CarCopyWith<$Res> get car;@override $AvatarCopyWith<$Res>? get avatar;

}
/// @nodoc
class __$BuyerCopyWithImpl<$Res>
    implements _$BuyerCopyWith<$Res> {
  __$BuyerCopyWithImpl(this._self, this._then);

  final _Buyer _self;
  final $Res Function(_Buyer) _then;

/// Create a copy of Buyer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? firstName = null,Object? lastName = null,Object? phone = null,Object? car = null,Object? avatar = freezed,}) {
  return _then(_Buyer(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,car: null == car ? _self.car : car // ignore: cast_nullable_to_non_nullable
as Car,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Avatar?,
  ));
}

/// Create a copy of Buyer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarCopyWith<$Res> get car {
  
  return $CarCopyWith<$Res>(_self.car, (value) {
    return _then(_self.copyWith(car: value));
  });
}/// Create a copy of Buyer
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


/// @nodoc
mixin _$ParkingPlace {

@JsonKey(name: "id") int get id;// Added missing id field
@JsonKey(name: "address") String get address;@JsonKey(name: "longitude") double get longitude;@JsonKey(name: "latitude") double get latitude;@JsonKey(name: "geohash") String get geoHash;@JsonKey(name: "price") double get price;@JsonKey(name: "total_paid_price") double get totalPaidPrice;@JsonKey(name: "electric_charge_station") bool get electricChargeStation;@JsonKey(name: "reserved") bool get reserved;@JsonKey(name: "seller") Seller get seller;// Added seller field
@JsonKey(name: "validated_at") DateTime? get validatedAt;// Added validated_at
@JsonKey(name: "created_at") DateTime get createdAt;
/// Create a copy of ParkingPlace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingPlaceCopyWith<ParkingPlace> get copyWith => _$ParkingPlaceCopyWithImpl<ParkingPlace>(this as ParkingPlace, _$identity);

  /// Serializes this ParkingPlace to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingPlace&&(identical(other.id, id) || other.id == id)&&(identical(other.address, address) || other.address == address)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.geoHash, geoHash) || other.geoHash == geoHash)&&(identical(other.price, price) || other.price == price)&&(identical(other.totalPaidPrice, totalPaidPrice) || other.totalPaidPrice == totalPaidPrice)&&(identical(other.electricChargeStation, electricChargeStation) || other.electricChargeStation == electricChargeStation)&&(identical(other.reserved, reserved) || other.reserved == reserved)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.validatedAt, validatedAt) || other.validatedAt == validatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,address,longitude,latitude,geoHash,price,totalPaidPrice,electricChargeStation,reserved,seller,validatedAt,createdAt);

@override
String toString() {
  return 'ParkingPlace(id: $id, address: $address, longitude: $longitude, latitude: $latitude, geoHash: $geoHash, price: $price, totalPaidPrice: $totalPaidPrice, electricChargeStation: $electricChargeStation, reserved: $reserved, seller: $seller, validatedAt: $validatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ParkingPlaceCopyWith<$Res>  {
  factory $ParkingPlaceCopyWith(ParkingPlace value, $Res Function(ParkingPlace) _then) = _$ParkingPlaceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "address") String address,@JsonKey(name: "longitude") double longitude,@JsonKey(name: "latitude") double latitude,@JsonKey(name: "geohash") String geoHash,@JsonKey(name: "price") double price,@JsonKey(name: "total_paid_price") double totalPaidPrice,@JsonKey(name: "electric_charge_station") bool electricChargeStation,@JsonKey(name: "reserved") bool reserved,@JsonKey(name: "seller") Seller seller,@JsonKey(name: "validated_at") DateTime? validatedAt,@JsonKey(name: "created_at") DateTime createdAt
});


$SellerCopyWith<$Res> get seller;

}
/// @nodoc
class _$ParkingPlaceCopyWithImpl<$Res>
    implements $ParkingPlaceCopyWith<$Res> {
  _$ParkingPlaceCopyWithImpl(this._self, this._then);

  final ParkingPlace _self;
  final $Res Function(ParkingPlace) _then;

/// Create a copy of ParkingPlace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? address = null,Object? longitude = null,Object? latitude = null,Object? geoHash = null,Object? price = null,Object? totalPaidPrice = null,Object? electricChargeStation = null,Object? reserved = null,Object? seller = null,Object? validatedAt = freezed,Object? createdAt = null,}) {
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
as bool,seller: null == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as Seller,validatedAt: freezed == validatedAt ? _self.validatedAt : validatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of ParkingPlace
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerCopyWith<$Res> get seller {
  
  return $SellerCopyWith<$Res>(_self.seller, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}


/// Adds pattern-matching-related methods to [ParkingPlace].
extension ParkingPlacePatterns on ParkingPlace {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParkingPlace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParkingPlace() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParkingPlace value)  $default,){
final _that = this;
switch (_that) {
case _ParkingPlace():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParkingPlace value)?  $default,){
final _that = this;
switch (_that) {
case _ParkingPlace() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "address")  String address, @JsonKey(name: "longitude")  double longitude, @JsonKey(name: "latitude")  double latitude, @JsonKey(name: "geohash")  String geoHash, @JsonKey(name: "price")  double price, @JsonKey(name: "total_paid_price")  double totalPaidPrice, @JsonKey(name: "electric_charge_station")  bool electricChargeStation, @JsonKey(name: "reserved")  bool reserved, @JsonKey(name: "seller")  Seller seller, @JsonKey(name: "validated_at")  DateTime? validatedAt, @JsonKey(name: "created_at")  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParkingPlace() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "address")  String address, @JsonKey(name: "longitude")  double longitude, @JsonKey(name: "latitude")  double latitude, @JsonKey(name: "geohash")  String geoHash, @JsonKey(name: "price")  double price, @JsonKey(name: "total_paid_price")  double totalPaidPrice, @JsonKey(name: "electric_charge_station")  bool electricChargeStation, @JsonKey(name: "reserved")  bool reserved, @JsonKey(name: "seller")  Seller seller, @JsonKey(name: "validated_at")  DateTime? validatedAt, @JsonKey(name: "created_at")  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ParkingPlace():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "address")  String address, @JsonKey(name: "longitude")  double longitude, @JsonKey(name: "latitude")  double latitude, @JsonKey(name: "geohash")  String geoHash, @JsonKey(name: "price")  double price, @JsonKey(name: "total_paid_price")  double totalPaidPrice, @JsonKey(name: "electric_charge_station")  bool electricChargeStation, @JsonKey(name: "reserved")  bool reserved, @JsonKey(name: "seller")  Seller seller, @JsonKey(name: "validated_at")  DateTime? validatedAt, @JsonKey(name: "created_at")  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ParkingPlace() when $default != null:
return $default(_that.id,_that.address,_that.longitude,_that.latitude,_that.geoHash,_that.price,_that.totalPaidPrice,_that.electricChargeStation,_that.reserved,_that.seller,_that.validatedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParkingPlace implements ParkingPlace {
  const _ParkingPlace({@JsonKey(name: "id") required this.id, @JsonKey(name: "address") required this.address, @JsonKey(name: "longitude") required this.longitude, @JsonKey(name: "latitude") required this.latitude, @JsonKey(name: "geohash") required this.geoHash, @JsonKey(name: "price") required this.price, @JsonKey(name: "total_paid_price") required this.totalPaidPrice, @JsonKey(name: "electric_charge_station") required this.electricChargeStation, @JsonKey(name: "reserved") required this.reserved, @JsonKey(name: "seller") required this.seller, @JsonKey(name: "validated_at") this.validatedAt, @JsonKey(name: "created_at") required this.createdAt});
  factory _ParkingPlace.fromJson(Map<String, dynamic> json) => _$ParkingPlaceFromJson(json);

@override@JsonKey(name: "id") final  int id;
// Added missing id field
@override@JsonKey(name: "address") final  String address;
@override@JsonKey(name: "longitude") final  double longitude;
@override@JsonKey(name: "latitude") final  double latitude;
@override@JsonKey(name: "geohash") final  String geoHash;
@override@JsonKey(name: "price") final  double price;
@override@JsonKey(name: "total_paid_price") final  double totalPaidPrice;
@override@JsonKey(name: "electric_charge_station") final  bool electricChargeStation;
@override@JsonKey(name: "reserved") final  bool reserved;
@override@JsonKey(name: "seller") final  Seller seller;
// Added seller field
@override@JsonKey(name: "validated_at") final  DateTime? validatedAt;
// Added validated_at
@override@JsonKey(name: "created_at") final  DateTime createdAt;

/// Create a copy of ParkingPlace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParkingPlaceCopyWith<_ParkingPlace> get copyWith => __$ParkingPlaceCopyWithImpl<_ParkingPlace>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParkingPlaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingPlace&&(identical(other.id, id) || other.id == id)&&(identical(other.address, address) || other.address == address)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.geoHash, geoHash) || other.geoHash == geoHash)&&(identical(other.price, price) || other.price == price)&&(identical(other.totalPaidPrice, totalPaidPrice) || other.totalPaidPrice == totalPaidPrice)&&(identical(other.electricChargeStation, electricChargeStation) || other.electricChargeStation == electricChargeStation)&&(identical(other.reserved, reserved) || other.reserved == reserved)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.validatedAt, validatedAt) || other.validatedAt == validatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,address,longitude,latitude,geoHash,price,totalPaidPrice,electricChargeStation,reserved,seller,validatedAt,createdAt);

@override
String toString() {
  return 'ParkingPlace(id: $id, address: $address, longitude: $longitude, latitude: $latitude, geoHash: $geoHash, price: $price, totalPaidPrice: $totalPaidPrice, electricChargeStation: $electricChargeStation, reserved: $reserved, seller: $seller, validatedAt: $validatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ParkingPlaceCopyWith<$Res> implements $ParkingPlaceCopyWith<$Res> {
  factory _$ParkingPlaceCopyWith(_ParkingPlace value, $Res Function(_ParkingPlace) _then) = __$ParkingPlaceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "address") String address,@JsonKey(name: "longitude") double longitude,@JsonKey(name: "latitude") double latitude,@JsonKey(name: "geohash") String geoHash,@JsonKey(name: "price") double price,@JsonKey(name: "total_paid_price") double totalPaidPrice,@JsonKey(name: "electric_charge_station") bool electricChargeStation,@JsonKey(name: "reserved") bool reserved,@JsonKey(name: "seller") Seller seller,@JsonKey(name: "validated_at") DateTime? validatedAt,@JsonKey(name: "created_at") DateTime createdAt
});


@override $SellerCopyWith<$Res> get seller;

}
/// @nodoc
class __$ParkingPlaceCopyWithImpl<$Res>
    implements _$ParkingPlaceCopyWith<$Res> {
  __$ParkingPlaceCopyWithImpl(this._self, this._then);

  final _ParkingPlace _self;
  final $Res Function(_ParkingPlace) _then;

/// Create a copy of ParkingPlace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? address = null,Object? longitude = null,Object? latitude = null,Object? geoHash = null,Object? price = null,Object? totalPaidPrice = null,Object? electricChargeStation = null,Object? reserved = null,Object? seller = null,Object? validatedAt = freezed,Object? createdAt = null,}) {
  return _then(_ParkingPlace(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,geoHash: null == geoHash ? _self.geoHash : geoHash // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,totalPaidPrice: null == totalPaidPrice ? _self.totalPaidPrice : totalPaidPrice // ignore: cast_nullable_to_non_nullable
as double,electricChargeStation: null == electricChargeStation ? _self.electricChargeStation : electricChargeStation // ignore: cast_nullable_to_non_nullable
as bool,reserved: null == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as bool,seller: null == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as Seller,validatedAt: freezed == validatedAt ? _self.validatedAt : validatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of ParkingPlace
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerCopyWith<$Res> get seller {
  
  return $SellerCopyWith<$Res>(_self.seller, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}


/// @nodoc
mixin _$Seller {

@JsonKey(name: "username") String get username;@JsonKey(name: "first_name") String get firstName;@JsonKey(name: "last_name") String get lastName;@JsonKey(name: "phone") String get phone;@JsonKey(name: 'car') Car get car;@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) Avatar? get avatar;
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
@JsonKey(name: "username") String username,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName,@JsonKey(name: "phone") String phone,@JsonKey(name: 'car') Car car,@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) Avatar? avatar
});


$CarCopyWith<$Res> get car;$AvatarCopyWith<$Res>? get avatar;

}
/// @nodoc
class _$SellerCopyWithImpl<$Res>
    implements $SellerCopyWith<$Res> {
  _$SellerCopyWithImpl(this._self, this._then);

  final Seller _self;
  final $Res Function(Seller) _then;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? firstName = null,Object? lastName = null,Object? phone = null,Object? car = null,Object? avatar = freezed,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,car: null == car ? _self.car : car // ignore: cast_nullable_to_non_nullable
as Car,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Avatar?,
  ));
}
/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarCopyWith<$Res> get car {
  
  return $CarCopyWith<$Res>(_self.car, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "username")  String username, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "phone")  String phone, @JsonKey(name: 'car')  Car car, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)  Avatar? avatar)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "username")  String username, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "phone")  String phone, @JsonKey(name: 'car')  Car car, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)  Avatar? avatar)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "username")  String username, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "phone")  String phone, @JsonKey(name: 'car')  Car car, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)  Avatar? avatar)?  $default,) {final _that = this;
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
  const _Seller({@JsonKey(name: "username") required this.username, @JsonKey(name: "first_name") required this.firstName, @JsonKey(name: "last_name") required this.lastName, @JsonKey(name: "phone") required this.phone, @JsonKey(name: 'car') required this.car, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) this.avatar});
  factory _Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);

@override@JsonKey(name: "username") final  String username;
@override@JsonKey(name: "first_name") final  String firstName;
@override@JsonKey(name: "last_name") final  String lastName;
@override@JsonKey(name: "phone") final  String phone;
@override@JsonKey(name: 'car') final  Car car;
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
@JsonKey(name: "username") String username,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName,@JsonKey(name: "phone") String phone,@JsonKey(name: 'car') Car car,@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson) Avatar? avatar
});


@override $CarCopyWith<$Res> get car;@override $AvatarCopyWith<$Res>? get avatar;

}
/// @nodoc
class __$SellerCopyWithImpl<$Res>
    implements _$SellerCopyWith<$Res> {
  __$SellerCopyWithImpl(this._self, this._then);

  final _Seller _self;
  final $Res Function(_Seller) _then;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? firstName = null,Object? lastName = null,Object? phone = null,Object? car = null,Object? avatar = freezed,}) {
  return _then(_Seller(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,car: null == car ? _self.car : car // ignore: cast_nullable_to_non_nullable
as Car,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Avatar?,
  ));
}

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarCopyWith<$Res> get car {
  
  return $CarCopyWith<$Res>(_self.car, (value) {
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


/// @nodoc
mixin _$Car {

@JsonKey(name: "registration_number") String get registrationNumber;@JsonKey(name: "brand") String get brand;@JsonKey(name: "model") String get model;@JsonKey(name: "color") String get color;@JsonKey(name: "image") CarImage? get image;
/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarCopyWith<Car> get copyWith => _$CarCopyWithImpl<Car>(this as Car, _$identity);

  /// Serializes this Car to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Car&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.color, color) || other.color == color)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registrationNumber,brand,model,color,image);

@override
String toString() {
  return 'Car(registrationNumber: $registrationNumber, brand: $brand, model: $model, color: $color, image: $image)';
}


}

/// @nodoc
abstract mixin class $CarCopyWith<$Res>  {
  factory $CarCopyWith(Car value, $Res Function(Car) _then) = _$CarCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "registration_number") String registrationNumber,@JsonKey(name: "brand") String brand,@JsonKey(name: "model") String model,@JsonKey(name: "color") String color,@JsonKey(name: "image") CarImage? image
});


$CarImageCopyWith<$Res>? get image;

}
/// @nodoc
class _$CarCopyWithImpl<$Res>
    implements $CarCopyWith<$Res> {
  _$CarCopyWithImpl(this._self, this._then);

  final Car _self;
  final $Res Function(Car) _then;

/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? registrationNumber = null,Object? brand = null,Object? model = null,Object? color = null,Object? image = freezed,}) {
  return _then(_self.copyWith(
registrationNumber: null == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as CarImage?,
  ));
}
/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $CarImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "registration_number")  String registrationNumber, @JsonKey(name: "brand")  String brand, @JsonKey(name: "model")  String model, @JsonKey(name: "color")  String color, @JsonKey(name: "image")  CarImage? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Car() when $default != null:
return $default(_that.registrationNumber,_that.brand,_that.model,_that.color,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "registration_number")  String registrationNumber, @JsonKey(name: "brand")  String brand, @JsonKey(name: "model")  String model, @JsonKey(name: "color")  String color, @JsonKey(name: "image")  CarImage? image)  $default,) {final _that = this;
switch (_that) {
case _Car():
return $default(_that.registrationNumber,_that.brand,_that.model,_that.color,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "registration_number")  String registrationNumber, @JsonKey(name: "brand")  String brand, @JsonKey(name: "model")  String model, @JsonKey(name: "color")  String color, @JsonKey(name: "image")  CarImage? image)?  $default,) {final _that = this;
switch (_that) {
case _Car() when $default != null:
return $default(_that.registrationNumber,_that.brand,_that.model,_that.color,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Car implements Car {
  const _Car({@JsonKey(name: "registration_number") required this.registrationNumber, @JsonKey(name: "brand") required this.brand, @JsonKey(name: "model") required this.model, @JsonKey(name: "color") required this.color, @JsonKey(name: "image") this.image});
  factory _Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

@override@JsonKey(name: "registration_number") final  String registrationNumber;
@override@JsonKey(name: "brand") final  String brand;
@override@JsonKey(name: "model") final  String model;
@override@JsonKey(name: "color") final  String color;
@override@JsonKey(name: "image") final  CarImage? image;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Car&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.color, color) || other.color == color)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registrationNumber,brand,model,color,image);

@override
String toString() {
  return 'Car(registrationNumber: $registrationNumber, brand: $brand, model: $model, color: $color, image: $image)';
}


}

/// @nodoc
abstract mixin class _$CarCopyWith<$Res> implements $CarCopyWith<$Res> {
  factory _$CarCopyWith(_Car value, $Res Function(_Car) _then) = __$CarCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "registration_number") String registrationNumber,@JsonKey(name: "brand") String brand,@JsonKey(name: "model") String model,@JsonKey(name: "color") String color,@JsonKey(name: "image") CarImage? image
});


@override $CarImageCopyWith<$Res>? get image;

}
/// @nodoc
class __$CarCopyWithImpl<$Res>
    implements _$CarCopyWith<$Res> {
  __$CarCopyWithImpl(this._self, this._then);

  final _Car _self;
  final $Res Function(_Car) _then;

/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registrationNumber = null,Object? brand = null,Object? model = null,Object? color = null,Object? image = freezed,}) {
  return _then(_Car(
registrationNumber: null == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as CarImage?,
  ));
}

/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $CarImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// @nodoc
mixin _$CarImage {

@JsonKey(name: "id") int get id;@JsonKey(name: "url") String get url;
/// Create a copy of CarImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarImageCopyWith<CarImage> get copyWith => _$CarImageCopyWithImpl<CarImage>(this as CarImage, _$identity);

  /// Serializes this CarImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarImage&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'CarImage(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class $CarImageCopyWith<$Res>  {
  factory $CarImageCopyWith(CarImage value, $Res Function(CarImage) _then) = _$CarImageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "url") String url
});




}
/// @nodoc
class _$CarImageCopyWithImpl<$Res>
    implements $CarImageCopyWith<$Res> {
  _$CarImageCopyWithImpl(this._self, this._then);

  final CarImage _self;
  final $Res Function(CarImage) _then;

/// Create a copy of CarImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CarImage].
extension CarImagePatterns on CarImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarImage value)  $default,){
final _that = this;
switch (_that) {
case _CarImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarImage value)?  $default,){
final _that = this;
switch (_that) {
case _CarImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "url")  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarImage() when $default != null:
return $default(_that.id,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "url")  String url)  $default,) {final _that = this;
switch (_that) {
case _CarImage():
return $default(_that.id,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "url")  String url)?  $default,) {final _that = this;
switch (_that) {
case _CarImage() when $default != null:
return $default(_that.id,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CarImage implements CarImage {
  const _CarImage({@JsonKey(name: "id") required this.id, @JsonKey(name: "url") required this.url});
  factory _CarImage.fromJson(Map<String, dynamic> json) => _$CarImageFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "url") final  String url;

/// Create a copy of CarImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarImageCopyWith<_CarImage> get copyWith => __$CarImageCopyWithImpl<_CarImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarImage&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'CarImage(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class _$CarImageCopyWith<$Res> implements $CarImageCopyWith<$Res> {
  factory _$CarImageCopyWith(_CarImage value, $Res Function(_CarImage) _then) = __$CarImageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "url") String url
});




}
/// @nodoc
class __$CarImageCopyWithImpl<$Res>
    implements _$CarImageCopyWith<$Res> {
  __$CarImageCopyWithImpl(this._self, this._then);

  final _CarImage _self;
  final $Res Function(_CarImage) _then;

/// Create a copy of CarImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,}) {
  return _then(_CarImage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
