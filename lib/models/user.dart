import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kreyno/enums/gender.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "phone") required String phone,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "address") required String address,
    @JsonKey(name: "birth_date") required DateTime birthDate,
    @JsonKey(name: "gender") required Gender gender,
    @JsonKey(name: "avatar") required Avatar avatar,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class Avatar with _$Avatar {
  const factory Avatar({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "url") required String url,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}
