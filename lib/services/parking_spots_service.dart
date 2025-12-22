import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/dtos/create_parking_spot_dto.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/paginated_list.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/services/api/api_parking_spot_service.dart';
import 'package:kreyno/services/api/dio_service.dart';
import 'package:stacked/stacked.dart';

class ParkingSpotsService with ListenableServiceMixin {
  final _apiParkingSpotService = ApiParkingSpotService(
    locator<DioService>().dio,
  );

  Future<Either<String, PaginatedList<ParkingSpot>>> getParkingSpots({
    DateTime? from,
    DateTime? to,
    int page = 0,
  }) {
    return _apiParkingSpotService
        .getParkingSpots(from, to, page)
        .toPaginatedEither();
  }

  Future<Either<String, ParkingSpot>> getParkingSpot(int id) {
    return _apiParkingSpotService.getParkingSpot(id).toEither();
  }

  Future<Either<String, int>> deleteParkingSpot(int id) {
    return _apiParkingSpotService
        .deleteParkingSpot(id)
        .toEither()
        .then((result) => result.map((response) => response.parkingSpotId));
  }

  Future<Either<String, List<ParkingSpot>>> getNearbyParkingSpots(
    double latitude,
    double longitude,
    double radius,
    int? possibleElectric,
  ) {
    return _apiParkingSpotService
        .getNearbyParkingSpots(latitude, longitude, radius, possibleElectric)
        .toEither();
  }

  Future<Either<String, ParkingSpot>> createParkingSpot(
    CreateParkingSpotDto dto,
  ) {
    return _apiParkingSpotService.createParkingSpot(dto).toEither();
  }
}
