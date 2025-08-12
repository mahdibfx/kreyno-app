import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_exists_dto.freezed.dart';
part 'user_exists_dto.g.dart';

@freezed
abstract class UserExistsDto with _$UserExistsDto {
  const factory UserExistsDto({@JsonKey(name: 'phone') required String phone}) =
      _UserExistsDto;

  factory UserExistsDto.fromJson(Map<String, dynamic> json) =>
      _$UserExistsDtoFromJson(json);
}
