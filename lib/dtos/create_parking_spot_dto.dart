import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_parking_spot_dto.freezed.dart';
part 'create_parking_spot_dto.g.dart';

@freezed
abstract class CreateParkingSpotDto with _$CreateParkingSpotDto {
  const factory CreateParkingSpotDto({
    @JsonKey(name: "latitude") required double latitude,
    @JsonKey(name: "longitude") required double longitude,
    @JsonKey(name: "address") required String address,
    @JsonKey(name: "price") required double price,
    @JsonKey(name: "electric_charge_station")
    required bool electricChargeStation,
  }) = _CreateParkingSpotDto;

  factory CreateParkingSpotDto.fromJson(Map<String, dynamic> json) =>
      _$CreateParkingSpotDtoFromJson(json);
}
