import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum VehicleType {
  @JsonValue(1)
  fuel,
  @JsonValue(2)
  electric,
  @JsonValue(3)
  motorcycle,
}
