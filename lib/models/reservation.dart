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
    @JsonKey(name: "parking_place") required ParkingPlace parkingSpot,
    @JsonKey(name: "status") required ReservationStatus status,
    @JsonKey(name: "observation") required String observation,
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
    @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)
    Avatar? avatar,
  }) = _Buyer;

  factory Buyer.fromJson(Map<String, dynamic> json) => _$BuyerFromJson(json);

  Map<String, dynamic> toJson();
}

@freezed
abstract class ParkingPlace with _$ParkingPlace {
  const factory ParkingPlace({
    @JsonKey(name: "address") required String address,
    @JsonKey(name: "longitude") required double longitude,
    @JsonKey(name: "latitude") required double latitude,
    @JsonKey(name: "geohash") required String geoHash,
    @JsonKey(name: "price") required double price,
    @JsonKey(name: "total_paid_price") required double totalPaidPrice,
    @JsonKey(name: "electric_charge_station")
    required bool electricChargeStation,
    @JsonKey(name: "reserved") required bool reserved,
  }) = _ParkingPlace;

  factory ParkingPlace.fromJson(Map<String, dynamic> json) =>
      _$ParkingPlaceFromJson(json);
}
