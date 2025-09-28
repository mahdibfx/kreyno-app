import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/api/api_reservations_service.dart';
import 'package:kreyno/services/api/dio_service.dart';

class ReservationsService {
  final _apiService = ApiReservationsService(locator<DioService>().dio);
  Future<ApiResponse<List<Reservation>>> getListOfUserReservations() async {
    final result = await _apiService.getUserReservations();
    return result;
  }
}
