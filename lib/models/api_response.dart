import 'package:json_annotation/json_annotation.dart';
import 'package:kreyno/models/transaction_data.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, constructor: '_')
class ApiResponse<T> {
  const ApiResponse._({
    required this.success,
    this.message,
    required this.data,
    this.meta,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    // Handling the case where data might be an empty list
    if (json['data'] is List && (json['data'] as List).isEmpty) {
      // If T is TransactionData, return empty TransactionData
      if (T == TransactionData) {
        return ApiResponse._(
          success: json['success'] as bool,
          message: json['message'] as String?,
          data: const TransactionData(transactionsByMonth: {}) as T,
        );
      }
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

  @JsonKey(name: 'meta')
  final Map<String, dynamic>? meta;
}
