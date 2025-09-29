// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_stripe_account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateStripeAccountDto {

@JsonKey(name: "country") String get country;@JsonKey(name: "street") String get street;@JsonKey(name: "city") String get city;@JsonKey(name: "state") String get state;@JsonKey(name: "postal_code") String get postalCode;@JsonKey(name: "account_number") String get accountNumber;@JsonKey(name: "routing_number") String get routingNumber;@JsonKey(name: "account_holder_name") String get accountHolderName;
/// Create a copy of CreateStripeAccountDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateStripeAccountDtoCopyWith<CreateStripeAccountDto> get copyWith => _$CreateStripeAccountDtoCopyWithImpl<CreateStripeAccountDto>(this as CreateStripeAccountDto, _$identity);

  /// Serializes this CreateStripeAccountDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateStripeAccountDto&&(identical(other.country, country) || other.country == country)&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.routingNumber, routingNumber) || other.routingNumber == routingNumber)&&(identical(other.accountHolderName, accountHolderName) || other.accountHolderName == accountHolderName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country,street,city,state,postalCode,accountNumber,routingNumber,accountHolderName);

@override
String toString() {
  return 'CreateStripeAccountDto(country: $country, street: $street, city: $city, state: $state, postalCode: $postalCode, accountNumber: $accountNumber, routingNumber: $routingNumber, accountHolderName: $accountHolderName)';
}


}

/// @nodoc
abstract mixin class $CreateStripeAccountDtoCopyWith<$Res>  {
  factory $CreateStripeAccountDtoCopyWith(CreateStripeAccountDto value, $Res Function(CreateStripeAccountDto) _then) = _$CreateStripeAccountDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "country") String country,@JsonKey(name: "street") String street,@JsonKey(name: "city") String city,@JsonKey(name: "state") String state,@JsonKey(name: "postal_code") String postalCode,@JsonKey(name: "account_number") String accountNumber,@JsonKey(name: "routing_number") String routingNumber,@JsonKey(name: "account_holder_name") String accountHolderName
});




}
/// @nodoc
class _$CreateStripeAccountDtoCopyWithImpl<$Res>
    implements $CreateStripeAccountDtoCopyWith<$Res> {
  _$CreateStripeAccountDtoCopyWithImpl(this._self, this._then);

  final CreateStripeAccountDto _self;
  final $Res Function(CreateStripeAccountDto) _then;

/// Create a copy of CreateStripeAccountDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? country = null,Object? street = null,Object? city = null,Object? state = null,Object? postalCode = null,Object? accountNumber = null,Object? routingNumber = null,Object? accountHolderName = null,}) {
  return _then(_self.copyWith(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,routingNumber: null == routingNumber ? _self.routingNumber : routingNumber // ignore: cast_nullable_to_non_nullable
as String,accountHolderName: null == accountHolderName ? _self.accountHolderName : accountHolderName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateStripeAccountDto].
extension CreateStripeAccountDtoPatterns on CreateStripeAccountDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateStripeAccountDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateStripeAccountDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateStripeAccountDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateStripeAccountDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateStripeAccountDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateStripeAccountDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "country")  String country, @JsonKey(name: "street")  String street, @JsonKey(name: "city")  String city, @JsonKey(name: "state")  String state, @JsonKey(name: "postal_code")  String postalCode, @JsonKey(name: "account_number")  String accountNumber, @JsonKey(name: "routing_number")  String routingNumber, @JsonKey(name: "account_holder_name")  String accountHolderName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateStripeAccountDto() when $default != null:
return $default(_that.country,_that.street,_that.city,_that.state,_that.postalCode,_that.accountNumber,_that.routingNumber,_that.accountHolderName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "country")  String country, @JsonKey(name: "street")  String street, @JsonKey(name: "city")  String city, @JsonKey(name: "state")  String state, @JsonKey(name: "postal_code")  String postalCode, @JsonKey(name: "account_number")  String accountNumber, @JsonKey(name: "routing_number")  String routingNumber, @JsonKey(name: "account_holder_name")  String accountHolderName)  $default,) {final _that = this;
switch (_that) {
case _CreateStripeAccountDto():
return $default(_that.country,_that.street,_that.city,_that.state,_that.postalCode,_that.accountNumber,_that.routingNumber,_that.accountHolderName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "country")  String country, @JsonKey(name: "street")  String street, @JsonKey(name: "city")  String city, @JsonKey(name: "state")  String state, @JsonKey(name: "postal_code")  String postalCode, @JsonKey(name: "account_number")  String accountNumber, @JsonKey(name: "routing_number")  String routingNumber, @JsonKey(name: "account_holder_name")  String accountHolderName)?  $default,) {final _that = this;
switch (_that) {
case _CreateStripeAccountDto() when $default != null:
return $default(_that.country,_that.street,_that.city,_that.state,_that.postalCode,_that.accountNumber,_that.routingNumber,_that.accountHolderName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateStripeAccountDto implements CreateStripeAccountDto {
  const _CreateStripeAccountDto({@JsonKey(name: "country") required this.country, @JsonKey(name: "street") required this.street, @JsonKey(name: "city") required this.city, @JsonKey(name: "state") required this.state, @JsonKey(name: "postal_code") required this.postalCode, @JsonKey(name: "account_number") required this.accountNumber, @JsonKey(name: "routing_number") required this.routingNumber, @JsonKey(name: "account_holder_name") required this.accountHolderName});
  factory _CreateStripeAccountDto.fromJson(Map<String, dynamic> json) => _$CreateStripeAccountDtoFromJson(json);

@override@JsonKey(name: "country") final  String country;
@override@JsonKey(name: "street") final  String street;
@override@JsonKey(name: "city") final  String city;
@override@JsonKey(name: "state") final  String state;
@override@JsonKey(name: "postal_code") final  String postalCode;
@override@JsonKey(name: "account_number") final  String accountNumber;
@override@JsonKey(name: "routing_number") final  String routingNumber;
@override@JsonKey(name: "account_holder_name") final  String accountHolderName;

/// Create a copy of CreateStripeAccountDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateStripeAccountDtoCopyWith<_CreateStripeAccountDto> get copyWith => __$CreateStripeAccountDtoCopyWithImpl<_CreateStripeAccountDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateStripeAccountDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateStripeAccountDto&&(identical(other.country, country) || other.country == country)&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.routingNumber, routingNumber) || other.routingNumber == routingNumber)&&(identical(other.accountHolderName, accountHolderName) || other.accountHolderName == accountHolderName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country,street,city,state,postalCode,accountNumber,routingNumber,accountHolderName);

@override
String toString() {
  return 'CreateStripeAccountDto(country: $country, street: $street, city: $city, state: $state, postalCode: $postalCode, accountNumber: $accountNumber, routingNumber: $routingNumber, accountHolderName: $accountHolderName)';
}


}

/// @nodoc
abstract mixin class _$CreateStripeAccountDtoCopyWith<$Res> implements $CreateStripeAccountDtoCopyWith<$Res> {
  factory _$CreateStripeAccountDtoCopyWith(_CreateStripeAccountDto value, $Res Function(_CreateStripeAccountDto) _then) = __$CreateStripeAccountDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "country") String country,@JsonKey(name: "street") String street,@JsonKey(name: "city") String city,@JsonKey(name: "state") String state,@JsonKey(name: "postal_code") String postalCode,@JsonKey(name: "account_number") String accountNumber,@JsonKey(name: "routing_number") String routingNumber,@JsonKey(name: "account_holder_name") String accountHolderName
});




}
/// @nodoc
class __$CreateStripeAccountDtoCopyWithImpl<$Res>
    implements _$CreateStripeAccountDtoCopyWith<$Res> {
  __$CreateStripeAccountDtoCopyWithImpl(this._self, this._then);

  final _CreateStripeAccountDto _self;
  final $Res Function(_CreateStripeAccountDto) _then;

/// Create a copy of CreateStripeAccountDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? country = null,Object? street = null,Object? city = null,Object? state = null,Object? postalCode = null,Object? accountNumber = null,Object? routingNumber = null,Object? accountHolderName = null,}) {
  return _then(_CreateStripeAccountDto(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,routingNumber: null == routingNumber ? _self.routingNumber : routingNumber // ignore: cast_nullable_to_non_nullable
as String,accountHolderName: null == accountHolderName ? _self.accountHolderName : accountHolderName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
