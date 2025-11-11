// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WithdrawDto {

@JsonKey(name: 'amount') double get amount;
/// Create a copy of WithdrawDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WithdrawDtoCopyWith<WithdrawDto> get copyWith => _$WithdrawDtoCopyWithImpl<WithdrawDto>(this as WithdrawDto, _$identity);

  /// Serializes this WithdrawDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WithdrawDto&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'WithdrawDto(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $WithdrawDtoCopyWith<$Res>  {
  factory $WithdrawDtoCopyWith(WithdrawDto value, $Res Function(WithdrawDto) _then) = _$WithdrawDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'amount') double amount
});




}
/// @nodoc
class _$WithdrawDtoCopyWithImpl<$Res>
    implements $WithdrawDtoCopyWith<$Res> {
  _$WithdrawDtoCopyWithImpl(this._self, this._then);

  final WithdrawDto _self;
  final $Res Function(WithdrawDto) _then;

/// Create a copy of WithdrawDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [WithdrawDto].
extension WithdrawDtoPatterns on WithdrawDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WithdrawDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WithdrawDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WithdrawDto value)  $default,){
final _that = this;
switch (_that) {
case _WithdrawDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WithdrawDto value)?  $default,){
final _that = this;
switch (_that) {
case _WithdrawDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'amount')  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WithdrawDto() when $default != null:
return $default(_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'amount')  double amount)  $default,) {final _that = this;
switch (_that) {
case _WithdrawDto():
return $default(_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'amount')  double amount)?  $default,) {final _that = this;
switch (_that) {
case _WithdrawDto() when $default != null:
return $default(_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WithdrawDto implements WithdrawDto {
  const _WithdrawDto({@JsonKey(name: 'amount') required this.amount});
  factory _WithdrawDto.fromJson(Map<String, dynamic> json) => _$WithdrawDtoFromJson(json);

@override@JsonKey(name: 'amount') final  double amount;

/// Create a copy of WithdrawDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WithdrawDtoCopyWith<_WithdrawDto> get copyWith => __$WithdrawDtoCopyWithImpl<_WithdrawDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WithdrawDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WithdrawDto&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'WithdrawDto(amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$WithdrawDtoCopyWith<$Res> implements $WithdrawDtoCopyWith<$Res> {
  factory _$WithdrawDtoCopyWith(_WithdrawDto value, $Res Function(_WithdrawDto) _then) = __$WithdrawDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'amount') double amount
});




}
/// @nodoc
class __$WithdrawDtoCopyWithImpl<$Res>
    implements _$WithdrawDtoCopyWith<$Res> {
  __$WithdrawDtoCopyWithImpl(this._self, this._then);

  final _WithdrawDto _self;
  final $Res Function(_WithdrawDto) _then;

/// Create a copy of WithdrawDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(_WithdrawDto(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
