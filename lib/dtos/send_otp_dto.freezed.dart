// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendOtpDto {

@JsonKey(name: 'phone') String get phoneNumber;
/// Create a copy of SendOtpDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendOtpDtoCopyWith<SendOtpDto> get copyWith => _$SendOtpDtoCopyWithImpl<SendOtpDto>(this as SendOtpDto, _$identity);

  /// Serializes this SendOtpDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOtpDto&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber);

@override
String toString() {
  return 'SendOtpDto(phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $SendOtpDtoCopyWith<$Res>  {
  factory $SendOtpDtoCopyWith(SendOtpDto value, $Res Function(SendOtpDto) _then) = _$SendOtpDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'phone') String phoneNumber
});




}
/// @nodoc
class _$SendOtpDtoCopyWithImpl<$Res>
    implements $SendOtpDtoCopyWith<$Res> {
  _$SendOtpDtoCopyWithImpl(this._self, this._then);

  final SendOtpDto _self;
  final $Res Function(SendOtpDto) _then;

/// Create a copy of SendOtpDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumber = null,}) {
  return _then(_self.copyWith(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SendOtpDto].
extension SendOtpDtoPatterns on SendOtpDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendOtpDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendOtpDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendOtpDto value)  $default,){
final _that = this;
switch (_that) {
case _SendOtpDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendOtpDto value)?  $default,){
final _that = this;
switch (_that) {
case _SendOtpDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'phone')  String phoneNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendOtpDto() when $default != null:
return $default(_that.phoneNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'phone')  String phoneNumber)  $default,) {final _that = this;
switch (_that) {
case _SendOtpDto():
return $default(_that.phoneNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'phone')  String phoneNumber)?  $default,) {final _that = this;
switch (_that) {
case _SendOtpDto() when $default != null:
return $default(_that.phoneNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendOtpDto implements SendOtpDto {
  const _SendOtpDto({@JsonKey(name: 'phone') required this.phoneNumber});
  factory _SendOtpDto.fromJson(Map<String, dynamic> json) => _$SendOtpDtoFromJson(json);

@override@JsonKey(name: 'phone') final  String phoneNumber;

/// Create a copy of SendOtpDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendOtpDtoCopyWith<_SendOtpDto> get copyWith => __$SendOtpDtoCopyWithImpl<_SendOtpDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendOtpDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendOtpDto&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber);

@override
String toString() {
  return 'SendOtpDto(phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$SendOtpDtoCopyWith<$Res> implements $SendOtpDtoCopyWith<$Res> {
  factory _$SendOtpDtoCopyWith(_SendOtpDto value, $Res Function(_SendOtpDto) _then) = __$SendOtpDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'phone') String phoneNumber
});




}
/// @nodoc
class __$SendOtpDtoCopyWithImpl<$Res>
    implements _$SendOtpDtoCopyWith<$Res> {
  __$SendOtpDtoCopyWithImpl(this._self, this._then);

  final _SendOtpDto _self;
  final $Res Function(_SendOtpDto) _then;

/// Create a copy of SendOtpDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,}) {
  return _then(_SendOtpDto(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
