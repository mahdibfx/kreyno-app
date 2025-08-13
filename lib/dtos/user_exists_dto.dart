import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kreyno/enums/unique_existence_id.dart';

part 'user_exists_dto.freezed.dart';
part 'user_exists_dto.g.dart';

@freezed
abstract class UserExistsDto with _$UserExistsDto {
  const factory UserExistsDto({
    @JsonKey(name: 'attribute') required UniqueExistenceId attribute,
    @JsonKey(name: 'value') required String value,
  }) = _UserExistsDto;

  factory UserExistsDto.fromJson(Map<String, dynamic> json) =>
      _$UserExistsDtoFromJson(json);
}
