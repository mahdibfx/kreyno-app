import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kreyno/enums/gender.dart';
import 'package:kreyno/models/avatar.dart';

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
    @JsonKey(name: "avatar", fromJson: avatarFromJson, toJson: avatarToJson)
    @JsonKey(name: "avatar")
    Avatar? avatar,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
