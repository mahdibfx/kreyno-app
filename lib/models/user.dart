import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kreyno/enums/gender.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "phone") required String phone,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "birth_date") required DateTime birthDate,
    @JsonKey(name: "gender") required Gender gender,
    @JsonKey(name: "has_car") required bool hasVehicle,
    @JsonKey(name: "has_open_parking_place") required bool isSelling,
    @JsonKey(name: "has_open_reservation") required bool isBuying,
    @JsonKey(name: "avatar", fromJson: _avatarFromJson, toJson: _avatarToJson)
    @JsonKey(name: "avatar")
    Avatar? avatar,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// Helper functions for nullable Avatar handling
Avatar? _avatarFromJson(dynamic json) {
  if (json == null) {
    return null;
  }
  return Avatar.fromJson(json as Map<String, dynamic>);
}

Map<String, dynamic>? _avatarToJson(Avatar? avatar) {
  return avatar?.toJson();
}

@freezed
abstract class Avatar with _$Avatar {
  const factory Avatar({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "url") required String url,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  Map<String, dynamic> toJson();
}
