import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/api/api_reservation_service.dart';
import 'package:kreyno/services/api/dio_service.dart';

class ReservationsService {
  final _apiReservationService = ApiReservationService(
    locator<DioService>().dio,
  );

  Future<Either<String, List<Reservation>>> getReservations({
    DateTime? from,
    DateTime? to,
  }) {
    return _apiReservationService.getReservations(from, to).toEither();
  }
}
