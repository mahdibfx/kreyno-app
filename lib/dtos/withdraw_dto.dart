import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_dto.freezed.dart';
part 'withdraw_dto.g.dart';

@freezed
abstract class WithdrawDto with _$WithdrawDto {
  const factory WithdrawDto({@JsonKey(name: 'amount') required double amount}) =
      _WithdrawDto;

  factory WithdrawDto.fromJson(Map<String, dynamic> json) =>
      _$WithdrawDtoFromJson(json);
}
