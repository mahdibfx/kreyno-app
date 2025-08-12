// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_exists_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserExistsResponse {

@JsonKey(name: 'exists') bool get exists;
/// Create a copy of UserExistsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserExistsResponseCopyWith<UserExistsResponse> get copyWith => _$UserExistsResponseCopyWithImpl<UserExistsResponse>(this as UserExistsResponse, _$identity);

  /// Serializes this UserExistsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserExistsResponse&&(identical(other.exists, exists) || other.exists == exists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exists);

@override
String toString() {
  return 'UserExistsResponse(exists: $exists)';
}


}

/// @nodoc
abstract mixin class $UserExistsResponseCopyWith<$Res>  {
  factory $UserExistsResponseCopyWith(UserExistsResponse value, $Res Function(UserExistsResponse) _then) = _$UserExistsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'exists') bool exists
});




}
/// @nodoc
class _$UserExistsResponseCopyWithImpl<$Res>
    implements $UserExistsResponseCopyWith<$Res> {
  _$UserExistsResponseCopyWithImpl(this._self, this._then);

  final UserExistsResponse _self;
  final $Res Function(UserExistsResponse) _then;

/// Create a copy of UserExistsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exists = null,}) {
  return _then(_self.copyWith(
exists: null == exists ? _self.exists : exists // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserExistsResponse].
extension UserExistsResponsePatterns on UserExistsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserExistsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserExistsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserExistsResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserExistsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserExistsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserExistsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'exists')  bool exists)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserExistsResponse() when $default != null:
return $default(_that.exists);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'exists')  bool exists)  $default,) {final _that = this;
switch (_that) {
case _UserExistsResponse():
return $default(_that.exists);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'exists')  bool exists)?  $default,) {final _that = this;
switch (_that) {
case _UserExistsResponse() when $default != null:
return $default(_that.exists);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserExistsResponse implements UserExistsResponse {
  const _UserExistsResponse({@JsonKey(name: 'exists') required this.exists});
  factory _UserExistsResponse.fromJson(Map<String, dynamic> json) => _$UserExistsResponseFromJson(json);

@override@JsonKey(name: 'exists') final  bool exists;

/// Create a copy of UserExistsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserExistsResponseCopyWith<_UserExistsResponse> get copyWith => __$UserExistsResponseCopyWithImpl<_UserExistsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserExistsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserExistsResponse&&(identical(other.exists, exists) || other.exists == exists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exists);

@override
String toString() {
  return 'UserExistsResponse(exists: $exists)';
}


}

/// @nodoc
abstract mixin class _$UserExistsResponseCopyWith<$Res> implements $UserExistsResponseCopyWith<$Res> {
  factory _$UserExistsResponseCopyWith(_UserExistsResponse value, $Res Function(_UserExistsResponse) _then) = __$UserExistsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'exists') bool exists
});




}
/// @nodoc
class __$UserExistsResponseCopyWithImpl<$Res>
    implements _$UserExistsResponseCopyWith<$Res> {
  __$UserExistsResponseCopyWithImpl(this._self, this._then);

  final _UserExistsResponse _self;
  final $Res Function(_UserExistsResponse) _then;

/// Create a copy of UserExistsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exists = null,}) {
  return _then(_UserExistsResponse(
exists: null == exists ? _self.exists : exists // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
