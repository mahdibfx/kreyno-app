// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_phone_number_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangePhoneNumberDto {

@JsonKey(name: 'phone') String get phone;@JsonKey(name: 'otp') String get otp;
/// Create a copy of ChangePhoneNumberDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePhoneNumberDtoCopyWith<ChangePhoneNumberDto> get copyWith => _$ChangePhoneNumberDtoCopyWithImpl<ChangePhoneNumberDto>(this as ChangePhoneNumberDto, _$identity);

  /// Serializes this ChangePhoneNumberDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePhoneNumberDto&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,otp);

@override
String toString() {
  return 'ChangePhoneNumberDto(phone: $phone, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $ChangePhoneNumberDtoCopyWith<$Res>  {
  factory $ChangePhoneNumberDtoCopyWith(ChangePhoneNumberDto value, $Res Function(ChangePhoneNumberDto) _then) = _$ChangePhoneNumberDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'phone') String phone,@JsonKey(name: 'otp') String otp
});




}
/// @nodoc
class _$ChangePhoneNumberDtoCopyWithImpl<$Res>
    implements $ChangePhoneNumberDtoCopyWith<$Res> {
  _$ChangePhoneNumberDtoCopyWithImpl(this._self, this._then);

  final ChangePhoneNumberDto _self;
  final $Res Function(ChangePhoneNumberDto) _then;

/// Create a copy of ChangePhoneNumberDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? otp = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangePhoneNumberDto].
extension ChangePhoneNumberDtoPatterns on ChangePhoneNumberDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangePhoneNumberDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangePhoneNumberDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangePhoneNumberDto value)  $default,){
final _that = this;
switch (_that) {
case _ChangePhoneNumberDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangePhoneNumberDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChangePhoneNumberDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'phone')  String phone, @JsonKey(name: 'otp')  String otp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangePhoneNumberDto() when $default != null:
return $default(_that.phone,_that.otp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'phone')  String phone, @JsonKey(name: 'otp')  String otp)  $default,) {final _that = this;
switch (_that) {
case _ChangePhoneNumberDto():
return $default(_that.phone,_that.otp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'phone')  String phone, @JsonKey(name: 'otp')  String otp)?  $default,) {final _that = this;
switch (_that) {
case _ChangePhoneNumberDto() when $default != null:
return $default(_that.phone,_that.otp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangePhoneNumberDto implements ChangePhoneNumberDto {
  const _ChangePhoneNumberDto({@JsonKey(name: 'phone') required this.phone, @JsonKey(name: 'otp') required this.otp});
  factory _ChangePhoneNumberDto.fromJson(Map<String, dynamic> json) => _$ChangePhoneNumberDtoFromJson(json);

@override@JsonKey(name: 'phone') final  String phone;
@override@JsonKey(name: 'otp') final  String otp;

/// Create a copy of ChangePhoneNumberDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePhoneNumberDtoCopyWith<_ChangePhoneNumberDto> get copyWith => __$ChangePhoneNumberDtoCopyWithImpl<_ChangePhoneNumberDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangePhoneNumberDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePhoneNumberDto&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,otp);

@override
String toString() {
  return 'ChangePhoneNumberDto(phone: $phone, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$ChangePhoneNumberDtoCopyWith<$Res> implements $ChangePhoneNumberDtoCopyWith<$Res> {
  factory _$ChangePhoneNumberDtoCopyWith(_ChangePhoneNumberDto value, $Res Function(_ChangePhoneNumberDto) _then) = __$ChangePhoneNumberDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'phone') String phone,@JsonKey(name: 'otp') String otp
});




}
/// @nodoc
class __$ChangePhoneNumberDtoCopyWithImpl<$Res>
    implements _$ChangePhoneNumberDtoCopyWith<$Res> {
  __$ChangePhoneNumberDtoCopyWithImpl(this._self, this._then);

  final _ChangePhoneNumberDto _self;
  final $Res Function(_ChangePhoneNumberDto) _then;

/// Create a copy of ChangePhoneNumberDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? otp = null,}) {
  return _then(_ChangePhoneNumberDto(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
