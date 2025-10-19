import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kreyno/enums/gender.dart';

part 'update_profile_dto.freezed.dart';
part 'update_profile_dto.g.dart';

@freezed
abstract class UpdateProfileDto with _$UpdateProfileDto {
  const factory UpdateProfileDto({
    @JsonKey(name: 'first_name', includeIfNull: false) String? firstName,
    @JsonKey(name: 'last_name', includeIfNull: false) String? lastName,
    @JsonKey(name: 'email', includeIfNull: false) String? email,
    @JsonKey(name: 'gender', includeIfNull: false) Gender? gender,
    @JsonKey(name: 'birth_date', includeIfNull: false) DateTime? birthDate,
    // @JsonKey(name: 'address', includeIfNull: false) String? address,
  }) = _UpdateProfileDto;

  factory UpdateProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileDtoFromJson(json);
}
