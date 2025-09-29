import 'package:freezed_annotation/freezed_annotation.dart';

part 'parking_place.g.dart';
part 'parking_place.freezed.dart';

@freezed
abstract class ParkingPlace with _$ParkingPlace {
  const factory ParkingPlace({
    required String id,
    required String address,
    required double longitude,
    required double latitude,
    required String geohash,
    required double price,
    @JsonKey(name: 'total_paid_price') required double totalPaidPrice,
    @JsonKey(name: 'electric_charge_station')
    required bool electricChargeStation,
    required bool reserved,
    required Seller seller,
  }) = _ParkingPlace;

  factory ParkingPlace.fromJson(Map<String, dynamic> json) =>
      _$ParkingPlaceFromJson(json);
}

@freezed
abstract class Seller with _$Seller {
  const factory Seller({
    required String username,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String phone,
    required Avatar avatar,
  }) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
}

@freezed
abstract class Avatar with _$Avatar {
  const factory Avatar({required String id, required String url}) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}
