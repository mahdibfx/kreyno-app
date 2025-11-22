import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_parking_spot_api_response.freezed.dart';
part 'delete_parking_spot_api_response.g.dart';

@freezed
abstract class DeleteParkingSpotApiResponse
    with _$DeleteParkingSpotApiResponse {
  const factory DeleteParkingSpotApiResponse({
    @JsonKey(name: 'parkingPlace_id') required int parkingSpotId,
  }) = _DeleteParkingSpotApiResponse;

  factory DeleteParkingSpotApiResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteParkingSpotApiResponseFromJson(json);
}
