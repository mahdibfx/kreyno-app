import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, constructor: '_')
class ApiResponse<T> {
  const ApiResponse._({
    required this.success,
    this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    // Handling the case where data might be an empty list
    if (json['data'] is List && (json['data'] as List).isEmpty) {
      return ApiResponse._(
        success: json['success'] as bool,
        message: json['message'] as String?,
        data: fromJsonT(null),
      );
    } else {
      return _$ApiResponseFromJson(json, fromJsonT);
    }
  }

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'data')
  final T data;
}
