import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kreyno/enums/vehicle_type.dart';

part 'update_car_dto.freezed.dart';
part 'update_car_dto.g.dart';

@freezed
abstract class UpdateCarDto with _$UpdateCarDto {
  const factory UpdateCarDto({
    @JsonKey(name: "car_type") VehicleType? vehicleType,
    @JsonKey(name: "brand") String? brand,
    @JsonKey(name: "model") String? model,
    @JsonKey(name: "color") String? color,
    @JsonKey(name: "registration_number") String? registrationNumber,
    @JsonKey(name: "co2_emission") String? co2Emission,
    @JsonKey(name: "image") String? imageUuid,
    @JsonKey(name: "is_selected") bool? isSelected,
  }) = _UpdateCarDto;

  factory UpdateCarDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateCarDtoFromJson(json);
}
