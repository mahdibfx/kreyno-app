import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum Gender {
  @JsonValue(1)
  male,
  @JsonValue(2)
  female,
}
