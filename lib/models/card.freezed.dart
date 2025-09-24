// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Card {

@JsonKey(name: "id") String get id;@JsonKey(name: "brand") String get brand;@JsonKey(name: "last_four") String get last4;@JsonKey(name: "exp_month") String get expMonth;@JsonKey(name: "exp_year") String get expYear;
/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardCopyWith<Card> get copyWith => _$CardCopyWithImpl<Card>(this as Card, _$identity);

  /// Serializes this Card to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Card&&(identical(other.id, id) || other.id == id)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.last4, last4) || other.last4 == last4)&&(identical(other.expMonth, expMonth) || other.expMonth == expMonth)&&(identical(other.expYear, expYear) || other.expYear == expYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brand,last4,expMonth,expYear);

@override
String toString() {
  return 'Card(id: $id, brand: $brand, last4: $last4, expMonth: $expMonth, expYear: $expYear)';
}


}

/// @nodoc
abstract mixin class $CardCopyWith<$Res>  {
  factory $CardCopyWith(Card value, $Res Function(Card) _then) = _$CardCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "brand") String brand,@JsonKey(name: "last_four") String last4,@JsonKey(name: "exp_month") String expMonth,@JsonKey(name: "exp_year") String expYear
});




}
/// @nodoc
class _$CardCopyWithImpl<$Res>
    implements $CardCopyWith<$Res> {
  _$CardCopyWithImpl(this._self, this._then);

  final Card _self;
  final $Res Function(Card) _then;

/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? brand = null,Object? last4 = null,Object? expMonth = null,Object? expYear = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,last4: null == last4 ? _self.last4 : last4 // ignore: cast_nullable_to_non_nullable
as String,expMonth: null == expMonth ? _self.expMonth : expMonth // ignore: cast_nullable_to_non_nullable
as String,expYear: null == expYear ? _self.expYear : expYear // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Card].
extension CardPatterns on Card {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Card value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Card() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Card value)  $default,){
final _that = this;
switch (_that) {
case _Card():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Card value)?  $default,){
final _that = this;
switch (_that) {
case _Card() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "brand")  String brand, @JsonKey(name: "last_four")  String last4, @JsonKey(name: "exp_month")  String expMonth, @JsonKey(name: "exp_year")  String expYear)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Card() when $default != null:
return $default(_that.id,_that.brand,_that.last4,_that.expMonth,_that.expYear);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "brand")  String brand, @JsonKey(name: "last_four")  String last4, @JsonKey(name: "exp_month")  String expMonth, @JsonKey(name: "exp_year")  String expYear)  $default,) {final _that = this;
switch (_that) {
case _Card():
return $default(_that.id,_that.brand,_that.last4,_that.expMonth,_that.expYear);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String id, @JsonKey(name: "brand")  String brand, @JsonKey(name: "last_four")  String last4, @JsonKey(name: "exp_month")  String expMonth, @JsonKey(name: "exp_year")  String expYear)?  $default,) {final _that = this;
switch (_that) {
case _Card() when $default != null:
return $default(_that.id,_that.brand,_that.last4,_that.expMonth,_that.expYear);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Card implements Card {
  const _Card({@JsonKey(name: "id") required this.id, @JsonKey(name: "brand") required this.brand, @JsonKey(name: "last_four") required this.last4, @JsonKey(name: "exp_month") required this.expMonth, @JsonKey(name: "exp_year") required this.expYear});
  factory _Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

@override@JsonKey(name: "id") final  String id;
@override@JsonKey(name: "brand") final  String brand;
@override@JsonKey(name: "last_four") final  String last4;
@override@JsonKey(name: "exp_month") final  String expMonth;
@override@JsonKey(name: "exp_year") final  String expYear;

/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardCopyWith<_Card> get copyWith => __$CardCopyWithImpl<_Card>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Card&&(identical(other.id, id) || other.id == id)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.last4, last4) || other.last4 == last4)&&(identical(other.expMonth, expMonth) || other.expMonth == expMonth)&&(identical(other.expYear, expYear) || other.expYear == expYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brand,last4,expMonth,expYear);

@override
String toString() {
  return 'Card(id: $id, brand: $brand, last4: $last4, expMonth: $expMonth, expYear: $expYear)';
}


}

/// @nodoc
abstract mixin class _$CardCopyWith<$Res> implements $CardCopyWith<$Res> {
  factory _$CardCopyWith(_Card value, $Res Function(_Card) _then) = __$CardCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "brand") String brand,@JsonKey(name: "last_four") String last4,@JsonKey(name: "exp_month") String expMonth,@JsonKey(name: "exp_year") String expYear
});




}
/// @nodoc
class __$CardCopyWithImpl<$Res>
    implements _$CardCopyWith<$Res> {
  __$CardCopyWithImpl(this._self, this._then);

  final _Card _self;
  final $Res Function(_Card) _then;

/// Create a copy of Card
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? brand = null,Object? last4 = null,Object? expMonth = null,Object? expYear = null,}) {
  return _then(_Card(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,last4: null == last4 ? _self.last4 : last4 // ignore: cast_nullable_to_non_nullable
as String,expMonth: null == expMonth ? _self.expMonth : expMonth // ignore: cast_nullable_to_non_nullable
as String,expYear: null == expYear ? _self.expYear : expYear // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
