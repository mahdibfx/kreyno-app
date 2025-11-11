import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum ReservationStatus {
  @JsonValue(1)
  pending,
  @JsonValue(2)
  confirmed,
  @JsonValue(3)
  finished,
  @JsonValue(4)
  canceled,
}
