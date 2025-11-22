import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/enums/reservation_status.dart';
import 'package:kreyno/enums/vehicle_type.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/car.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/api/api_reservation_service.dart';
import 'package:kreyno/services/api/dio_service.dart';
import 'package:kreyno/services/auth_service.dart';
import 'package:kreyno/services/socket_service.dart';
import 'package:stacked/stacked.dart';

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

  listenToReservationUpdates(int userId) async {
    if (_wsService.echo == null) {
      _wsService.initialize(
        authToken: (await _authService.getAccessToken())!,
        userId: (userId).toString(),
      );
    }

    Future.delayed(const Duration(seconds: 3)).whenComplete(() {
      _reservation = Reservation(
        id: 1,
        buyer: const Buyer(
          username: "Mahdi",
          firstName: "Mahdi",
          lastName: "Bf",
          phone: "0553522128",
          car: Car(
            id: 1,
            vehicleType: VehicleType.fuel,
            brand: "brand",
            model: "model",
            color: "color",
            registrationNumber: "registrationNumber",
            co2Emission: 1,
          ),
        ),
        parkingSpot: const ParkingPlace(
          address: "Mila, Ain Beida",
          longitude: 23,
          latitude: 45,
          geoHash: "geoHash",
          price: 20,
          totalPaidPrice: 20,
          electricChargeStation: true,
          reserved: false,
        ),
        status: ReservationStatus.pending,
        observation: "observation",
        createdAt: DateTime.now(),
      );

      notifyListeners();
    });

    return;
    if (_wsService.isConnected && _wsService.echo != null) {
      final channel = _wsService.echo!.private('user.$userId');

      channel.listen('reservation.new', (event) {
        try {
          final reservationReceived = Reservation.fromJson(event);
          _reservation = reservationReceived;
          notifyListeners();
        } catch (e) {
          print(e);
        }
        // Handle the reservation update event
        print('Reservation updated: ${event.data}');
        // You can parse event.data and update _reservation accordingly
      });
    }
  }

  Future<Either<String, List<Reservation>>> getReservations({
    DateTime? from,
    DateTime? to,
  }) {
    return _apiReservationService.getReservations(from, to).toEither();
  }
}
