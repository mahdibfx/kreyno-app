import 'package:fpdart/fpdart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/paginated_list.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/api/api_reservation_service.dart';
import 'package:kreyno/services/api/dio_service.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/socket_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class ReservationsService with ListenableServiceMixin {
  final _wsService = SocketService();
  final _authService = locator<AuthService>();
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
    try {
      // Check if socket is initialized
      if (!_wsService.isConnected) {
        final token = await _authService.getAccessToken();

        if (token == null) {
          _logger.w("No access token available");
          return;
        }

        _wsService.initialize(authToken: token, userId: userId.toString());

        // Wait for connection to establish
        await Future.delayed(const Duration(seconds: 2));
      }

      // Verify echo is available after initialization
      if (!_wsService.isConnected) {
        _logger.e("Pusher still null after initialization");
        return;
      }

      // Subscribe to the private channel
      _wsService.listenToPrivateChannel(
        channel: 'user.$userId',
        event: 'reservation.status.changed',
        onEvent: (event) {
          try {
            _logger.i("📨 Reservation event received");

            // The data structure is: { "reservation": { ... } }
            // Extract the reservation object
            final reservationData = event['reservation'];

            if (reservationData == null) {
              _logger.e("No reservation data in event");
              return;
            }

            // Parse the reservation
            final reservationReceived = Reservation.fromJson(reservationData);

            // Update the reservation
            _reservation = null;

            _reservation = reservationReceived;

            notifyListeners();

            _logger.i("✅ Reservation updated successfully");
          } catch (e, stackTrace) {
            _logger.e("Error parsing reservation: $e");
            _logger.e(stackTrace.toString());
          }
        },
        onError: (error) {
          _logger.e("Reservation channel error: $error");
        },
      );
    } catch (e, stackTrace) {
      _logger.e("Error setting up reservation listener: $e");
      _logger.e(stackTrace.toString());
    }
  }

  Future<void> listenToReservationUpdates(int userId) async {
    try {
      // Check if socket is initialized
      if (!_wsService.isConnected) {
        final token = await _authService.getAccessToken();

        if (token == null) {
          _logger.w("No access token available");
          return;
        }

        _wsService.initialize(authToken: token, userId: userId.toString());

        // Wait for connection to establish
        await Future.delayed(const Duration(seconds: 2));
      }

      // Verify echo is available after initialization
      if (!_wsService.isConnected) {
        _logger.e("Pusher still null after initialization");
        return;
      }

      // Subscribe to the private channel
      _wsService.listenToPrivateChannel(
        channel: 'user.$userId',
        event: 'reservation.new',
        onEvent: (event) {
          try {
            _logger.i("📨 Reservation event received");

            // The data structure is: { "reservation": { ... } }
            // Extract the reservation object
            final reservationData = event['reservation'];

            if (reservationData == null) {
              _logger.e("No reservation data in event");
              return;
            }

            // Parse the reservation
            final reservationReceived = Reservation.fromJson(reservationData);

            // Update the reservation
            _reservation = reservationReceived;
            notifyListeners();

            _logger.i("✅ Reservation updated successfully");
          } catch (e, stackTrace) {
            _logger.e("Error parsing reservation: $e");
            _logger.e(stackTrace.toString());
          }
        },
        onError: (error) {
          _logger.e("Reservation channel error: $error");
        },
      );
    } catch (e, stackTrace) {
      _logger.e("Error setting up reservation listener: $e");
      _logger.e(stackTrace.toString());
    }
  }

  void stopListeningToReservationUpdates(int userId) {
    try {
      _wsService.leaveChannel('user.$userId', isPrivate: true);
      _logger.i("Stopped listening to reservation updates");
    } catch (e) {
      _logger.e("Error leaving channel: $e");
    }
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

  void removeReservation() {
    _reservation = null;
    notifyListeners();
  }
}
