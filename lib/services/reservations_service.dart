import 'package:fpdart/fpdart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/paginated_list.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/api/api_reservation_service.dart';
import 'package:kreyno/services/api/dio_service.dart';
import 'package:kreyno/services/socket_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class ReservationsService with ListenableServiceMixin {
  final _wsService = SocketService();
  final _apiReservationService = ApiReservationService(
    locator<DioService>().dio,
  );
  final _logger = Logger();

  Reservation? _reservation;

  Reservation? get reservation => _reservation;

  ReservationsService() {
    listenToReactiveValues([_reservation]);
  }

  Future<Either<String, void>> buyerChangedLocation(
    int reservationId,
    LatLng location,
    bool arrived,
  ) {
    return _apiReservationService.buyerChangedLocation(reservationId, {
      "latitude": location.latitude,
      "longitude": location.longitude,
      "arrived": arrived,
    }).toEither();
  }

  Future<Either<String, Reservation>> createReservation(
    int parkingSpotId,
    String paymentMethodId,
  ) {
    return _apiReservationService.createReservation({
      "parking_place_id": parkingSpotId,
      "payment_method_id": paymentMethodId,
    }).toEither();
  }

  Future<Either<String, void>> cancelReservation(
    int reservationId,
    String observation,
  ) {
    return _apiReservationService.cancelReservation(reservationId, {
      "observation": observation,
    }).toEither();
  }

  Future<Either<String, void>> confirmReservation(int reservationId) {
    return _apiReservationService.confirmReservation(reservationId).toEither();
  }

  Future<Either<String, void>> completeReservation(int reservationId) {
    return _apiReservationService.completeReservation(reservationId).toEither();
  }

  Future<void> listenToReservationStatusChanged(int userId) async {
    await _wsService.subscribePrivate(
      channel: 'user.$userId',
      event: 'reservation.status.changed',
      onEvent: (data) => _handleReservationEvent(data),
    );
  }

  Future<void> listenToReservationUpdates(int userId) async {
    await _wsService.subscribePrivate(
      channel: 'user.$userId',
      event: 'reservation.new',
      onEvent: (data) => _handleReservationEvent(data),
    );
  }

  /// Parses a `{ "reservation": { ... } }` payload and publishes it.
  void _handleReservationEvent(dynamic data) {
    try {
      _logger.i("📨 Reservation event received");
      final event = Map<String, dynamic>.from(data as Map);
      final reservationData = event['reservation'];
      if (reservationData == null) {
        _logger.e("No reservation data in event");
        return;
      }
      _reservation = Reservation.fromJson(
        Map<String, dynamic>.from(reservationData as Map),
      );
      notifyListeners();
      _logger.i("✅ Reservation updated successfully");
    } catch (e, stackTrace) {
      _logger.e("Error parsing reservation: $e");
      _logger.e(stackTrace.toString());
    }
  }

  void stopListeningToReservationUpdates(int userId) {
    // Unbind only the reservation events, leaving any other listeners on the
    // shared `user.$userId` channel (e.g. buyer-location) intact.
    _wsService.unsubscribe(channel: 'user.$userId', event: 'reservation.new');
    _wsService.unsubscribe(
      channel: 'user.$userId',
      event: 'reservation.status.changed',
    );
    _logger.i("Stopped listening to reservation updates");
  }

  void disconnectSocket() {
    try {
      _wsService.disconnect();
      _logger.i("Socket disconnected");
    } catch (e) {
      _logger.e("Error disconnecting: $e");
    }
  }

  Future<Either<String, PaginatedList<Reservation>>> getReservations({
    DateTime? from,
    DateTime? to,
    int page = 0,
  }) {
    return _apiReservationService
        .getReservations(from, to, page)
        .toPaginatedEither();
  }

  /// Seeds the current reservation from an API payload (e.g. the resume flow
  /// restoring an in-progress reservation on app start) instead of a socket
  /// event, and publishes it exactly the same way.
  void setReservation(Reservation reservation) {
    _reservation = reservation;
    notifyListeners();
  }

  void removeReservation() {
    _reservation = null;
    notifyListeners();
  }
}
