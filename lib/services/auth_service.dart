import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/dtos/update_profile_dto.dart';
import 'package:kreyno/dtos/user_exists_dto.dart';
import 'package:kreyno/enums/unique_existence_id.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/models/user_exists_response.dart';
import 'package:kreyno/services/api/api_auth_service.dart';
import 'package:kreyno/services/api/dio_service.dart';

class AuthService {
  final _apiService = ApiAuthService(locator<DioService>().dio);
  Future<ApiResponse<User>> updateProfile(
    UpdateProfileDto updateProfileDto,
  ) async {
    final result = await _apiService.updateProfile(updateProfileDto);
    return result;
  }

  Future<ApiResponse<User>> getProfile() async {
    final result = await _apiService.getProfile();

    return result;
  }

  Future<ApiResponse<UserExistsResponse>> checkUserExistence(
    String username,
  ) async {
    final result = await _apiService.checkIfUserExists(
      UserExistsDto(attribute: UniqueExistenceId.username, value: username),
    );

    return result;
  }
}
