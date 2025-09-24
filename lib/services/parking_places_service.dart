import 'package:dio/dio.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/parking_place.dart';
import 'package:kreyno/services/api/api_parking_places_service.dart';
import 'package:kreyno/services/api/dio_service.dart';

class ParkingPlacesService {
  final _apiService = ApiParkingPlacesService(locator<DioService>().dio);
  Future<ApiResponse<List<ParkingPlace>>> getUserParkingPlaces() async {
    try {
      final result = await _apiService.getUserParkingPlaces();
      return result;
    } on DioException catch (e) {
      // Handle network errors specifically
      if (e.type == DioExceptionType.connectionError) {
        // TODO: map to a custom error model or show "no internet" message
      }
      rethrow;
    } catch (e) {
      // Handle any other kind of error
      rethrow;
    }
  }
}
