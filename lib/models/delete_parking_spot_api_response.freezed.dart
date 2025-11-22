// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_parking_spot_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteParkingSpotApiResponse {

@JsonKey(name: 'parkingPlace_id') int get parkingSpotId;
/// Create a copy of DeleteParkingSpotApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteParkingSpotApiResponseCopyWith<DeleteParkingSpotApiResponse> get copyWith => _$DeleteParkingSpotApiResponseCopyWithImpl<DeleteParkingSpotApiResponse>(this as DeleteParkingSpotApiResponse, _$identity);

  /// Serializes this DeleteParkingSpotApiResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteParkingSpotApiResponse&&(identical(other.parkingSpotId, parkingSpotId) || other.parkingSpotId == parkingSpotId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parkingSpotId);

@override
String toString() {
  return 'DeleteParkingSpotApiResponse(parkingSpotId: $parkingSpotId)';
}


}

/// @nodoc
abstract mixin class $DeleteParkingSpotApiResponseCopyWith<$Res>  {
  factory $DeleteParkingSpotApiResponseCopyWith(DeleteParkingSpotApiResponse value, $Res Function(DeleteParkingSpotApiResponse) _then) = _$DeleteParkingSpotApiResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'parkingPlace_id') int parkingSpotId
});




}
/// @nodoc
class _$DeleteParkingSpotApiResponseCopyWithImpl<$Res>
    implements $DeleteParkingSpotApiResponseCopyWith<$Res> {
  _$DeleteParkingSpotApiResponseCopyWithImpl(this._self, this._then);

  final DeleteParkingSpotApiResponse _self;
  final $Res Function(DeleteParkingSpotApiResponse) _then;

/// Create a copy of DeleteParkingSpotApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parkingSpotId = null,}) {
  return _then(_self.copyWith(
parkingSpotId: null == parkingSpotId ? _self.parkingSpotId : parkingSpotId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteParkingSpotApiResponse].
extension DeleteParkingSpotApiResponsePatterns on DeleteParkingSpotApiResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteParkingSpotApiResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteParkingSpotApiResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteParkingSpotApiResponse value)  $default,){
final _that = this;
switch (_that) {
case _DeleteParkingSpotApiResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteParkingSpotApiResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteParkingSpotApiResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'parkingPlace_id')  int parkingSpotId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteParkingSpotApiResponse() when $default != null:
return $default(_that.parkingSpotId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'parkingPlace_id')  int parkingSpotId)  $default,) {final _that = this;
switch (_that) {
case _DeleteParkingSpotApiResponse():
return $default(_that.parkingSpotId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'parkingPlace_id')  int parkingSpotId)?  $default,) {final _that = this;
switch (_that) {
case _DeleteParkingSpotApiResponse() when $default != null:
return $default(_that.parkingSpotId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeleteParkingSpotApiResponse implements DeleteParkingSpotApiResponse {
  const _DeleteParkingSpotApiResponse({@JsonKey(name: 'parkingPlace_id') required this.parkingSpotId});
  factory _DeleteParkingSpotApiResponse.fromJson(Map<String, dynamic> json) => _$DeleteParkingSpotApiResponseFromJson(json);

@override@JsonKey(name: 'parkingPlace_id') final  int parkingSpotId;

/// Create a copy of DeleteParkingSpotApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteParkingSpotApiResponseCopyWith<_DeleteParkingSpotApiResponse> get copyWith => __$DeleteParkingSpotApiResponseCopyWithImpl<_DeleteParkingSpotApiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteParkingSpotApiResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteParkingSpotApiResponse&&(identical(other.parkingSpotId, parkingSpotId) || other.parkingSpotId == parkingSpotId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parkingSpotId);

@override
String toString() {
  return 'DeleteParkingSpotApiResponse(parkingSpotId: $parkingSpotId)';
}


}

/// @nodoc
abstract mixin class _$DeleteParkingSpotApiResponseCopyWith<$Res> implements $DeleteParkingSpotApiResponseCopyWith<$Res> {
  factory _$DeleteParkingSpotApiResponseCopyWith(_DeleteParkingSpotApiResponse value, $Res Function(_DeleteParkingSpotApiResponse) _then) = __$DeleteParkingSpotApiResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'parkingPlace_id') int parkingSpotId
});




}
/// @nodoc
class __$DeleteParkingSpotApiResponseCopyWithImpl<$Res>
    implements _$DeleteParkingSpotApiResponseCopyWith<$Res> {
  __$DeleteParkingSpotApiResponseCopyWithImpl(this._self, this._then);

  final _DeleteParkingSpotApiResponse _self;
  final $Res Function(_DeleteParkingSpotApiResponse) _then;

/// Create a copy of DeleteParkingSpotApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parkingSpotId = null,}) {
  return _then(_DeleteParkingSpotApiResponse(
parkingSpotId: null == parkingSpotId ? _self.parkingSpotId : parkingSpotId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
