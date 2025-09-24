import 'package:dio/dio.dart';
import 'package:kreyno/dtos/create_car_dto.dart';
import 'package:kreyno/dtos/update_car_dto.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/car.dart';
import 'package:kreyno/models/get_car_by_registration_response.dart';
import 'package:kreyno/services/api/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'api_car_service.g.dart';

@RestApi()
abstract class ApiCarService {
  factory ApiCarService(Dio dio) = _ApiCarService;

  @GET(ApiEndpoints.cars)
  Future<ApiResponse<List<Car>>> getAllCars();

  @GET(ApiEndpoints.oneCar)
  Future<ApiResponse<Car>> getCar(@Path('id') int id);

  @PATCH(ApiEndpoints.oneCar)
  Future<ApiResponse<Car>> updateCar(
    @Path('id') int id,
    @Body() UpdateCarDto car,
  );

  @DELETE(ApiEndpoints.oneCar)
  Future<ApiResponse<Car>> deleteCar(@Path('id') int id);

  @POST(ApiEndpoints.setDefaultCar)
  Future<ApiResponse<Car>> setDefaultCar(@Path('id') int id);

  @GET(ApiEndpoints.registrationNumber)
  Future<ApiResponse<GetCarByRegistrationResponse>> getCarByRegistrationNumber(
    @Path('number') String number,
  );

  @POST(ApiEndpoints.cars)
  Future<ApiResponse<Car>> createCar(@Body() CreateCarDto car);
}
