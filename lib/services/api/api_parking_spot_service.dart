import 'package:dio/dio.dart';
import 'package:kreyno/dtos/create_parking_spot_dto.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/delete_parking_spot_api_response.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/services/api/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'api_parking_spot_service.g.dart';

@RestApi()
abstract class ApiParkingSpotService {
  factory ApiParkingSpotService(Dio dio) = _ApiParkingSpotService;

  @GET(ApiEndpoints.parkingPlaces)
  Future<ApiResponse<List<ParkingSpot>>> getParkingSpots(
    @Query('from') DateTime? from,
    @Query('to') DateTime? to,
  );

  @GET(ApiEndpoints.oneParkingPlace)
  Future<ApiResponse<ParkingSpot>> getParkingSpot(@Path('id') int id);

  @DELETE(ApiEndpoints.oneParkingPlace)
  Future<ApiResponse<DeleteParkingSpotApiResponse>> deleteParkingSpot(
    @Path('id') int id,
  );

  @GET(ApiEndpoints.nearbyParkingPlaces)
  Future<ApiResponse<List<ParkingSpot>>> getNearbyParkingSpots(
    @Query('latitude') double latitude,
    @Query('longitude') double longitude,
    @Query('radius') double radius,
    @Query('electric_charge_station') int? possibleElectric,
  );

  @POST(ApiEndpoints.parkingPlaces)
  Future<ApiResponse<ParkingSpot>> createParkingSpot(
    @Body() CreateParkingSpotDto dto,
  );
}
