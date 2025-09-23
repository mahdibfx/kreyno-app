import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/dtos/send_otp_dto.dart';
import 'package:kreyno/dtos/user_exists_dto.dart';
import 'package:kreyno/enums/unique_existence_id.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/services/api/api_auth_service.dart';
import 'package:kreyno/services/api/dio_service.dart';

class AuthService {
  final _apiAuthService = ApiAuthService(locator<DioService>().dio);

  Future<Either<String, bool>> checkIfUserExists(String phoneNumber) {
    return _apiAuthService
        .checkIfUserExists(
          UserExistsDto(attribute: UniqueExistenceId.phone, value: phoneNumber),
        )
        .toEither()
        .then((result) => result.map((response) => response.exists));
  }

  Future<Either<String, bool>> sendOtp(String phoneNumber) {
    return _apiAuthService
        .sendOtp(SendOtpDto(phoneNumber: phoneNumber))
        .toEither()
        .then((result) => result.map((response) => response.isEmpty));
  }
}
