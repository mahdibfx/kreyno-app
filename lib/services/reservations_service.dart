import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/enums/reservation_status.dart';
import 'package:kreyno/enums/vehicle_type.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/avatar.dart';
import 'package:kreyno/models/car.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/api/api_reservation_service.dart';
import 'package:kreyno/services/api/dio_service.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/socket_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

import '../models/parking_spot.dart';

class ReservationsService with ListenableServiceMixin {
  final _wsService = SocketService();
  final _authService = locator<AuthService>();
  final _apiReservationService = ApiReservationService(
    locator<DioService>().dio,
  );
  Reservation? _reservation;

  Reservation? get reservation => _reservation;

  ReservationsService() {
    listenToReactiveValues([_reservation]);
  }

  Future<Either<String, void>> cancelReservation(
    int reservationId,
    String observation,
  ) {
    return _apiReservationService.cancelReservation(reservationId, {
      "observation": observation,
    }).toEither();
  }

  Future<Either<String, void>> completeReservation(int reservationId) {
    return _apiReservationService.completeReservation(reservationId).toEither();
  }

  Future<void> listenToReservationUpdates(int userId) async {
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      _reservation = Reservation(
        id: 1,
        buyer: const Buyer(
          username: "username",
          firstName: "firstName",
          lastName: "lastName",
          phone: "phone",
          car: Car(
            id: 2,
            vehicleType: VehicleType.fuel,
            brand: "brand",
            model: "model",
            color: "color",
            registrationNumber: "registrationNumber",
            co2Emission: 1,
            image: Image(id: 2, url: "https://picsum.photos/400/400"),
          ),
          avatar: Avatar(id: 3, url: "https://picsum.photos/400/400"),
        ),
        parkingSpot: const ParkingPlace(
          address: "address",
          longitude: 1,
          latitude: 1,
          // geohash: "geohash",
          price: 1,
          totalPaidPrice: 1,
          electricChargeStation: true,
          reserved: true,
          geoHash: 'fff',
        ),
        status: ReservationStatus.pending,
        observation: "observation",
        createdAt: DateTime.now(),
      );
    });
    notifyListeners();
    return;
    try {
      // Check if socket is initialized
      if (_wsService.echo == null || !_wsService.isConnected) {
        final token = await _authService.getAccessToken();

        if (token == null) {
          Logger().e("[RESERVATION] ❌ ERROR: No access token available!");

          return;
        }

        _wsService.initialize(authToken: token, userId: userId.toString());

        // Wait a bit for connection to establish
        await Future.delayed(const Duration(seconds: 2));

        _wsService.debugStatus();
      } else {
        Logger().i("[RESERVATION] ✅ Socket already initialized and connected");
      }

      // Verify echo is available after initialization
      if (_wsService.echo == null) {
        Logger().e(
          "[RESERVATION] ❌ CRITICAL: Echo still null after initialization!",
        );
        Logger().e("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
        return;
      }

      // Subscribe to the private channel
      _wsService.listenToPrivateChannel(
        channel: 'user.$userId',
        event: 'reservation.new',
        onEvent: (event) {
          try {
            // Parse the reservation

            final reservationReceived = Reservation.fromJson(event);

            Logger().i("[RESERVATION] ✅ Reservation parsed successfully");
            Logger().i(
              "[RESERVATION] 🆔 Reservation ID: ${reservationReceived.id}",
            );
            Logger().d(
              "[RESERVATION] 📋 Reservation details: $reservationReceived",
            );

            // Update the reservation
            _reservation = reservationReceived;

            notifyListeners();
          } catch (e, stackTrace) {
            Logger().e("[RESERVATION] Error: $e");
          }
        },
        onError: (error) {
          Logger().e("[RESERVATION] Error: $error");
        },
      );
    } catch (e, stackTrace) {
      Logger().e("[RESERVATION] Error: $e");
    }
  }

  // Optional: Method to stop listening
  void stopListeningToReservationUpdates(int userId) {
    Logger().i("[RESERVATION] 🛑 stopListeningToReservationUpdates() called");
    Logger().i("[RESERVATION] 👤 User ID: $userId");

    try {
      _wsService.leaveChannel('user.$userId', isPrivate: true);
      Logger().i("[RESERVATION] ✅ Left channel successfully");
    } catch (e) {
      Logger().e("[RESERVATION] ❌ Error leaving channel: $e");
    }
  }

  // Optional: Method to manually disconnect socket
  void disconnectSocket() {
    Logger().i("[RESERVATION] 🔌 disconnectSocket() called");

    try {
      _wsService.disconnect();
      Logger().i("[RESERVATION] ✅ Socket disconnected");
    } catch (e) {
      Logger().e("[RESERVATION] ❌ Error disconnecting: $e");
    }
  }

  Future<Either<String, List<Reservation>>> getReservations({
    DateTime? from,
    DateTime? to,
  }) {
    return _apiReservationService.getReservations(from, to).toEither();
  }

  removeReservation() {
    _reservation = null;
    notifyListeners();
  }
}
