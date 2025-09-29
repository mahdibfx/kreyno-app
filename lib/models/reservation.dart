import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kreyno/models/parking_place.dart';

part 'reservation.freezed.dart';
part 'reservation.g.dart';

@freezed
abstract class Reservation with _$Reservation {
  const factory Reservation({
    required String id,
    required Buyer buyer,
    @JsonKey(name: 'parking_place') required ParkingPlace parkingPlace,
    String? status,
    String? observation,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
}

@freezed
abstract class Buyer with _$Buyer {
  const factory Buyer({
    required String username,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String phone,
    required Avatar avatar,
  }) = _Buyer;

  factory Buyer.fromJson(Map<String, dynamic> json) => _$BuyerFromJson(json);
}

@freezed
abstract class Avatar with _$Avatar {
  const factory Avatar({required String id, required String url}) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}
