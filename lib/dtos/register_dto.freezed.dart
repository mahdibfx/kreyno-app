// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterDto {

@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName;@JsonKey(name: 'username') String get userName;@JsonKey(name: 'phone') String get phone;@JsonKey(name: 'email') String get email;@JsonKey(name: 'gender') Gender get gender;@JsonKey(name: 'birth_date', toJson: _birthDateToJson, fromJson: _birthDateFromJson) DateTime get birthDate;// @JsonKey(name: 'address', includeIfNull: false) String? address,
@JsonKey(name: 'otp') String get otp;@JsonKey(name: 'device_id') String get deviceId;
/// Create a copy of RegisterDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterDtoCopyWith<RegisterDto> get copyWith => _$RegisterDtoCopyWithImpl<RegisterDto>(this as RegisterDto, _$identity);

  /// Serializes this RegisterDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterDto&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,userName,phone,email,gender,birthDate,otp,deviceId);

@override
String toString() {
  return 'RegisterDto(firstName: $firstName, lastName: $lastName, userName: $userName, phone: $phone, email: $email, gender: $gender, birthDate: $birthDate, otp: $otp, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $RegisterDtoCopyWith<$Res>  {
  factory $RegisterDtoCopyWith(RegisterDto value, $Res Function(RegisterDto) _then) = _$RegisterDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'username') String userName,@JsonKey(name: 'phone') String phone,@JsonKey(name: 'email') String email,@JsonKey(name: 'gender') Gender gender,@JsonKey(name: 'birth_date', toJson: _birthDateToJson, fromJson: _birthDateFromJson) DateTime birthDate,@JsonKey(name: 'otp') String otp,@JsonKey(name: 'device_id') String deviceId
});




}
/// @nodoc
class _$RegisterDtoCopyWithImpl<$Res>
    implements $RegisterDtoCopyWith<$Res> {
  _$RegisterDtoCopyWithImpl(this._self, this._then);

  final RegisterDto _self;
  final $Res Function(RegisterDto) _then;

/// Create a copy of RegisterDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? userName = null,Object? phone = null,Object? email = null,Object? gender = null,Object? birthDate = null,Object? otp = null,Object? deviceId = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterDto].
extension RegisterDtoPatterns on RegisterDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterDto value)  $default,){
final _that = this;
switch (_that) {
case _RegisterDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterDto value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'username')  String userName, @JsonKey(name: 'phone')  String phone, @JsonKey(name: 'email')  String email, @JsonKey(name: 'gender')  Gender gender, @JsonKey(name: 'birth_date', toJson: _birthDateToJson, fromJson: _birthDateFromJson)  DateTime birthDate, @JsonKey(name: 'otp')  String otp, @JsonKey(name: 'device_id')  String deviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterDto() when $default != null:
return $default(_that.firstName,_that.lastName,_that.userName,_that.phone,_that.email,_that.gender,_that.birthDate,_that.otp,_that.deviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'username')  String userName, @JsonKey(name: 'phone')  String phone, @JsonKey(name: 'email')  String email, @JsonKey(name: 'gender')  Gender gender, @JsonKey(name: 'birth_date', toJson: _birthDateToJson, fromJson: _birthDateFromJson)  DateTime birthDate, @JsonKey(name: 'otp')  String otp, @JsonKey(name: 'device_id')  String deviceId)  $default,) {final _that = this;
switch (_that) {
case _RegisterDto():
return $default(_that.firstName,_that.lastName,_that.userName,_that.phone,_that.email,_that.gender,_that.birthDate,_that.otp,_that.deviceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'username')  String userName, @JsonKey(name: 'phone')  String phone, @JsonKey(name: 'email')  String email, @JsonKey(name: 'gender')  Gender gender, @JsonKey(name: 'birth_date', toJson: _birthDateToJson, fromJson: _birthDateFromJson)  DateTime birthDate, @JsonKey(name: 'otp')  String otp, @JsonKey(name: 'device_id')  String deviceId)?  $default,) {final _that = this;
switch (_that) {
case _RegisterDto() when $default != null:
return $default(_that.firstName,_that.lastName,_that.userName,_that.phone,_that.email,_that.gender,_that.birthDate,_that.otp,_that.deviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterDto implements RegisterDto {
  const _RegisterDto({@JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, @JsonKey(name: 'username') required this.userName, @JsonKey(name: 'phone') required this.phone, @JsonKey(name: 'email') required this.email, @JsonKey(name: 'gender') required this.gender, @JsonKey(name: 'birth_date', toJson: _birthDateToJson, fromJson: _birthDateFromJson) required this.birthDate, @JsonKey(name: 'otp') required this.otp, @JsonKey(name: 'device_id') required this.deviceId});
  factory _RegisterDto.fromJson(Map<String, dynamic> json) => _$RegisterDtoFromJson(json);

@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey(name: 'username') final  String userName;
@override@JsonKey(name: 'phone') final  String phone;
@override@JsonKey(name: 'email') final  String email;
@override@JsonKey(name: 'gender') final  Gender gender;
@override@JsonKey(name: 'birth_date', toJson: _birthDateToJson, fromJson: _birthDateFromJson) final  DateTime birthDate;
// @JsonKey(name: 'address', includeIfNull: false) String? address,
@override@JsonKey(name: 'otp') final  String otp;
@override@JsonKey(name: 'device_id') final  String deviceId;

/// Create a copy of RegisterDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterDtoCopyWith<_RegisterDto> get copyWith => __$RegisterDtoCopyWithImpl<_RegisterDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterDto&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,userName,phone,email,gender,birthDate,otp,deviceId);

@override
String toString() {
  return 'RegisterDto(firstName: $firstName, lastName: $lastName, userName: $userName, phone: $phone, email: $email, gender: $gender, birthDate: $birthDate, otp: $otp, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class _$RegisterDtoCopyWith<$Res> implements $RegisterDtoCopyWith<$Res> {
  factory _$RegisterDtoCopyWith(_RegisterDto value, $Res Function(_RegisterDto) _then) = __$RegisterDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'username') String userName,@JsonKey(name: 'phone') String phone,@JsonKey(name: 'email') String email,@JsonKey(name: 'gender') Gender gender,@JsonKey(name: 'birth_date', toJson: _birthDateToJson, fromJson: _birthDateFromJson) DateTime birthDate,@JsonKey(name: 'otp') String otp,@JsonKey(name: 'device_id') String deviceId
});




}
/// @nodoc
class __$RegisterDtoCopyWithImpl<$Res>
    implements _$RegisterDtoCopyWith<$Res> {
  __$RegisterDtoCopyWithImpl(this._self, this._then);

  final _RegisterDto _self;
  final $Res Function(_RegisterDto) _then;

/// Create a copy of RegisterDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? userName = null,Object? phone = null,Object? email = null,Object? gender = null,Object? birthDate = null,Object? otp = null,Object? deviceId = null,}) {
  return _then(_RegisterDto(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
