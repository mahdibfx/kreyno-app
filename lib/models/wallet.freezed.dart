// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Wallet {

@JsonKey(name: 'balance') double get balance;@JsonKey(name: 'currency') String get currency;@JsonKey(name: 'iban') String? get bankAccountNumber;@JsonKey(name: 'validated_account') bool get validatedAccount;@JsonKey(name: 'transfer_capability') bool get transferCapability;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletCopyWith<Wallet> get copyWith => _$WalletCopyWithImpl<Wallet>(this as Wallet, _$identity);

  /// Serializes this Wallet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Wallet&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.bankAccountNumber, bankAccountNumber) || other.bankAccountNumber == bankAccountNumber)&&(identical(other.validatedAccount, validatedAccount) || other.validatedAccount == validatedAccount)&&(identical(other.transferCapability, transferCapability) || other.transferCapability == transferCapability)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,balance,currency,bankAccountNumber,validatedAccount,transferCapability,updatedAt);

@override
String toString() {
  return 'Wallet(balance: $balance, currency: $currency, bankAccountNumber: $bankAccountNumber, validatedAccount: $validatedAccount, transferCapability: $transferCapability, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $WalletCopyWith<$Res>  {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) _then) = _$WalletCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'balance') double balance,@JsonKey(name: 'currency') String currency,@JsonKey(name: 'iban') String? bankAccountNumber,@JsonKey(name: 'validated_account') bool validatedAccount,@JsonKey(name: 'transfer_capability') bool transferCapability,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$WalletCopyWithImpl<$Res>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._self, this._then);

  final Wallet _self;
  final $Res Function(Wallet) _then;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balance = null,Object? currency = null,Object? bankAccountNumber = freezed,Object? validatedAccount = null,Object? transferCapability = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,bankAccountNumber: freezed == bankAccountNumber ? _self.bankAccountNumber : bankAccountNumber // ignore: cast_nullable_to_non_nullable
as String?,validatedAccount: null == validatedAccount ? _self.validatedAccount : validatedAccount // ignore: cast_nullable_to_non_nullable
as bool,transferCapability: null == transferCapability ? _self.transferCapability : transferCapability // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Wallet].
extension WalletPatterns on Wallet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Wallet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Wallet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Wallet value)  $default,){
final _that = this;
switch (_that) {
case _Wallet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Wallet value)?  $default,){
final _that = this;
switch (_that) {
case _Wallet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'balance')  double balance, @JsonKey(name: 'currency')  String currency, @JsonKey(name: 'iban')  String? bankAccountNumber, @JsonKey(name: 'validated_account')  bool validatedAccount, @JsonKey(name: 'transfer_capability')  bool transferCapability, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Wallet() when $default != null:
return $default(_that.balance,_that.currency,_that.bankAccountNumber,_that.validatedAccount,_that.transferCapability,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'balance')  double balance, @JsonKey(name: 'currency')  String currency, @JsonKey(name: 'iban')  String? bankAccountNumber, @JsonKey(name: 'validated_account')  bool validatedAccount, @JsonKey(name: 'transfer_capability')  bool transferCapability, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Wallet():
return $default(_that.balance,_that.currency,_that.bankAccountNumber,_that.validatedAccount,_that.transferCapability,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'balance')  double balance, @JsonKey(name: 'currency')  String currency, @JsonKey(name: 'iban')  String? bankAccountNumber, @JsonKey(name: 'validated_account')  bool validatedAccount, @JsonKey(name: 'transfer_capability')  bool transferCapability, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Wallet() when $default != null:
return $default(_that.balance,_that.currency,_that.bankAccountNumber,_that.validatedAccount,_that.transferCapability,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Wallet implements Wallet {
  const _Wallet({@JsonKey(name: 'balance') required this.balance, @JsonKey(name: 'currency') required this.currency, @JsonKey(name: 'iban') required this.bankAccountNumber, @JsonKey(name: 'validated_account') required this.validatedAccount, @JsonKey(name: 'transfer_capability') required this.transferCapability, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

@override@JsonKey(name: 'balance') final  double balance;
@override@JsonKey(name: 'currency') final  String currency;
@override@JsonKey(name: 'iban') final  String? bankAccountNumber;
@override@JsonKey(name: 'validated_account') final  bool validatedAccount;
@override@JsonKey(name: 'transfer_capability') final  bool transferCapability;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletCopyWith<_Wallet> get copyWith => __$WalletCopyWithImpl<_Wallet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Wallet&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.bankAccountNumber, bankAccountNumber) || other.bankAccountNumber == bankAccountNumber)&&(identical(other.validatedAccount, validatedAccount) || other.validatedAccount == validatedAccount)&&(identical(other.transferCapability, transferCapability) || other.transferCapability == transferCapability)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,balance,currency,bankAccountNumber,validatedAccount,transferCapability,updatedAt);

@override
String toString() {
  return 'Wallet(balance: $balance, currency: $currency, bankAccountNumber: $bankAccountNumber, validatedAccount: $validatedAccount, transferCapability: $transferCapability, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$WalletCopyWith(_Wallet value, $Res Function(_Wallet) _then) = __$WalletCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'balance') double balance,@JsonKey(name: 'currency') String currency,@JsonKey(name: 'iban') String? bankAccountNumber,@JsonKey(name: 'validated_account') bool validatedAccount,@JsonKey(name: 'transfer_capability') bool transferCapability,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$WalletCopyWithImpl<$Res>
    implements _$WalletCopyWith<$Res> {
  __$WalletCopyWithImpl(this._self, this._then);

  final _Wallet _self;
  final $Res Function(_Wallet) _then;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balance = null,Object? currency = null,Object? bankAccountNumber = freezed,Object? validatedAccount = null,Object? transferCapability = null,Object? updatedAt = null,}) {
  return _then(_Wallet(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,bankAccountNumber: freezed == bankAccountNumber ? _self.bankAccountNumber : bankAccountNumber // ignore: cast_nullable_to_non_nullable
as String?,validatedAccount: null == validatedAccount ? _self.validatedAccount : validatedAccount // ignore: cast_nullable_to_non_nullable
as bool,transferCapability: null == transferCapability ? _self.transferCapability : transferCapability // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
