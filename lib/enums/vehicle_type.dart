import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum VehicleType {
  @JsonValue(1)
  gasoline,
  @JsonValue(2)
  electric,
  @JsonValue(3)
  scooter,
}
