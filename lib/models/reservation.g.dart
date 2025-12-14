// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reservation _$ReservationFromJson(Map<String, dynamic> json) => _Reservation(
  id: (json['id'] as num).toInt(),
  buyer: json['buyer'] == null
      ? const Buyer(
          username: "",
          firstName: "",
          lastName: "",
          phone: "",
          car: Car(registrationNumber: "", brand: "", model: "", color: ""),
          avatar: null,
        )
      : Buyer.fromJson(json['buyer'] as Map<String, dynamic>),
  parkingPlace: ParkingPlace.fromJson(
    json['parking_place'] as Map<String, dynamic>,
  ),
  status: $enumDecode(_$ReservationStatusEnumMap, json['status']),
  observation: json['observation'] as String?,
  validatedAt: json['validated_at'] == null
      ? null
      : DateTime.parse(json['validated_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ReservationToJson(_Reservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buyer': instance.buyer.toJson(),
      'parking_place': instance.parkingPlace.toJson(),
      'status': _$ReservationStatusEnumMap[instance.status]!,
      'observation': ?instance.observation,
      'validated_at': ?instance.validatedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$ReservationStatusEnumMap = {
  ReservationStatus.pending: 1,
  ReservationStatus.confirmed: 2,
  ReservationStatus.finished: 3,
  ReservationStatus.canceled: 4,
};

_Buyer _$BuyerFromJson(Map<String, dynamic> json) => _Buyer(
  username: json['username'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phone: json['phone'] as String,
  car: Car.fromJson(json['car'] as Map<String, dynamic>),
  avatar: avatarFromJson(json['avatar']),
);

Map<String, dynamic> _$BuyerToJson(_Buyer instance) => <String, dynamic>{
  'username': instance.username,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'car': instance.car.toJson(),
  'avatar': ?avatarToJson(instance.avatar),
};

_ParkingPlace _$ParkingPlaceFromJson(Map<String, dynamic> json) =>
    _ParkingPlace(
      id: (json['id'] as num).toInt(),
      address: json['address'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      geoHash: json['geohash'] as String,
      price: (json['price'] as num).toDouble(),
      totalPaidPrice: (json['total_paid_price'] as num).toDouble(),
      electricChargeStation: json['electric_charge_station'] as bool,
      reserved: json['reserved'] as bool,
      seller: Seller.fromJson(json['seller'] as Map<String, dynamic>),
      validatedAt: json['validated_at'] == null
          ? null
          : DateTime.parse(json['validated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ParkingPlaceToJson(_ParkingPlace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'geohash': instance.geoHash,
      'price': instance.price,
      'total_paid_price': instance.totalPaidPrice,
      'electric_charge_station': instance.electricChargeStation,
      'reserved': instance.reserved,
      'seller': instance.seller.toJson(),
      'validated_at': ?instance.validatedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };

_Seller _$SellerFromJson(Map<String, dynamic> json) => _Seller(
  username: json['username'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phone: json['phone'] as String,
  car: json['car'] == null
      ? null
      : Car.fromJson(json['car'] as Map<String, dynamic>),
  avatar: avatarFromJson(json['avatar']),
);

Map<String, dynamic> _$SellerToJson(_Seller instance) => <String, dynamic>{
  'username': instance.username,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'car': ?instance.car?.toJson(),
  'avatar': ?avatarToJson(instance.avatar),
};

_Car _$CarFromJson(Map<String, dynamic> json) => _Car(
  registrationNumber: json['registration_number'] as String,
  brand: json['brand'] as String,
  model: json['model'] as String,
  color: json['color'] as String,
  image: json['image'] == null
      ? null
      : CarImage.fromJson(json['image'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CarToJson(_Car instance) => <String, dynamic>{
  'registration_number': instance.registrationNumber,
  'brand': instance.brand,
  'model': instance.model,
  'color': instance.color,
  'image': ?instance.image?.toJson(),
};

_CarImage _$CarImageFromJson(Map<String, dynamic> json) =>
    _CarImage(id: (json['id'] as num).toInt(), url: json['url'] as String);

Map<String, dynamic> _$CarImageToJson(_CarImage instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
};
