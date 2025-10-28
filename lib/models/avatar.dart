import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar.freezed.dart';
part 'avatar.g.dart';

@freezed
abstract class Avatar with _$Avatar {
  const factory Avatar({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "url") required String url,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  Map<String, dynamic> toJson();
}

// Helper functions for nullable Avatar handling
Avatar? avatarFromJson(dynamic json) {
  if (json == null) {
    return null;
  }
  return Avatar.fromJson(json as Map<String, dynamic>);
}

Map<String, dynamic>? avatarToJson(Avatar? avatar) {
  return avatar?.toJson();
}
