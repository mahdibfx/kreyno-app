import 'package:dio/dio.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/parking_place.dart';
import 'package:kreyno/services/api/api_parking_places_service.dart';
import 'package:kreyno/services/api/dio_service.dart';

class ParkingPlacesService {
  final _apiService = ApiParkingPlacesService(locator<DioService>().dio);
  Future<ApiResponse<List<ParkingPlace>>> getUserParkingPlaces() async {
    final result = await _apiService.getUserParkingPlaces();
    return result;
  }

  Future<ApiResponse<List<ParkingPlace>>> getUserGivenUpParkingPlaces() async {
    throw UnimplementedError();
    // TODO There is no route for this in api's
    // final result = await _apiService.getUserParkingPlaces();
    // return result;
  }
}
