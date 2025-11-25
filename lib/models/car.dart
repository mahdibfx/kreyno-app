import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kreyno/enums/vehicle_type.dart';

part 'car.freezed.dart';
part 'car.g.dart';

@freezed
abstract class Car with _$Car {
  const factory Car({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "car_type") required VehicleType vehicleType,
    @JsonKey(name: "brand") required String brand,
    @JsonKey(name: "model") required String model,
    @JsonKey(name: "color") required String color,
    @JsonKey(name: "registration_number") required String registrationNumber,
    @JsonKey(name: "co2_emission") required num co2Emission,
    @Default(false) @JsonKey(name: "is_selected") bool isSelected,
    @JsonKey(name: "image", fromJson: _imageFromJson, toJson: _imageToJson)
    @JsonKey(name: "image")
    Image? image,
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
}

// Helper functions for nullable Image handling
Image? _imageFromJson(dynamic json) {
  if (json == null) {
    return null;
  }
  return Image.fromJson(json as Map<String, dynamic>);
}

Map<String, dynamic>? _imageToJson(Image? image) {
  return image?.toJson();
}

@freezed
abstract class Image with _$Image {
  const factory Image({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "url") required String url,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
