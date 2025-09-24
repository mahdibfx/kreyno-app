import 'package:dio/dio.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/dtos/create_car_dto.dart';
import 'package:kreyno/dtos/update_car_dto.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/car.dart';
import 'package:kreyno/models/get_car_by_registration_response.dart';
import 'package:kreyno/services/api/api_car_service.dart';
import 'package:kreyno/services/api/dio_service.dart';

class CarsService {
  final _carApiService = ApiCarService(locator<DioService>().dio);

  Future<ApiResponse<List<Car>>> getMyCars() async {
    try {
      final result = await _carApiService.getAllCars();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<Car>> getCar(int id) async {
    try {
      final result = await _carApiService.getCar(id);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<Car?> createCar(CreateCarDto carDto) async {
    try {
      final result = await _carApiService.createCar(carDto);
      if (result.success) {
        return result.data;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Car?> updateCar(int id, UpdateCarDto carDto) async {
    try {
      final result = await _carApiService.updateCar(id, carDto);
      if (result.success) {
        return result.data;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Car?> deleteCar(int id) async {
    try {
      final result = await _carApiService.deleteCar(id);
      if (result.success) {
        return result.data;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Car?> setDefaultCar(int id) async {
    try {
      final result = await _carApiService.setDefaultCar(id);
      if (result.success) {
        return result.data;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<GetCarByRegistrationResponse?> getCarByRegistrationNumber(
      String number) async {
    try {
      final result = await _carApiService.getCarByRegistrationNumber(number);
      if (result.success) {
        return result.data;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
