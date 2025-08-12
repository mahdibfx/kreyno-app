import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kreyno/enums/gender.dart';

part 'update_profile_dto.freezed.dart';
part 'update_profile_dto.g.dart';

@freezed
abstract class UpdateProfileDto with _$UpdateProfileDto {
  const factory UpdateProfileDto({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'gender') Gender? gender,
    @JsonKey(name: 'birth_date') DateTime? birthDate,
    @JsonKey(name: 'address') String? address,
  }) = _UpdateProfileDto;

  factory UpdateProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileDtoFromJson(json);
}
