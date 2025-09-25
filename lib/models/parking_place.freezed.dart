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
  String get id => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  String get geohash => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_paid_price')
  double get totalPaidPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'electric_charge_station')
  bool get electricChargeStation => throw _privateConstructorUsedError;
  bool get reserved => throw _privateConstructorUsedError;
  Seller get seller => throw _privateConstructorUsedError;

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
      {String id,
      String address,
      double longitude,
      double latitude,
      String geohash,
      double price,
      @JsonKey(name: 'total_paid_price') double totalPaidPrice,
      @JsonKey(name: 'electric_charge_station') bool electricChargeStation,
      bool reserved,
      Seller seller});

  $SellerCopyWith<$Res> get seller;
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
    Object? id = null,
    Object? address = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? geohash = null,
    Object? price = null,
    Object? totalPaidPrice = null,
    Object? electricChargeStation = null,
    Object? reserved = null,
    Object? seller = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      electricChargeStation: null == electricChargeStation
          ? _value.electricChargeStation
          : electricChargeStation // ignore: cast_nullable_to_non_nullable
              as bool,
      reserved: null == reserved
          ? _value.reserved
          : reserved // ignore: cast_nullable_to_non_nullable
              as bool,
      seller: null == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller,
    ) as $Val);
  }

  /// Create a copy of ParkingPlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SellerCopyWith<$Res> get seller {
    return $SellerCopyWith<$Res>(_value.seller, (value) {
      return _then(_value.copyWith(seller: value) as $Val);
    });
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
      {String id,
      String address,
      double longitude,
      double latitude,
      String geohash,
      double price,
      @JsonKey(name: 'total_paid_price') double totalPaidPrice,
      @JsonKey(name: 'electric_charge_station') bool electricChargeStation,
      bool reserved,
      Seller seller});

  @override
  $SellerCopyWith<$Res> get seller;
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
    Object? id = null,
    Object? address = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? geohash = null,
    Object? price = null,
    Object? totalPaidPrice = null,
    Object? electricChargeStation = null,
    Object? reserved = null,
    Object? seller = null,
  }) {
    return _then(_$ParkingPlaceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      electricChargeStation: null == electricChargeStation
          ? _value.electricChargeStation
          : electricChargeStation // ignore: cast_nullable_to_non_nullable
              as bool,
      reserved: null == reserved
          ? _value.reserved
          : reserved // ignore: cast_nullable_to_non_nullable
              as bool,
      seller: null == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParkingPlaceImpl implements _ParkingPlace {
  const _$ParkingPlaceImpl(
      {required this.id,
      required this.address,
      required this.longitude,
      required this.latitude,
      required this.geohash,
      required this.price,
      @JsonKey(name: 'total_paid_price') required this.totalPaidPrice,
      @JsonKey(name: 'electric_charge_station')
      required this.electricChargeStation,
      required this.reserved,
      required this.seller});

  factory _$ParkingPlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParkingPlaceImplFromJson(json);

  @override
  final String id;
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
  @JsonKey(name: 'electric_charge_station')
  final bool electricChargeStation;
  @override
  final bool reserved;
  @override
  final Seller seller;

  @override
  String toString() {
    return 'ParkingPlace(id: $id, address: $address, longitude: $longitude, latitude: $latitude, geohash: $geohash, price: $price, totalPaidPrice: $totalPaidPrice, electricChargeStation: $electricChargeStation, reserved: $reserved, seller: $seller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParkingPlaceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.geohash, geohash) || other.geohash == geohash) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.totalPaidPrice, totalPaidPrice) ||
                other.totalPaidPrice == totalPaidPrice) &&
            (identical(other.electricChargeStation, electricChargeStation) ||
                other.electricChargeStation == electricChargeStation) &&
            (identical(other.reserved, reserved) ||
                other.reserved == reserved) &&
            (identical(other.seller, seller) || other.seller == seller));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, address, longitude, latitude,
      geohash, price, totalPaidPrice, electricChargeStation, reserved, seller);

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
      {required final String id,
      required final String address,
      required final double longitude,
      required final double latitude,
      required final String geohash,
      required final double price,
      @JsonKey(name: 'total_paid_price') required final double totalPaidPrice,
      @JsonKey(name: 'electric_charge_station')
      required final bool electricChargeStation,
      required final bool reserved,
      required final Seller seller}) = _$ParkingPlaceImpl;

  factory _ParkingPlace.fromJson(Map<String, dynamic> json) =
      _$ParkingPlaceImpl.fromJson;

  @override
  String get id;
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
  @JsonKey(name: 'electric_charge_station')
  bool get electricChargeStation;
  @override
  bool get reserved;
  @override
  Seller get seller;

  /// Create a copy of ParkingPlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParkingPlaceImplCopyWith<_$ParkingPlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Seller _$SellerFromJson(Map<String, dynamic> json) {
  return _Seller.fromJson(json);
}

/// @nodoc
mixin _$Seller {
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  Avatar get avatar => throw _privateConstructorUsedError;

  /// Serializes this Seller to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Seller
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerCopyWith<Seller> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerCopyWith<$Res> {
  factory $SellerCopyWith(Seller value, $Res Function(Seller) then) =
      _$SellerCopyWithImpl<$Res, Seller>;
  @useResult
  $Res call(
      {String username,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String phone,
      Avatar avatar});

  $AvatarCopyWith<$Res> get avatar;
}

/// @nodoc
class _$SellerCopyWithImpl<$Res, $Val extends Seller>
    implements $SellerCopyWith<$Res> {
  _$SellerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Seller
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar,
    ) as $Val);
  }

  /// Create a copy of Seller
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvatarCopyWith<$Res> get avatar {
    return $AvatarCopyWith<$Res>(_value.avatar, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SellerImplCopyWith<$Res> implements $SellerCopyWith<$Res> {
  factory _$$SellerImplCopyWith(
          _$SellerImpl value, $Res Function(_$SellerImpl) then) =
      __$$SellerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String phone,
      Avatar avatar});

  @override
  $AvatarCopyWith<$Res> get avatar;
}

/// @nodoc
class __$$SellerImplCopyWithImpl<$Res>
    extends _$SellerCopyWithImpl<$Res, _$SellerImpl>
    implements _$$SellerImplCopyWith<$Res> {
  __$$SellerImplCopyWithImpl(
      _$SellerImpl _value, $Res Function(_$SellerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Seller
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? avatar = null,
  }) {
    return _then(_$SellerImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerImpl implements _Seller {
  const _$SellerImpl(
      {required this.username,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.phone,
      required this.avatar});

  factory _$SellerImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerImplFromJson(json);

  @override
  final String username;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String phone;
  @override
  final Avatar avatar;

  @override
  String toString() {
    return 'Seller(username: $username, firstName: $firstName, lastName: $lastName, phone: $phone, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, firstName, lastName, phone, avatar);

  /// Create a copy of Seller
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerImplCopyWith<_$SellerImpl> get copyWith =>
      __$$SellerImplCopyWithImpl<_$SellerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerImplToJson(
      this,
    );
  }
}

abstract class _Seller implements Seller {
  const factory _Seller(
      {required final String username,
      @JsonKey(name: 'first_name') required final String firstName,
      @JsonKey(name: 'last_name') required final String lastName,
      required final String phone,
      required final Avatar avatar}) = _$SellerImpl;

  factory _Seller.fromJson(Map<String, dynamic> json) = _$SellerImpl.fromJson;

  @override
  String get username;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get phone;
  @override
  Avatar get avatar;

  /// Create a copy of Seller
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerImplCopyWith<_$SellerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Avatar _$AvatarFromJson(Map<String, dynamic> json) {
  return _Avatar.fromJson(json);
}

/// @nodoc
mixin _$Avatar {
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this Avatar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvatarCopyWith<Avatar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarCopyWith<$Res> {
  factory $AvatarCopyWith(Avatar value, $Res Function(Avatar) then) =
      _$AvatarCopyWithImpl<$Res, Avatar>;
  @useResult
  $Res call({String id, String url});
}

/// @nodoc
class _$AvatarCopyWithImpl<$Res, $Val extends Avatar>
    implements $AvatarCopyWith<$Res> {
  _$AvatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvatarImplCopyWith<$Res> implements $AvatarCopyWith<$Res> {
  factory _$$AvatarImplCopyWith(
          _$AvatarImpl value, $Res Function(_$AvatarImpl) then) =
      __$$AvatarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String url});
}

/// @nodoc
class __$$AvatarImplCopyWithImpl<$Res>
    extends _$AvatarCopyWithImpl<$Res, _$AvatarImpl>
    implements _$$AvatarImplCopyWith<$Res> {
  __$$AvatarImplCopyWithImpl(
      _$AvatarImpl _value, $Res Function(_$AvatarImpl) _then)
      : super(_value, _then);

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_$AvatarImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvatarImpl implements _Avatar {
  const _$AvatarImpl({required this.id, required this.url});

  factory _$AvatarImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarImplFromJson(json);

  @override
  final String id;
  @override
  final String url;

  @override
  String toString() {
    return 'Avatar(id: $id, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url);

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarImplCopyWith<_$AvatarImpl> get copyWith =>
      __$$AvatarImplCopyWithImpl<_$AvatarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarImplToJson(
      this,
    );
  }
}

abstract class _Avatar implements Avatar {
  const factory _Avatar({required final String id, required final String url}) =
      _$AvatarImpl;

  factory _Avatar.fromJson(Map<String, dynamic> json) = _$AvatarImpl.fromJson;

  @override
  String get id;
  @override
  String get url;

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvatarImplCopyWith<_$AvatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
