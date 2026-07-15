import 'package:kreyno/models/parking_spot.dart' show ParkingSpot;
import 'package:kreyno/models/reservation.dart' show Reservation;

/// Response of `GET parking-places/current-active`: the seller's latest active
/// parking place together with its in-progress reservation, when one exists.
///
/// Kept as a plain class (not freezed) because [ParkingSpot] and [Reservation]
/// each declare their own conflicting `Seller`/`Car` types, so this only holds
/// references to the two top-level models.
class CurrentActiveParkingPlace {
  const CurrentActiveParkingPlace({
    required this.parkingPlace,
    this.reservation,
  });

  final ParkingSpot parkingPlace;

  /// The place's reservation, if a buyer already reserved it. Null when the
  /// place is still waiting for a buyer (or the backend doesn't send it).
  final Reservation? reservation;

  factory CurrentActiveParkingPlace.fromJson(Map<String, dynamic> json) {
    // Tolerate both response shapes:
    //  - nested: { "parking_place": {...}, "reservation": {...}|null }
    //  - flat:   { ...place fields..., "reservation": {...}|null }
    final placeJson = json['parking_place'] is Map<String, dynamic>
        ? json['parking_place'] as Map<String, dynamic>
        : json;
    final reservationJson = json['reservation'];
    return CurrentActiveParkingPlace(
      parkingPlace: ParkingSpot.fromJson(placeJson),
      reservation: reservationJson is Map<String, dynamic>
          ? Reservation.fromJson(reservationJson)
          : null,
    );
  }
}
