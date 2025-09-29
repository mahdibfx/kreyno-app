// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_media_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UploadMediaResponse {

@JsonKey(name: 'uuid') String get uuid;
/// Create a copy of UploadMediaResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadMediaResponseCopyWith<UploadMediaResponse> get copyWith => _$UploadMediaResponseCopyWithImpl<UploadMediaResponse>(this as UploadMediaResponse, _$identity);

  /// Serializes this UploadMediaResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadMediaResponse&&(identical(other.uuid, uuid) || other.uuid == uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid);

@override
String toString() {
  return 'UploadMediaResponse(uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class $UploadMediaResponseCopyWith<$Res>  {
  factory $UploadMediaResponseCopyWith(UploadMediaResponse value, $Res Function(UploadMediaResponse) _then) = _$UploadMediaResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'uuid') String uuid
});




}
/// @nodoc
class _$UploadMediaResponseCopyWithImpl<$Res>
    implements $UploadMediaResponseCopyWith<$Res> {
  _$UploadMediaResponseCopyWithImpl(this._self, this._then);

  final UploadMediaResponse _self;
  final $Res Function(UploadMediaResponse) _then;

/// Create a copy of UploadMediaResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadMediaResponse].
extension UploadMediaResponsePatterns on UploadMediaResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadMediaResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadMediaResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadMediaResponse value)  $default,){
final _that = this;
switch (_that) {
case _UploadMediaResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadMediaResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UploadMediaResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'uuid')  String uuid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadMediaResponse() when $default != null:
return $default(_that.uuid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'uuid')  String uuid)  $default,) {final _that = this;
switch (_that) {
case _UploadMediaResponse():
return $default(_that.uuid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'uuid')  String uuid)?  $default,) {final _that = this;
switch (_that) {
case _UploadMediaResponse() when $default != null:
return $default(_that.uuid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadMediaResponse implements UploadMediaResponse {
  const _UploadMediaResponse({@JsonKey(name: 'uuid') required this.uuid});
  factory _UploadMediaResponse.fromJson(Map<String, dynamic> json) => _$UploadMediaResponseFromJson(json);

@override@JsonKey(name: 'uuid') final  String uuid;

/// Create a copy of UploadMediaResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadMediaResponseCopyWith<_UploadMediaResponse> get copyWith => __$UploadMediaResponseCopyWithImpl<_UploadMediaResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadMediaResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadMediaResponse&&(identical(other.uuid, uuid) || other.uuid == uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid);

@override
String toString() {
  return 'UploadMediaResponse(uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class _$UploadMediaResponseCopyWith<$Res> implements $UploadMediaResponseCopyWith<$Res> {
  factory _$UploadMediaResponseCopyWith(_UploadMediaResponse value, $Res Function(_UploadMediaResponse) _then) = __$UploadMediaResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'uuid') String uuid
});




}
/// @nodoc
class __$UploadMediaResponseCopyWithImpl<$Res>
    implements _$UploadMediaResponseCopyWith<$Res> {
  __$UploadMediaResponseCopyWithImpl(this._self, this._then);

  final _UploadMediaResponse _self;
  final $Res Function(_UploadMediaResponse) _then;

/// Create a copy of UploadMediaResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,}) {
  return _then(_UploadMediaResponse(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
