import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_car_by_registration_response.freezed.dart';
part 'get_car_by_registration_response.g.dart';

@freezed
abstract class GetCarByRegistrationResponse
    with _$GetCarByRegistrationResponse {
  const factory GetCarByRegistrationResponse({
    @JsonKey(name: "brand") required String brand,
    @JsonKey(name: "model") required String model,
    @JsonKey(name: "color") required String color,
    @JsonKey(name: "registration_number") required String registrationNumber,
    @JsonKey(name: "co2_emission") required String co2Emission,
  }) = _GetCarByRegistrationResponse;

  factory GetCarByRegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCarByRegistrationResponseFromJson(json);
}
