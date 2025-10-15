import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/dtos/change_phone_number_dto.dart';
import 'package:kreyno/dtos/login_dto.dart';
import 'package:kreyno/dtos/register_dto.dart';
import 'package:kreyno/dtos/send_otp_dto.dart';
import 'package:kreyno/dtos/user_exists_dto.dart';
import 'package:kreyno/enums/gender.dart';
import 'package:kreyno/enums/unique_existence_id.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/auth_response.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/api/api_auth_service.dart';
import 'package:kreyno/services/api/dio_service.dart';
import 'package:kreyno/services/device_service.dart';
import 'package:kreyno/services/shared_prefs_service.dart';
import 'package:kreyno/services/user_service.dart';

class AuthService {
  final _logger = getLogger('AuthService');
  final _apiAuthService = ApiAuthService(locator<DioService>().dio);
  final _deviceService = locator<DeviceService>();
  final _userService = locator<UserService>();
  final _sharedPrefsService = locator<SharedPrefsService>();

  Future<Either<String, bool>> checkIfUserExists({
    required UniqueExistenceId attribute,
    required String value,
  }) {
    return _apiAuthService
        .checkIfUserExists(UserExistsDto(attribute: attribute, value: value))
        .toEither()
        .then((result) => result.map((response) => response.exists));
  }

  Future<Either<String, bool>> sendOtp(String phoneNumber) {
    return _apiAuthService
        .sendOtp(SendOtpDto(phoneNumber: phoneNumber))
        .toEither()
        .then((result) => result.map((response) => response.isEmpty));
  }

  Future<Either<String, AuthResponse>> login({
    required String phone,
    required String otp,
  }) async {
    final deviceIdResult = await _deviceService.getDeviceId();

    return deviceIdResult.fold(
      (error) => Left(error),
      (deviceId) => _apiAuthService
          .signIn(LoginDto(phone: phone, otp: otp, deviceId: deviceId))
          .toEither(),
    );
  }

  Future<Either<String, User>> changePhoneNumber({
    required String phone,
    required String otp,
  }) async {
    return _apiAuthService
        .changePhoneNumber(ChangePhoneNumberDto(phone: phone, otp: otp))
        .toEither();
  }

  Future<Either<String, AuthResponse>> register({
    required String firstName,
    required String lastName,
    required String userName,
    required String phone,
    required String email,
    required Gender gender,
    required DateTime birthDate,
    // required String? address,
    required String otp,
  }) async {
    final deviceIdResult = await _deviceService.getDeviceId();

    return deviceIdResult.fold(
      (error) => Left(error),
      (deviceId) => _apiAuthService
          .signUp(
            RegisterDto(
              firstName: firstName,
              lastName: lastName,
              userName: userName,
              phone: phone,
              email: email,
              gender: gender,
              birthDate: birthDate,
              // address: address,
              otp: otp,
              deviceId: deviceId,
            ),
          )
          .toEither(),
    );
  }

  // REMINDER: called in a viewModel after successfully login or register
  Future<Either<String, Unit>> setAuthenticatedUser(
    AuthResponse authResponse,
  ) async {
    final saveResult = await _saveAccessToken(authResponse.accessToken);

    return saveResult.fold((error) => Left(error), (_) {
      _userService.setUserData(authResponse.user);
      return const Right(unit);
    });
  }

  // Token management methods
  Future<Either<String, Unit>> _saveAccessToken(String token) async {
    final result = await _sharedPrefsService.writeData(
      AppConstants.accessTokenKey,
      token,
    );

    return result.fold((error) => Left(error), (_) {
      _logger.i('Access token saved successfully');
      return const Right(unit);
    });
  }

  Future<String?> getAccessToken() async {
    final result = await _sharedPrefsService.readData(
      AppConstants.accessTokenKey,
    );
    return result.fold((_) => null, (token) {
      _logger.i('access token => $token');
      return token;
    });
  }

  Future<Either<String, Unit>> clearAccessToken() async {
    final result = await _sharedPrefsService.deleteData(
      AppConstants.accessTokenKey,
    );

    return result.fold(
      (error) => Left('Failed to clear access token: $error'),
      (_) {
        _logger.i('Access token cleared successfully');
        return const Right(unit);
      },
    );
  }
}
