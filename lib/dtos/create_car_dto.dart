import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kreyno/enums/vehicle_type.dart';

part 'create_car_dto.freezed.dart';
part 'create_car_dto.g.dart';

@freezed
abstract class CreateCarDto with _$CreateCarDto {
  const factory CreateCarDto({
    @JsonKey(name: "car_type") required VehicleType vehicleType,
    @JsonKey(name: "brand") required String brand,
    @JsonKey(name: "model") required String model,
    @JsonKey(name: "color") required String color,
    @JsonKey(name: "registration_number") required String registrationNumber,
    @JsonKey(name: "co2_emission") required String co2Emission,
    @Default(null) @JsonKey(name: "image") String? imageUuid,
    @Default(false) @JsonKey(name: "is_selected") bool isSelected,
  }) = _CreateCarDto;

  factory CreateCarDto.fromJson(Map<String, dynamic> json) =>
      _$CreateCarDtoFromJson(json);
}
