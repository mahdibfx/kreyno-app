import 'package:freezed_annotation/freezed_annotation.dart';

import 'avatar.dart';

part 'parking_spot.freezed.dart';
part 'parking_spot.g.dart';

@freezed
abstract class ParkingSpot with _$ParkingSpot {
  const factory ParkingSpot({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "address") required String address,
    @JsonKey(name: "longitude") required double longitude,
    @JsonKey(name: "latitude") required double latitude,
    @JsonKey(name: "geohash") required String geoHash,
    @JsonKey(name: "price") required double price,
    @JsonKey(name: "total_paid_price") required double totalPaidPrice,
    @JsonKey(name: "electric_charge_station")
    required bool electricChargeStation,
    @JsonKey(name: "reserved") required bool reserved,
    @JsonKey(name: "seller") required Seller seller,
  }) = _ParkingSpot;

  factory ParkingSpot.fromJson(Map<String, dynamic> json) =>
      _$ParkingSpotFromJson(json);
}

@freezed
abstract class Seller with _$Seller {
  const factory Seller({
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "phone") required String phone,
    @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)
    Avatar? avatar,
  }) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);

  Map<String, dynamic> toJson();
}
