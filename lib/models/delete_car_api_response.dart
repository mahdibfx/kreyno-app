import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_car_api_response.freezed.dart';
part 'delete_car_api_response.g.dart';

@freezed
abstract class DeleteCarApiResponse with _$DeleteCarApiResponse {
  const factory DeleteCarApiResponse({
    @JsonKey(name: 'car_id') required int carId,
  }) = _DeleteCarApiResponse;

  factory DeleteCarApiResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCarApiResponseFromJson(json);
}
