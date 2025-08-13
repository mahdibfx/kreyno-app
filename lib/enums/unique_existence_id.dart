import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum UniqueExistenceId {
  @JsonValue('phone')
  phone,
  @JsonValue('email')
  email,
  @JsonValue('username')
  username,
}
