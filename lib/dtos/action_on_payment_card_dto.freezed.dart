// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_on_payment_card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActionOnPaymentCardDto {

@JsonKey(name: "payment_method") String get paymentMethodId;
/// Create a copy of ActionOnPaymentCardDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionOnPaymentCardDtoCopyWith<ActionOnPaymentCardDto> get copyWith => _$ActionOnPaymentCardDtoCopyWithImpl<ActionOnPaymentCardDto>(this as ActionOnPaymentCardDto, _$identity);

  /// Serializes this ActionOnPaymentCardDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionOnPaymentCardDto&&(identical(other.paymentMethodId, paymentMethodId) || other.paymentMethodId == paymentMethodId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentMethodId);

@override
String toString() {
  return 'ActionOnPaymentCardDto(paymentMethodId: $paymentMethodId)';
}


}

/// @nodoc
abstract mixin class $ActionOnPaymentCardDtoCopyWith<$Res>  {
  factory $ActionOnPaymentCardDtoCopyWith(ActionOnPaymentCardDto value, $Res Function(ActionOnPaymentCardDto) _then) = _$ActionOnPaymentCardDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "payment_method") String paymentMethodId
});




}
/// @nodoc
class _$ActionOnPaymentCardDtoCopyWithImpl<$Res>
    implements $ActionOnPaymentCardDtoCopyWith<$Res> {
  _$ActionOnPaymentCardDtoCopyWithImpl(this._self, this._then);

  final ActionOnPaymentCardDto _self;
  final $Res Function(ActionOnPaymentCardDto) _then;

/// Create a copy of ActionOnPaymentCardDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentMethodId = null,}) {
  return _then(_self.copyWith(
paymentMethodId: null == paymentMethodId ? _self.paymentMethodId : paymentMethodId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ActionOnPaymentCardDto].
extension ActionOnPaymentCardDtoPatterns on ActionOnPaymentCardDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActionOnPaymentCardDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActionOnPaymentCardDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActionOnPaymentCardDto value)  $default,){
final _that = this;
switch (_that) {
case _ActionOnPaymentCardDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActionOnPaymentCardDto value)?  $default,){
final _that = this;
switch (_that) {
case _ActionOnPaymentCardDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "payment_method")  String paymentMethodId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActionOnPaymentCardDto() when $default != null:
return $default(_that.paymentMethodId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "payment_method")  String paymentMethodId)  $default,) {final _that = this;
switch (_that) {
case _ActionOnPaymentCardDto():
return $default(_that.paymentMethodId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "payment_method")  String paymentMethodId)?  $default,) {final _that = this;
switch (_that) {
case _ActionOnPaymentCardDto() when $default != null:
return $default(_that.paymentMethodId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActionOnPaymentCardDto implements ActionOnPaymentCardDto {
  const _ActionOnPaymentCardDto({@JsonKey(name: "payment_method") required this.paymentMethodId});
  factory _ActionOnPaymentCardDto.fromJson(Map<String, dynamic> json) => _$ActionOnPaymentCardDtoFromJson(json);

@override@JsonKey(name: "payment_method") final  String paymentMethodId;

/// Create a copy of ActionOnPaymentCardDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionOnPaymentCardDtoCopyWith<_ActionOnPaymentCardDto> get copyWith => __$ActionOnPaymentCardDtoCopyWithImpl<_ActionOnPaymentCardDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActionOnPaymentCardDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionOnPaymentCardDto&&(identical(other.paymentMethodId, paymentMethodId) || other.paymentMethodId == paymentMethodId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentMethodId);

@override
String toString() {
  return 'ActionOnPaymentCardDto(paymentMethodId: $paymentMethodId)';
}


}

/// @nodoc
abstract mixin class _$ActionOnPaymentCardDtoCopyWith<$Res> implements $ActionOnPaymentCardDtoCopyWith<$Res> {
  factory _$ActionOnPaymentCardDtoCopyWith(_ActionOnPaymentCardDto value, $Res Function(_ActionOnPaymentCardDto) _then) = __$ActionOnPaymentCardDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "payment_method") String paymentMethodId
});




}
/// @nodoc
class __$ActionOnPaymentCardDtoCopyWithImpl<$Res>
    implements _$ActionOnPaymentCardDtoCopyWith<$Res> {
  __$ActionOnPaymentCardDtoCopyWithImpl(this._self, this._then);

  final _ActionOnPaymentCardDto _self;
  final $Res Function(_ActionOnPaymentCardDto) _then;

/// Create a copy of ActionOnPaymentCardDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentMethodId = null,}) {
  return _then(_ActionOnPaymentCardDto(
paymentMethodId: null == paymentMethodId ? _self.paymentMethodId : paymentMethodId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
