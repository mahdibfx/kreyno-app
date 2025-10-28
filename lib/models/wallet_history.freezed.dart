// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletHistory {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'category') WalletHistoryCategory get category;@JsonKey(name: 'amount') double get amount;@JsonKey(name: 'detail') String? get detail;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of WalletHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletHistoryCopyWith<WalletHistory> get copyWith => _$WalletHistoryCopyWithImpl<WalletHistory>(this as WalletHistory, _$identity);

  /// Serializes this WalletHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,amount,detail,createdAt);

@override
String toString() {
  return 'WalletHistory(id: $id, category: $category, amount: $amount, detail: $detail, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $WalletHistoryCopyWith<$Res>  {
  factory $WalletHistoryCopyWith(WalletHistory value, $Res Function(WalletHistory) _then) = _$WalletHistoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'category') WalletHistoryCategory category,@JsonKey(name: 'amount') double amount,@JsonKey(name: 'detail') String? detail,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$WalletHistoryCopyWithImpl<$Res>
    implements $WalletHistoryCopyWith<$Res> {
  _$WalletHistoryCopyWithImpl(this._self, this._then);

  final WalletHistory _self;
  final $Res Function(WalletHistory) _then;

/// Create a copy of WalletHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? category = null,Object? amount = null,Object? detail = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as WalletHistoryCategory,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletHistory].
extension WalletHistoryPatterns on WalletHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletHistory value)  $default,){
final _that = this;
switch (_that) {
case _WalletHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletHistory value)?  $default,){
final _that = this;
switch (_that) {
case _WalletHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'category')  WalletHistoryCategory category, @JsonKey(name: 'amount')  double amount, @JsonKey(name: 'detail')  String? detail, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletHistory() when $default != null:
return $default(_that.id,_that.category,_that.amount,_that.detail,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'category')  WalletHistoryCategory category, @JsonKey(name: 'amount')  double amount, @JsonKey(name: 'detail')  String? detail, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _WalletHistory():
return $default(_that.id,_that.category,_that.amount,_that.detail,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'category')  WalletHistoryCategory category, @JsonKey(name: 'amount')  double amount, @JsonKey(name: 'detail')  String? detail, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _WalletHistory() when $default != null:
return $default(_that.id,_that.category,_that.amount,_that.detail,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletHistory implements WalletHistory {
  const _WalletHistory({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'category') required this.category, @JsonKey(name: 'amount') required this.amount, @JsonKey(name: 'detail') required this.detail, @JsonKey(name: 'created_at') required this.createdAt});
  factory _WalletHistory.fromJson(Map<String, dynamic> json) => _$WalletHistoryFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'category') final  WalletHistoryCategory category;
@override@JsonKey(name: 'amount') final  double amount;
@override@JsonKey(name: 'detail') final  String? detail;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of WalletHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletHistoryCopyWith<_WalletHistory> get copyWith => __$WalletHistoryCopyWithImpl<_WalletHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,amount,detail,createdAt);

@override
String toString() {
  return 'WalletHistory(id: $id, category: $category, amount: $amount, detail: $detail, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$WalletHistoryCopyWith<$Res> implements $WalletHistoryCopyWith<$Res> {
  factory _$WalletHistoryCopyWith(_WalletHistory value, $Res Function(_WalletHistory) _then) = __$WalletHistoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'category') WalletHistoryCategory category,@JsonKey(name: 'amount') double amount,@JsonKey(name: 'detail') String? detail,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$WalletHistoryCopyWithImpl<$Res>
    implements _$WalletHistoryCopyWith<$Res> {
  __$WalletHistoryCopyWithImpl(this._self, this._then);

  final _WalletHistory _self;
  final $Res Function(_WalletHistory) _then;

/// Create a copy of WalletHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? amount = null,Object? detail = freezed,Object? createdAt = null,}) {
  return _then(_WalletHistory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as WalletHistoryCategory,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
