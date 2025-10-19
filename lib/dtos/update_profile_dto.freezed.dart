// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateProfileDto {

@JsonKey(name: 'first_name', includeIfNull: false) String? get firstName;@JsonKey(name: 'last_name', includeIfNull: false) String? get lastName;@JsonKey(name: 'email', includeIfNull: false) String? get email;@JsonKey(name: 'gender', includeIfNull: false) Gender? get gender;@JsonKey(name: 'birth_date', includeIfNull: false) DateTime? get birthDate;
/// Create a copy of UpdateProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileDtoCopyWith<UpdateProfileDto> get copyWith => _$UpdateProfileDtoCopyWithImpl<UpdateProfileDto>(this as UpdateProfileDto, _$identity);

  /// Serializes this UpdateProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileDto&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,gender,birthDate);

@override
String toString() {
  return 'UpdateProfileDto(firstName: $firstName, lastName: $lastName, email: $email, gender: $gender, birthDate: $birthDate)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileDtoCopyWith<$Res>  {
  factory $UpdateProfileDtoCopyWith(UpdateProfileDto value, $Res Function(UpdateProfileDto) _then) = _$UpdateProfileDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first_name', includeIfNull: false) String? firstName,@JsonKey(name: 'last_name', includeIfNull: false) String? lastName,@JsonKey(name: 'email', includeIfNull: false) String? email,@JsonKey(name: 'gender', includeIfNull: false) Gender? gender,@JsonKey(name: 'birth_date', includeIfNull: false) DateTime? birthDate
});




}
/// @nodoc
class _$UpdateProfileDtoCopyWithImpl<$Res>
    implements $UpdateProfileDtoCopyWith<$Res> {
  _$UpdateProfileDtoCopyWithImpl(this._self, this._then);

  final UpdateProfileDto _self;
  final $Res Function(UpdateProfileDto) _then;

/// Create a copy of UpdateProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? gender = freezed,Object? birthDate = freezed,}) {
  return _then(_self.copyWith(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateProfileDto].
extension UpdateProfileDtoPatterns on UpdateProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name', includeIfNull: false)  String? firstName, @JsonKey(name: 'last_name', includeIfNull: false)  String? lastName, @JsonKey(name: 'email', includeIfNull: false)  String? email, @JsonKey(name: 'gender', includeIfNull: false)  Gender? gender, @JsonKey(name: 'birth_date', includeIfNull: false)  DateTime? birthDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileDto() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.gender,_that.birthDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name', includeIfNull: false)  String? firstName, @JsonKey(name: 'last_name', includeIfNull: false)  String? lastName, @JsonKey(name: 'email', includeIfNull: false)  String? email, @JsonKey(name: 'gender', includeIfNull: false)  Gender? gender, @JsonKey(name: 'birth_date', includeIfNull: false)  DateTime? birthDate)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileDto():
return $default(_that.firstName,_that.lastName,_that.email,_that.gender,_that.birthDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first_name', includeIfNull: false)  String? firstName, @JsonKey(name: 'last_name', includeIfNull: false)  String? lastName, @JsonKey(name: 'email', includeIfNull: false)  String? email, @JsonKey(name: 'gender', includeIfNull: false)  Gender? gender, @JsonKey(name: 'birth_date', includeIfNull: false)  DateTime? birthDate)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileDto() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.gender,_that.birthDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateProfileDto implements UpdateProfileDto {
  const _UpdateProfileDto({@JsonKey(name: 'first_name', includeIfNull: false) this.firstName, @JsonKey(name: 'last_name', includeIfNull: false) this.lastName, @JsonKey(name: 'email', includeIfNull: false) this.email, @JsonKey(name: 'gender', includeIfNull: false) this.gender, @JsonKey(name: 'birth_date', includeIfNull: false) this.birthDate});
  factory _UpdateProfileDto.fromJson(Map<String, dynamic> json) => _$UpdateProfileDtoFromJson(json);

@override@JsonKey(name: 'first_name', includeIfNull: false) final  String? firstName;
@override@JsonKey(name: 'last_name', includeIfNull: false) final  String? lastName;
@override@JsonKey(name: 'email', includeIfNull: false) final  String? email;
@override@JsonKey(name: 'gender', includeIfNull: false) final  Gender? gender;
@override@JsonKey(name: 'birth_date', includeIfNull: false) final  DateTime? birthDate;

/// Create a copy of UpdateProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileDtoCopyWith<_UpdateProfileDto> get copyWith => __$UpdateProfileDtoCopyWithImpl<_UpdateProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileDto&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,gender,birthDate);

@override
String toString() {
  return 'UpdateProfileDto(firstName: $firstName, lastName: $lastName, email: $email, gender: $gender, birthDate: $birthDate)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileDtoCopyWith<$Res> implements $UpdateProfileDtoCopyWith<$Res> {
  factory _$UpdateProfileDtoCopyWith(_UpdateProfileDto value, $Res Function(_UpdateProfileDto) _then) = __$UpdateProfileDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first_name', includeIfNull: false) String? firstName,@JsonKey(name: 'last_name', includeIfNull: false) String? lastName,@JsonKey(name: 'email', includeIfNull: false) String? email,@JsonKey(name: 'gender', includeIfNull: false) Gender? gender,@JsonKey(name: 'birth_date', includeIfNull: false) DateTime? birthDate
});




}
/// @nodoc
class __$UpdateProfileDtoCopyWithImpl<$Res>
    implements _$UpdateProfileDtoCopyWith<$Res> {
  __$UpdateProfileDtoCopyWithImpl(this._self, this._then);

  final _UpdateProfileDto _self;
  final $Res Function(_UpdateProfileDto) _then;

/// Create a copy of UpdateProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? gender = freezed,Object? birthDate = freezed,}) {
  return _then(_UpdateProfileDto(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
