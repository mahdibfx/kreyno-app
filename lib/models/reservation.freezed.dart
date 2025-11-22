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

@JsonKey(name: "id") int get id;@JsonKey(name: "buyer") Buyer get buyer;@JsonKey(name: "parking_place") ParkingPlace get parkingSpot;@JsonKey(name: "status") ReservationStatus get status;@JsonKey(name: "observation") String get observation;@JsonKey(name: "created_at") DateTime get createdAt;
/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationCopyWith<Reservation> get copyWith => _$ReservationCopyWithImpl<Reservation>(this as Reservation, _$identity);

  /// Serializes this Reservation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reservation&&(identical(other.id, id) || other.id == id)&&(identical(other.buyer, buyer) || other.buyer == buyer)&&(identical(other.parkingSpot, parkingSpot) || other.parkingSpot == parkingSpot)&&(identical(other.status, status) || other.status == status)&&(identical(other.observation, observation) || other.observation == observation)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,buyer,parkingSpot,status,observation,createdAt);

@override
String toString() {
  return 'Reservation(id: $id, buyer: $buyer, parkingSpot: $parkingSpot, status: $status, observation: $observation, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ReservationCopyWith<$Res>  {
  factory $ReservationCopyWith(Reservation value, $Res Function(Reservation) _then) = _$ReservationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "buyer") Buyer buyer,@JsonKey(name: "parking_place") ParkingPlace parkingSpot,@JsonKey(name: "status") ReservationStatus status,@JsonKey(name: "observation") String observation,@JsonKey(name: "created_at") DateTime createdAt
});


$BuyerCopyWith<$Res> get buyer;$ParkingPlaceCopyWith<$Res> get parkingSpot;

}
/// @nodoc
class _$ReservationCopyWithImpl<$Res>
    implements $ReservationCopyWith<$Res> {
  _$ReservationCopyWithImpl(this._self, this._then);

  final Reservation _self;
  final $Res Function(Reservation) _then;

/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? buyer = null,Object? parkingSpot = null,Object? status = null,Object? observation = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,buyer: null == buyer ? _self.buyer : buyer // ignore: cast_nullable_to_non_nullable
as Buyer,parkingSpot: null == parkingSpot ? _self.parkingSpot : parkingSpot // ignore: cast_nullable_to_non_nullable
as ParkingPlace,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReservationStatus,observation: null == observation ? _self.observation : observation // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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
$ParkingPlaceCopyWith<$Res> get parkingSpot {
  
  return $ParkingPlaceCopyWith<$Res>(_self.parkingSpot, (value) {
    return _then(_self.copyWith(parkingSpot: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "buyer")  Buyer buyer, @JsonKey(name: "parking_place")  ParkingPlace parkingSpot, @JsonKey(name: "status")  ReservationStatus status, @JsonKey(name: "observation")  String observation, @JsonKey(name: "created_at")  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reservation() when $default != null:
return $default(_that.id,_that.buyer,_that.parkingSpot,_that.status,_that.observation,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "buyer")  Buyer buyer, @JsonKey(name: "parking_place")  ParkingPlace parkingSpot, @JsonKey(name: "status")  ReservationStatus status, @JsonKey(name: "observation")  String observation, @JsonKey(name: "created_at")  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Reservation():
return $default(_that.id,_that.buyer,_that.parkingSpot,_that.status,_that.observation,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "buyer")  Buyer buyer, @JsonKey(name: "parking_place")  ParkingPlace parkingSpot, @JsonKey(name: "status")  ReservationStatus status, @JsonKey(name: "observation")  String observation, @JsonKey(name: "created_at")  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Reservation() when $default != null:
return $default(_that.id,_that.buyer,_that.parkingSpot,_that.status,_that.observation,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reservation implements Reservation {
  const _Reservation({@JsonKey(name: "id") required this.id, @JsonKey(name: "buyer") required this.buyer, @JsonKey(name: "parking_place") required this.parkingSpot, @JsonKey(name: "status") required this.status, @JsonKey(name: "observation") required this.observation, @JsonKey(name: "created_at") required this.createdAt});
  factory _Reservation.fromJson(Map<String, dynamic> json) => _$ReservationFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "buyer") final  Buyer buyer;
@override@JsonKey(name: "parking_place") final  ParkingPlace parkingSpot;
@override@JsonKey(name: "status") final  ReservationStatus status;
@override@JsonKey(name: "observation") final  String observation;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reservation&&(identical(other.id, id) || other.id == id)&&(identical(other.buyer, buyer) || other.buyer == buyer)&&(identical(other.parkingSpot, parkingSpot) || other.parkingSpot == parkingSpot)&&(identical(other.status, status) || other.status == status)&&(identical(other.observation, observation) || other.observation == observation)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,buyer,parkingSpot,status,observation,createdAt);

@override
String toString() {
  return 'Reservation(id: $id, buyer: $buyer, parkingSpot: $parkingSpot, status: $status, observation: $observation, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReservationCopyWith<$Res> implements $ReservationCopyWith<$Res> {
  factory _$ReservationCopyWith(_Reservation value, $Res Function(_Reservation) _then) = __$ReservationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "buyer") Buyer buyer,@JsonKey(name: "parking_place") ParkingPlace parkingSpot,@JsonKey(name: "status") ReservationStatus status,@JsonKey(name: "observation") String observation,@JsonKey(name: "created_at") DateTime createdAt
});


@override $BuyerCopyWith<$Res> get buyer;@override $ParkingPlaceCopyWith<$Res> get parkingSpot;

}
/// @nodoc
class __$ReservationCopyWithImpl<$Res>
    implements _$ReservationCopyWith<$Res> {
  __$ReservationCopyWithImpl(this._self, this._then);

  final _Reservation _self;
  final $Res Function(_Reservation) _then;

/// Create a copy of Reservation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? buyer = null,Object? parkingSpot = null,Object? status = null,Object? observation = null,Object? createdAt = null,}) {
  return _then(_Reservation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,buyer: null == buyer ? _self.buyer : buyer // ignore: cast_nullable_to_non_nullable
as Buyer,parkingSpot: null == parkingSpot ? _self.parkingSpot : parkingSpot // ignore: cast_nullable_to_non_nullable
as ParkingPlace,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReservationStatus,observation: null == observation ? _self.observation : observation // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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
$ParkingPlaceCopyWith<$Res> get parkingSpot {
  
  return $ParkingPlaceCopyWith<$Res>(_self.parkingSpot, (value) {
    return _then(_self.copyWith(parkingSpot: value));
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

@JsonKey(name: "address") String get address;@JsonKey(name: "longitude") double get longitude;@JsonKey(name: "latitude") double get latitude;@JsonKey(name: "geohash") String get geoHash;@JsonKey(name: "price") double get price;@JsonKey(name: "total_paid_price") double get totalPaidPrice;@JsonKey(name: "electric_charge_station") bool get electricChargeStation;@JsonKey(name: "reserved") bool get reserved;
/// Create a copy of ParkingPlace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParkingPlaceCopyWith<ParkingPlace> get copyWith => _$ParkingPlaceCopyWithImpl<ParkingPlace>(this as ParkingPlace, _$identity);

  /// Serializes this ParkingPlace to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParkingPlace&&(identical(other.address, address) || other.address == address)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.geoHash, geoHash) || other.geoHash == geoHash)&&(identical(other.price, price) || other.price == price)&&(identical(other.totalPaidPrice, totalPaidPrice) || other.totalPaidPrice == totalPaidPrice)&&(identical(other.electricChargeStation, electricChargeStation) || other.electricChargeStation == electricChargeStation)&&(identical(other.reserved, reserved) || other.reserved == reserved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,longitude,latitude,geoHash,price,totalPaidPrice,electricChargeStation,reserved);

@override
String toString() {
  return 'ParkingPlace(address: $address, longitude: $longitude, latitude: $latitude, geoHash: $geoHash, price: $price, totalPaidPrice: $totalPaidPrice, electricChargeStation: $electricChargeStation, reserved: $reserved)';
}


}

/// @nodoc
abstract mixin class $ParkingPlaceCopyWith<$Res>  {
  factory $ParkingPlaceCopyWith(ParkingPlace value, $Res Function(ParkingPlace) _then) = _$ParkingPlaceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "address") String address,@JsonKey(name: "longitude") double longitude,@JsonKey(name: "latitude") double latitude,@JsonKey(name: "geohash") String geoHash,@JsonKey(name: "price") double price,@JsonKey(name: "total_paid_price") double totalPaidPrice,@JsonKey(name: "electric_charge_station") bool electricChargeStation,@JsonKey(name: "reserved") bool reserved
});




}
/// @nodoc
class _$ParkingPlaceCopyWithImpl<$Res>
    implements $ParkingPlaceCopyWith<$Res> {
  _$ParkingPlaceCopyWithImpl(this._self, this._then);

  final ParkingPlace _self;
  final $Res Function(ParkingPlace) _then;

/// Create a copy of ParkingPlace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? longitude = null,Object? latitude = null,Object? geoHash = null,Object? price = null,Object? totalPaidPrice = null,Object? electricChargeStation = null,Object? reserved = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,geoHash: null == geoHash ? _self.geoHash : geoHash // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,totalPaidPrice: null == totalPaidPrice ? _self.totalPaidPrice : totalPaidPrice // ignore: cast_nullable_to_non_nullable
as double,electricChargeStation: null == electricChargeStation ? _self.electricChargeStation : electricChargeStation // ignore: cast_nullable_to_non_nullable
as bool,reserved: null == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "address")  String address, @JsonKey(name: "longitude")  double longitude, @JsonKey(name: "latitude")  double latitude, @JsonKey(name: "geohash")  String geoHash, @JsonKey(name: "price")  double price, @JsonKey(name: "total_paid_price")  double totalPaidPrice, @JsonKey(name: "electric_charge_station")  bool electricChargeStation, @JsonKey(name: "reserved")  bool reserved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParkingPlace() when $default != null:
return $default(_that.address,_that.longitude,_that.latitude,_that.geoHash,_that.price,_that.totalPaidPrice,_that.electricChargeStation,_that.reserved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "address")  String address, @JsonKey(name: "longitude")  double longitude, @JsonKey(name: "latitude")  double latitude, @JsonKey(name: "geohash")  String geoHash, @JsonKey(name: "price")  double price, @JsonKey(name: "total_paid_price")  double totalPaidPrice, @JsonKey(name: "electric_charge_station")  bool electricChargeStation, @JsonKey(name: "reserved")  bool reserved)  $default,) {final _that = this;
switch (_that) {
case _ParkingPlace():
return $default(_that.address,_that.longitude,_that.latitude,_that.geoHash,_that.price,_that.totalPaidPrice,_that.electricChargeStation,_that.reserved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "address")  String address, @JsonKey(name: "longitude")  double longitude, @JsonKey(name: "latitude")  double latitude, @JsonKey(name: "geohash")  String geoHash, @JsonKey(name: "price")  double price, @JsonKey(name: "total_paid_price")  double totalPaidPrice, @JsonKey(name: "electric_charge_station")  bool electricChargeStation, @JsonKey(name: "reserved")  bool reserved)?  $default,) {final _that = this;
switch (_that) {
case _ParkingPlace() when $default != null:
return $default(_that.address,_that.longitude,_that.latitude,_that.geoHash,_that.price,_that.totalPaidPrice,_that.electricChargeStation,_that.reserved);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParkingPlace implements ParkingPlace {
  const _ParkingPlace({@JsonKey(name: "address") required this.address, @JsonKey(name: "longitude") required this.longitude, @JsonKey(name: "latitude") required this.latitude, @JsonKey(name: "geohash") required this.geoHash, @JsonKey(name: "price") required this.price, @JsonKey(name: "total_paid_price") required this.totalPaidPrice, @JsonKey(name: "electric_charge_station") required this.electricChargeStation, @JsonKey(name: "reserved") required this.reserved});
  factory _ParkingPlace.fromJson(Map<String, dynamic> json) => _$ParkingPlaceFromJson(json);

@override@JsonKey(name: "address") final  String address;
@override@JsonKey(name: "longitude") final  double longitude;
@override@JsonKey(name: "latitude") final  double latitude;
@override@JsonKey(name: "geohash") final  String geoHash;
@override@JsonKey(name: "price") final  double price;
@override@JsonKey(name: "total_paid_price") final  double totalPaidPrice;
@override@JsonKey(name: "electric_charge_station") final  bool electricChargeStation;
@override@JsonKey(name: "reserved") final  bool reserved;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParkingPlace&&(identical(other.address, address) || other.address == address)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.geoHash, geoHash) || other.geoHash == geoHash)&&(identical(other.price, price) || other.price == price)&&(identical(other.totalPaidPrice, totalPaidPrice) || other.totalPaidPrice == totalPaidPrice)&&(identical(other.electricChargeStation, electricChargeStation) || other.electricChargeStation == electricChargeStation)&&(identical(other.reserved, reserved) || other.reserved == reserved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,longitude,latitude,geoHash,price,totalPaidPrice,electricChargeStation,reserved);

@override
String toString() {
  return 'ParkingPlace(address: $address, longitude: $longitude, latitude: $latitude, geoHash: $geoHash, price: $price, totalPaidPrice: $totalPaidPrice, electricChargeStation: $electricChargeStation, reserved: $reserved)';
}


}

/// @nodoc
abstract mixin class _$ParkingPlaceCopyWith<$Res> implements $ParkingPlaceCopyWith<$Res> {
  factory _$ParkingPlaceCopyWith(_ParkingPlace value, $Res Function(_ParkingPlace) _then) = __$ParkingPlaceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "address") String address,@JsonKey(name: "longitude") double longitude,@JsonKey(name: "latitude") double latitude,@JsonKey(name: "geohash") String geoHash,@JsonKey(name: "price") double price,@JsonKey(name: "total_paid_price") double totalPaidPrice,@JsonKey(name: "electric_charge_station") bool electricChargeStation,@JsonKey(name: "reserved") bool reserved
});




}
/// @nodoc
class __$ParkingPlaceCopyWithImpl<$Res>
    implements _$ParkingPlaceCopyWith<$Res> {
  __$ParkingPlaceCopyWithImpl(this._self, this._then);

  final _ParkingPlace _self;
  final $Res Function(_ParkingPlace) _then;

/// Create a copy of ParkingPlace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? longitude = null,Object? latitude = null,Object? geoHash = null,Object? price = null,Object? totalPaidPrice = null,Object? electricChargeStation = null,Object? reserved = null,}) {
  return _then(_ParkingPlace(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,geoHash: null == geoHash ? _self.geoHash : geoHash // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,totalPaidPrice: null == totalPaidPrice ? _self.totalPaidPrice : totalPaidPrice // ignore: cast_nullable_to_non_nullable
as double,electricChargeStation: null == electricChargeStation ? _self.electricChargeStation : electricChargeStation // ignore: cast_nullable_to_non_nullable
as bool,reserved: null == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
