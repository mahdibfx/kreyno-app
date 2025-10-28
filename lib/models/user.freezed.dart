// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

@JsonKey(name: "id") int get id;@JsonKey(name: "username") String get username;@JsonKey(name: "first_name") String get firstName;@JsonKey(name: "last_name") String get lastName;@JsonKey(name: "phone") String get phone;@JsonKey(name: "email") String get email;@JsonKey(name: "address") String? get address;@JsonKey(name: "birth_date") DateTime get birthDate;@JsonKey(name: "gender") Gender get gender;@JsonKey(name: "has_car") bool get hasVehicle;@JsonKey(name: "has_open_parking_place") bool get isSelling;@JsonKey(name: "has_open_reservation") bool get isBuying;@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)@JsonKey(name: "avatar") Avatar? get avatar;@JsonKey(name: "created_at") DateTime get createdAt;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.hasVehicle, hasVehicle) || other.hasVehicle == hasVehicle)&&(identical(other.isSelling, isSelling) || other.isSelling == isSelling)&&(identical(other.isBuying, isBuying) || other.isBuying == isBuying)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,firstName,lastName,phone,email,address,birthDate,gender,hasVehicle,isSelling,isBuying,avatar,createdAt);

@override
String toString() {
  return 'User(id: $id, username: $username, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, address: $address, birthDate: $birthDate, gender: $gender, hasVehicle: $hasVehicle, isSelling: $isSelling, isBuying: $isBuying, avatar: $avatar, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "username") String username,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName,@JsonKey(name: "phone") String phone,@JsonKey(name: "email") String email,@JsonKey(name: "address") String? address,@JsonKey(name: "birth_date") DateTime birthDate,@JsonKey(name: "gender") Gender gender,@JsonKey(name: "has_car") bool hasVehicle,@JsonKey(name: "has_open_parking_place") bool isSelling,@JsonKey(name: "has_open_reservation") bool isBuying,@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)@JsonKey(name: "avatar") Avatar? avatar,@JsonKey(name: "created_at") DateTime createdAt
});


$AvatarCopyWith<$Res>? get avatar;

}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? firstName = null,Object? lastName = null,Object? phone = null,Object? email = null,Object? address = freezed,Object? birthDate = null,Object? gender = null,Object? hasVehicle = null,Object? isSelling = null,Object? isBuying = null,Object? avatar = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,hasVehicle: null == hasVehicle ? _self.hasVehicle : hasVehicle // ignore: cast_nullable_to_non_nullable
as bool,isSelling: null == isSelling ? _self.isSelling : isSelling // ignore: cast_nullable_to_non_nullable
as bool,isBuying: null == isBuying ? _self.isBuying : isBuying // ignore: cast_nullable_to_non_nullable
as bool,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Avatar?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of User
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


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "username")  String username, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "phone")  String phone, @JsonKey(name: "email")  String email, @JsonKey(name: "address")  String? address, @JsonKey(name: "birth_date")  DateTime birthDate, @JsonKey(name: "gender")  Gender gender, @JsonKey(name: "has_car")  bool hasVehicle, @JsonKey(name: "has_open_parking_place")  bool isSelling, @JsonKey(name: "has_open_reservation")  bool isBuying, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)@JsonKey(name: "avatar")  Avatar? avatar, @JsonKey(name: "created_at")  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.firstName,_that.lastName,_that.phone,_that.email,_that.address,_that.birthDate,_that.gender,_that.hasVehicle,_that.isSelling,_that.isBuying,_that.avatar,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "username")  String username, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "phone")  String phone, @JsonKey(name: "email")  String email, @JsonKey(name: "address")  String? address, @JsonKey(name: "birth_date")  DateTime birthDate, @JsonKey(name: "gender")  Gender gender, @JsonKey(name: "has_car")  bool hasVehicle, @JsonKey(name: "has_open_parking_place")  bool isSelling, @JsonKey(name: "has_open_reservation")  bool isBuying, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)@JsonKey(name: "avatar")  Avatar? avatar, @JsonKey(name: "created_at")  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.username,_that.firstName,_that.lastName,_that.phone,_that.email,_that.address,_that.birthDate,_that.gender,_that.hasVehicle,_that.isSelling,_that.isBuying,_that.avatar,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "username")  String username, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "phone")  String phone, @JsonKey(name: "email")  String email, @JsonKey(name: "address")  String? address, @JsonKey(name: "birth_date")  DateTime birthDate, @JsonKey(name: "gender")  Gender gender, @JsonKey(name: "has_car")  bool hasVehicle, @JsonKey(name: "has_open_parking_place")  bool isSelling, @JsonKey(name: "has_open_reservation")  bool isBuying, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)@JsonKey(name: "avatar")  Avatar? avatar, @JsonKey(name: "created_at")  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.firstName,_that.lastName,_that.phone,_that.email,_that.address,_that.birthDate,_that.gender,_that.hasVehicle,_that.isSelling,_that.isBuying,_that.avatar,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({@JsonKey(name: "id") required this.id, @JsonKey(name: "username") required this.username, @JsonKey(name: "first_name") required this.firstName, @JsonKey(name: "last_name") required this.lastName, @JsonKey(name: "phone") required this.phone, @JsonKey(name: "email") required this.email, @JsonKey(name: "address") this.address, @JsonKey(name: "birth_date") required this.birthDate, @JsonKey(name: "gender") required this.gender, @JsonKey(name: "has_car") required this.hasVehicle, @JsonKey(name: "has_open_parking_place") required this.isSelling, @JsonKey(name: "has_open_reservation") required this.isBuying, @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)@JsonKey(name: "avatar") this.avatar, @JsonKey(name: "created_at") required this.createdAt});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "username") final  String username;
@override@JsonKey(name: "first_name") final  String firstName;
@override@JsonKey(name: "last_name") final  String lastName;
@override@JsonKey(name: "phone") final  String phone;
@override@JsonKey(name: "email") final  String email;
@override@JsonKey(name: "address") final  String? address;
@override@JsonKey(name: "birth_date") final  DateTime birthDate;
@override@JsonKey(name: "gender") final  Gender gender;
@override@JsonKey(name: "has_car") final  bool hasVehicle;
@override@JsonKey(name: "has_open_parking_place") final  bool isSelling;
@override@JsonKey(name: "has_open_reservation") final  bool isBuying;
@override@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)@JsonKey(name: "avatar") final  Avatar? avatar;
@override@JsonKey(name: "created_at") final  DateTime createdAt;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.hasVehicle, hasVehicle) || other.hasVehicle == hasVehicle)&&(identical(other.isSelling, isSelling) || other.isSelling == isSelling)&&(identical(other.isBuying, isBuying) || other.isBuying == isBuying)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,firstName,lastName,phone,email,address,birthDate,gender,hasVehicle,isSelling,isBuying,avatar,createdAt);

@override
String toString() {
  return 'User(id: $id, username: $username, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, address: $address, birthDate: $birthDate, gender: $gender, hasVehicle: $hasVehicle, isSelling: $isSelling, isBuying: $isBuying, avatar: $avatar, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "username") String username,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName,@JsonKey(name: "phone") String phone,@JsonKey(name: "email") String email,@JsonKey(name: "address") String? address,@JsonKey(name: "birth_date") DateTime birthDate,@JsonKey(name: "gender") Gender gender,@JsonKey(name: "has_car") bool hasVehicle,@JsonKey(name: "has_open_parking_place") bool isSelling,@JsonKey(name: "has_open_reservation") bool isBuying,@JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)@JsonKey(name: "avatar") Avatar? avatar,@JsonKey(name: "created_at") DateTime createdAt
});


@override $AvatarCopyWith<$Res>? get avatar;

}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? firstName = null,Object? lastName = null,Object? phone = null,Object? email = null,Object? address = freezed,Object? birthDate = null,Object? gender = null,Object? hasVehicle = null,Object? isSelling = null,Object? isBuying = null,Object? avatar = freezed,Object? createdAt = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,hasVehicle: null == hasVehicle ? _self.hasVehicle : hasVehicle // ignore: cast_nullable_to_non_nullable
as bool,isSelling: null == isSelling ? _self.isSelling : isSelling // ignore: cast_nullable_to_non_nullable
as bool,isBuying: null == isBuying ? _self.isBuying : isBuying // ignore: cast_nullable_to_non_nullable
as bool,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Avatar?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of User
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
