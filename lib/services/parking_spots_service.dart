import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/dtos/create_parking_spot_dto.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/current_active_parking_place.dart';
import 'package:kreyno/models/paginated_list.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/services/api/api_parking_spot_service.dart';
import 'package:kreyno/services/api/dio_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class ParkingSpotsService with ListenableServiceMixin {
  final _logger = getLogger('ParkingSpotsService');
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

  /// Fetches the seller's latest active parking place (with its in-progress
  /// reservation when one exists). Resolves to `right(null)` when there is no
  /// active place — treating both a `200` with `data: null` and a `404` as
  /// "nothing active" so it behaves regardless of how the backend signals the
  /// empty case. Any other failure resolves to `left(message)`.
  Future<Either<String, CurrentActiveParkingPlace?>>
  getCurrentActiveParkingSpot() async {
    try {
      final response =
          await _apiParkingSpotService.getCurrentActiveParkingSpot();
      if (response.success) {
        return right(response.data);
      }
      return left(response.message ?? ApiErrorStrings.requestFailed);
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) {
        return right(null);
      }
      _logger.w('Failed to fetch current active parking spot', error: error);
      final data = error.response?.data;
      final message = data is Map<String, dynamic>
          ? data['message'] as String?
          : null;
      return left(message ?? ApiErrorStrings.requestFailed);
    } catch (error) {
      _logger.e('Unexpected error fetching current active parking spot',
          error: error);
      return left(ApiErrorStrings.unexpectedError);
    }
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
