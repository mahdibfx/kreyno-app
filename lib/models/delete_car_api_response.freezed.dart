// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_car_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteCarApiResponse {

@JsonKey(name: 'car_id') int get carId;
/// Create a copy of DeleteCarApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteCarApiResponseCopyWith<DeleteCarApiResponse> get copyWith => _$DeleteCarApiResponseCopyWithImpl<DeleteCarApiResponse>(this as DeleteCarApiResponse, _$identity);

  /// Serializes this DeleteCarApiResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteCarApiResponse&&(identical(other.carId, carId) || other.carId == carId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,carId);

@override
String toString() {
  return 'DeleteCarApiResponse(carId: $carId)';
}


}

/// @nodoc
abstract mixin class $DeleteCarApiResponseCopyWith<$Res>  {
  factory $DeleteCarApiResponseCopyWith(DeleteCarApiResponse value, $Res Function(DeleteCarApiResponse) _then) = _$DeleteCarApiResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'car_id') int carId
});




}
/// @nodoc
class _$DeleteCarApiResponseCopyWithImpl<$Res>
    implements $DeleteCarApiResponseCopyWith<$Res> {
  _$DeleteCarApiResponseCopyWithImpl(this._self, this._then);

  final DeleteCarApiResponse _self;
  final $Res Function(DeleteCarApiResponse) _then;

/// Create a copy of DeleteCarApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? carId = null,}) {
  return _then(_self.copyWith(
carId: null == carId ? _self.carId : carId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteCarApiResponse].
extension DeleteCarApiResponsePatterns on DeleteCarApiResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteCarApiResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteCarApiResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteCarApiResponse value)  $default,){
final _that = this;
switch (_that) {
case _DeleteCarApiResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteCarApiResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteCarApiResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'car_id')  int carId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteCarApiResponse() when $default != null:
return $default(_that.carId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'car_id')  int carId)  $default,) {final _that = this;
switch (_that) {
case _DeleteCarApiResponse():
return $default(_that.carId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'car_id')  int carId)?  $default,) {final _that = this;
switch (_that) {
case _DeleteCarApiResponse() when $default != null:
return $default(_that.carId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeleteCarApiResponse implements DeleteCarApiResponse {
  const _DeleteCarApiResponse({@JsonKey(name: 'car_id') required this.carId});
  factory _DeleteCarApiResponse.fromJson(Map<String, dynamic> json) => _$DeleteCarApiResponseFromJson(json);

@override@JsonKey(name: 'car_id') final  int carId;

/// Create a copy of DeleteCarApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCarApiResponseCopyWith<_DeleteCarApiResponse> get copyWith => __$DeleteCarApiResponseCopyWithImpl<_DeleteCarApiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteCarApiResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteCarApiResponse&&(identical(other.carId, carId) || other.carId == carId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,carId);

@override
String toString() {
  return 'DeleteCarApiResponse(carId: $carId)';
}


}

/// @nodoc
abstract mixin class _$DeleteCarApiResponseCopyWith<$Res> implements $DeleteCarApiResponseCopyWith<$Res> {
  factory _$DeleteCarApiResponseCopyWith(_DeleteCarApiResponse value, $Res Function(_DeleteCarApiResponse) _then) = __$DeleteCarApiResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'car_id') int carId
});




}
/// @nodoc
class __$DeleteCarApiResponseCopyWithImpl<$Res>
    implements _$DeleteCarApiResponseCopyWith<$Res> {
  __$DeleteCarApiResponseCopyWithImpl(this._self, this._then);

  final _DeleteCarApiResponse _self;
  final $Res Function(_DeleteCarApiResponse) _then;

/// Create a copy of DeleteCarApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? carId = null,}) {
  return _then(_DeleteCarApiResponse(
carId: null == carId ? _self.carId : carId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
