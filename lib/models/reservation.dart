import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kreyno/enums/reservation_status.dart';
import 'avatar.dart';

part 'reservation.freezed.dart';
part 'reservation.g.dart';

@freezed
abstract class Reservation with _$Reservation {
  const factory Reservation({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "buyer") required Buyer buyer,
    @JsonKey(name: "parking_place")
    required ParkingPlace
    parkingPlace, // Changed from parkingSpot to match JSON
    @JsonKey(name: "status") required ReservationStatus status,
    @JsonKey(name: "observation")
    String? observation, // Made nullable since it can be null
    @JsonKey(name: "validated_at") DateTime? validatedAt, // Added missing field
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
}

@freezed
abstract class Buyer with _$Buyer {
  const factory Buyer({
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "phone") required String phone,
    @JsonKey(name: 'car') required Car car,
    @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)
    Avatar? avatar,
  }) = _Buyer;

  factory Buyer.fromJson(Map<String, dynamic> json) => _$BuyerFromJson(json);
}

@freezed
abstract class ParkingPlace with _$ParkingPlace {
  const factory ParkingPlace({
    @JsonKey(name: "id") required int id, // Added missing id field
    @JsonKey(name: "address") required String address,
    @JsonKey(name: "longitude") required double longitude,
    @JsonKey(name: "latitude") required double latitude,
    @JsonKey(name: "geohash") required String geoHash,
    @JsonKey(name: "price") required double price,
    @JsonKey(name: "total_paid_price") required double totalPaidPrice,
    @JsonKey(name: "electric_charge_station")
    required bool electricChargeStation,
    @JsonKey(name: "reserved") required bool reserved,
    @JsonKey(name: "seller") required Seller seller, // Added seller field
    @JsonKey(name: "validated_at") DateTime? validatedAt, // Added validated_at
    @JsonKey(name: "created_at")
    required DateTime createdAt, // Added created_at
  }) = _ParkingPlace;

  factory ParkingPlace.fromJson(Map<String, dynamic> json) =>
      _$ParkingPlaceFromJson(json);
}

@freezed
abstract class Seller with _$Seller {
  const factory Seller({
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "phone") required String phone,
    @JsonKey(name: 'car') required Car car,
    @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)
    Avatar? avatar,
  }) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
}

// car.dart

@freezed
abstract class Car with _$Car {
  const factory Car({
    @JsonKey(name: "registration_number") required String registrationNumber,
    @JsonKey(name: "brand") required String brand,
    @JsonKey(name: "model") required String model,
    @JsonKey(name: "color") required String color,
    @JsonKey(name: "image") CarImage? image,
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
}

@freezed
abstract class CarImage with _$CarImage {
  const factory CarImage({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "url") required String url,
  }) = _CarImage;

  factory CarImage.fromJson(Map<String, dynamic> json) =>
      _$CarImageFromJson(json);
}
