// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_stripe_account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateStripeAccountDto _$CreateStripeAccountDtoFromJson(
    Map<String, dynamic> json) {
  return _CreateStripeAccountDto.fromJson(json);
}

/// @nodoc
mixin _$CreateStripeAccountDto {
  @JsonKey(name: "country")
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: "street")
  String get street => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: "postal_code")
  String get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: "account_number")
  String get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "routing_number")
  String get routingNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "account_holder_name")
  String get accountHolderName => throw _privateConstructorUsedError;

  /// Serializes this CreateStripeAccountDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateStripeAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateStripeAccountDtoCopyWith<CreateStripeAccountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateStripeAccountDtoCopyWith<$Res> {
  factory $CreateStripeAccountDtoCopyWith(CreateStripeAccountDto value,
          $Res Function(CreateStripeAccountDto) then) =
      _$CreateStripeAccountDtoCopyWithImpl<$Res, CreateStripeAccountDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "country") String country,
      @JsonKey(name: "street") String street,
      @JsonKey(name: "city") String city,
      @JsonKey(name: "state") String state,
      @JsonKey(name: "postal_code") String postalCode,
      @JsonKey(name: "account_number") String accountNumber,
      @JsonKey(name: "routing_number") String routingNumber,
      @JsonKey(name: "account_holder_name") String accountHolderName});
}

/// @nodoc
class _$CreateStripeAccountDtoCopyWithImpl<$Res,
        $Val extends CreateStripeAccountDto>
    implements $CreateStripeAccountDtoCopyWith<$Res> {
  _$CreateStripeAccountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateStripeAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? street = null,
    Object? city = null,
    Object? state = null,
    Object? postalCode = null,
    Object? accountNumber = null,
    Object? routingNumber = null,
    Object? accountHolderName = null,
  }) {
    return _then(_value.copyWith(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      routingNumber: null == routingNumber
          ? _value.routingNumber
          : routingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountHolderName: null == accountHolderName
          ? _value.accountHolderName
          : accountHolderName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateStripeAccountDtoImplCopyWith<$Res>
    implements $CreateStripeAccountDtoCopyWith<$Res> {
  factory _$$CreateStripeAccountDtoImplCopyWith(
          _$CreateStripeAccountDtoImpl value,
          $Res Function(_$CreateStripeAccountDtoImpl) then) =
      __$$CreateStripeAccountDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "country") String country,
      @JsonKey(name: "street") String street,
      @JsonKey(name: "city") String city,
      @JsonKey(name: "state") String state,
      @JsonKey(name: "postal_code") String postalCode,
      @JsonKey(name: "account_number") String accountNumber,
      @JsonKey(name: "routing_number") String routingNumber,
      @JsonKey(name: "account_holder_name") String accountHolderName});
}

/// @nodoc
class __$$CreateStripeAccountDtoImplCopyWithImpl<$Res>
    extends _$CreateStripeAccountDtoCopyWithImpl<$Res,
        _$CreateStripeAccountDtoImpl>
    implements _$$CreateStripeAccountDtoImplCopyWith<$Res> {
  __$$CreateStripeAccountDtoImplCopyWithImpl(
      _$CreateStripeAccountDtoImpl _value,
      $Res Function(_$CreateStripeAccountDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateStripeAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? street = null,
    Object? city = null,
    Object? state = null,
    Object? postalCode = null,
    Object? accountNumber = null,
    Object? routingNumber = null,
    Object? accountHolderName = null,
  }) {
    return _then(_$CreateStripeAccountDtoImpl(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      routingNumber: null == routingNumber
          ? _value.routingNumber
          : routingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountHolderName: null == accountHolderName
          ? _value.accountHolderName
          : accountHolderName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateStripeAccountDtoImpl implements _CreateStripeAccountDto {
  const _$CreateStripeAccountDtoImpl(
      {@JsonKey(name: "country") required this.country,
      @JsonKey(name: "street") required this.street,
      @JsonKey(name: "city") required this.city,
      @JsonKey(name: "state") required this.state,
      @JsonKey(name: "postal_code") required this.postalCode,
      @JsonKey(name: "account_number") required this.accountNumber,
      @JsonKey(name: "routing_number") required this.routingNumber,
      @JsonKey(name: "account_holder_name") required this.accountHolderName});

  factory _$CreateStripeAccountDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateStripeAccountDtoImplFromJson(json);

  @override
  @JsonKey(name: "country")
  final String country;
  @override
  @JsonKey(name: "street")
  final String street;
  @override
  @JsonKey(name: "city")
  final String city;
  @override
  @JsonKey(name: "state")
  final String state;
  @override
  @JsonKey(name: "postal_code")
  final String postalCode;
  @override
  @JsonKey(name: "account_number")
  final String accountNumber;
  @override
  @JsonKey(name: "routing_number")
  final String routingNumber;
  @override
  @JsonKey(name: "account_holder_name")
  final String accountHolderName;

  @override
  String toString() {
    return 'CreateStripeAccountDto(country: $country, street: $street, city: $city, state: $state, postalCode: $postalCode, accountNumber: $accountNumber, routingNumber: $routingNumber, accountHolderName: $accountHolderName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateStripeAccountDtoImpl &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.routingNumber, routingNumber) ||
                other.routingNumber == routingNumber) &&
            (identical(other.accountHolderName, accountHolderName) ||
                other.accountHolderName == accountHolderName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, country, street, city, state,
      postalCode, accountNumber, routingNumber, accountHolderName);

  /// Create a copy of CreateStripeAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateStripeAccountDtoImplCopyWith<_$CreateStripeAccountDtoImpl>
      get copyWith => __$$CreateStripeAccountDtoImplCopyWithImpl<
          _$CreateStripeAccountDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateStripeAccountDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateStripeAccountDto implements CreateStripeAccountDto {
  const factory _CreateStripeAccountDto(
      {@JsonKey(name: "country") required final String country,
      @JsonKey(name: "street") required final String street,
      @JsonKey(name: "city") required final String city,
      @JsonKey(name: "state") required final String state,
      @JsonKey(name: "postal_code") required final String postalCode,
      @JsonKey(name: "account_number") required final String accountNumber,
      @JsonKey(name: "routing_number") required final String routingNumber,
      @JsonKey(name: "account_holder_name")
      required final String accountHolderName}) = _$CreateStripeAccountDtoImpl;

  factory _CreateStripeAccountDto.fromJson(Map<String, dynamic> json) =
      _$CreateStripeAccountDtoImpl.fromJson;

  @override
  @JsonKey(name: "country")
  String get country;
  @override
  @JsonKey(name: "street")
  String get street;
  @override
  @JsonKey(name: "city")
  String get city;
  @override
  @JsonKey(name: "state")
  String get state;
  @override
  @JsonKey(name: "postal_code")
  String get postalCode;
  @override
  @JsonKey(name: "account_number")
  String get accountNumber;
  @override
  @JsonKey(name: "routing_number")
  String get routingNumber;
  @override
  @JsonKey(name: "account_holder_name")
  String get accountHolderName;

  /// Create a copy of CreateStripeAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateStripeAccountDtoImplCopyWith<_$CreateStripeAccountDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
