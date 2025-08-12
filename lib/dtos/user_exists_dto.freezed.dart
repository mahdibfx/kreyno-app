// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_exists_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserExistsDto {

@JsonKey(name: 'phone') String get phone;
/// Create a copy of UserExistsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserExistsDtoCopyWith<UserExistsDto> get copyWith => _$UserExistsDtoCopyWithImpl<UserExistsDto>(this as UserExistsDto, _$identity);

  /// Serializes this UserExistsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserExistsDto&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'UserExistsDto(phone: $phone)';
}


}

/// @nodoc
abstract mixin class $UserExistsDtoCopyWith<$Res>  {
  factory $UserExistsDtoCopyWith(UserExistsDto value, $Res Function(UserExistsDto) _then) = _$UserExistsDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'phone') String phone
});




}
/// @nodoc
class _$UserExistsDtoCopyWithImpl<$Res>
    implements $UserExistsDtoCopyWith<$Res> {
  _$UserExistsDtoCopyWithImpl(this._self, this._then);

  final UserExistsDto _self;
  final $Res Function(UserExistsDto) _then;

/// Create a copy of UserExistsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserExistsDto].
extension UserExistsDtoPatterns on UserExistsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserExistsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserExistsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserExistsDto value)  $default,){
final _that = this;
switch (_that) {
case _UserExistsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserExistsDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserExistsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'phone')  String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserExistsDto() when $default != null:
return $default(_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'phone')  String phone)  $default,) {final _that = this;
switch (_that) {
case _UserExistsDto():
return $default(_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'phone')  String phone)?  $default,) {final _that = this;
switch (_that) {
case _UserExistsDto() when $default != null:
return $default(_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserExistsDto implements UserExistsDto {
  const _UserExistsDto({@JsonKey(name: 'phone') required this.phone});
  factory _UserExistsDto.fromJson(Map<String, dynamic> json) => _$UserExistsDtoFromJson(json);

@override@JsonKey(name: 'phone') final  String phone;

/// Create a copy of UserExistsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserExistsDtoCopyWith<_UserExistsDto> get copyWith => __$UserExistsDtoCopyWithImpl<_UserExistsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserExistsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserExistsDto&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'UserExistsDto(phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$UserExistsDtoCopyWith<$Res> implements $UserExistsDtoCopyWith<$Res> {
  factory _$UserExistsDtoCopyWith(_UserExistsDto value, $Res Function(_UserExistsDto) _then) = __$UserExistsDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'phone') String phone
});




}
/// @nodoc
class __$UserExistsDtoCopyWithImpl<$Res>
    implements _$UserExistsDtoCopyWith<$Res> {
  __$UserExistsDtoCopyWithImpl(this._self, this._then);

  final _UserExistsDto _self;
  final $Res Function(_UserExistsDto) _then;

/// Create a copy of UserExistsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(_UserExistsDto(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
