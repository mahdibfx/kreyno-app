// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParkingPlace _$ParkingPlaceFromJson(Map<String, dynamic> json) {
  return _ParkingPlace.fromJson(json);
}

/// @nodoc
mixin _$ParkingPlace {
  String get address => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  String get geohash => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_paid_price')
  double get totalPaidPrice => throw _privateConstructorUsedError;
  bool get reserved => throw _privateConstructorUsedError;

  /// Serializes this ParkingPlace to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParkingPlace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParkingPlaceCopyWith<ParkingPlace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParkingPlaceCopyWith<$Res> {
  factory $ParkingPlaceCopyWith(
          ParkingPlace value, $Res Function(ParkingPlace) then) =
      _$ParkingPlaceCopyWithImpl<$Res, ParkingPlace>;
  @useResult
  $Res call(
      {String address,
      double longitude,
      double latitude,
      String geohash,
      double price,
      @JsonKey(name: 'total_paid_price') double totalPaidPrice,
      bool reserved});
}

/// @nodoc
class _$ParkingPlaceCopyWithImpl<$Res, $Val extends ParkingPlace>
    implements $ParkingPlaceCopyWith<$Res> {
  _$ParkingPlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParkingPlace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? geohash = null,
    Object? price = null,
    Object? totalPaidPrice = null,
    Object? reserved = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      geohash: null == geohash
          ? _value.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      totalPaidPrice: null == totalPaidPrice
          ? _value.totalPaidPrice
          : totalPaidPrice // ignore: cast_nullable_to_non_nullable
              as double,
      reserved: null == reserved
          ? _value.reserved
          : reserved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParkingPlaceImplCopyWith<$Res>
    implements $ParkingPlaceCopyWith<$Res> {
  factory _$$ParkingPlaceImplCopyWith(
          _$ParkingPlaceImpl value, $Res Function(_$ParkingPlaceImpl) then) =
      __$$ParkingPlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      double longitude,
      double latitude,
      String geohash,
      double price,
      @JsonKey(name: 'total_paid_price') double totalPaidPrice,
      bool reserved});
}

/// @nodoc
class __$$ParkingPlaceImplCopyWithImpl<$Res>
    extends _$ParkingPlaceCopyWithImpl<$Res, _$ParkingPlaceImpl>
    implements _$$ParkingPlaceImplCopyWith<$Res> {
  __$$ParkingPlaceImplCopyWithImpl(
      _$ParkingPlaceImpl _value, $Res Function(_$ParkingPlaceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParkingPlace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? geohash = null,
    Object? price = null,
    Object? totalPaidPrice = null,
    Object? reserved = null,
  }) {
    return _then(_$ParkingPlaceImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      geohash: null == geohash
          ? _value.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      totalPaidPrice: null == totalPaidPrice
          ? _value.totalPaidPrice
          : totalPaidPrice // ignore: cast_nullable_to_non_nullable
              as double,
      reserved: null == reserved
          ? _value.reserved
          : reserved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParkingPlaceImpl implements _ParkingPlace {
  const _$ParkingPlaceImpl(
      {required this.address,
      required this.longitude,
      required this.latitude,
      required this.geohash,
      required this.price,
      @JsonKey(name: 'total_paid_price') required this.totalPaidPrice,
      required this.reserved});

  factory _$ParkingPlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParkingPlaceImplFromJson(json);

  @override
  final String address;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String geohash;
  @override
  final double price;
  @override
  @JsonKey(name: 'total_paid_price')
  final double totalPaidPrice;
  @override
  final bool reserved;

  @override
  String toString() {
    return 'ParkingPlace(address: $address, longitude: $longitude, latitude: $latitude, geohash: $geohash, price: $price, totalPaidPrice: $totalPaidPrice, reserved: $reserved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParkingPlaceImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.geohash, geohash) || other.geohash == geohash) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.totalPaidPrice, totalPaidPrice) ||
                other.totalPaidPrice == totalPaidPrice) &&
            (identical(other.reserved, reserved) ||
                other.reserved == reserved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, address, longitude, latitude,
      geohash, price, totalPaidPrice, reserved);

  /// Create a copy of ParkingPlace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParkingPlaceImplCopyWith<_$ParkingPlaceImpl> get copyWith =>
      __$$ParkingPlaceImplCopyWithImpl<_$ParkingPlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParkingPlaceImplToJson(
      this,
    );
  }
}

abstract class _ParkingPlace implements ParkingPlace {
  const factory _ParkingPlace(
      {required final String address,
      required final double longitude,
      required final double latitude,
      required final String geohash,
      required final double price,
      @JsonKey(name: 'total_paid_price') required final double totalPaidPrice,
      required final bool reserved}) = _$ParkingPlaceImpl;

  factory _ParkingPlace.fromJson(Map<String, dynamic> json) =
      _$ParkingPlaceImpl.fromJson;

  @override
  String get address;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  String get geohash;
  @override
  double get price;
  @override
  @JsonKey(name: 'total_paid_price')
  double get totalPaidPrice;
  @override
  bool get reserved;

  /// Create a copy of ParkingPlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParkingPlaceImplCopyWith<_$ParkingPlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
