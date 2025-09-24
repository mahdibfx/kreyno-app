import 'package:freezed_annotation/freezed_annotation.dart';
part 'parking_place.g.dart';
part 'parking_place.freezed.dart';

@freezed
abstract class ParkingPlace with _$ParkingPlace {
  const factory ParkingPlace({
    required String address,
    required double longitude,
    required double latitude,
    required String geohash,
    required double price,
    @JsonKey(name: 'total_paid_price') required double totalPaidPrice,
    required bool reserved,
  }) = _ParkingPlace;

  factory ParkingPlace.fromJson(Map<String, dynamic> json) =>
      _$ParkingPlaceFromJson(json);
}
