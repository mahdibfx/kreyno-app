import 'package:dio/dio.dart';
import 'package:kreyno/dtos/login_dto.dart';
import 'package:kreyno/dtos/register_dto.dart';
import 'package:kreyno/dtos/send_otp_dto.dart';
import 'package:kreyno/dtos/update_profile_dto.dart';
import 'package:kreyno/dtos/user_exists_dto.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/auth_response.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/models/user_exists_response.dart';
import 'package:kreyno/services/api/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'api_auth_service.g.dart';

@RestApi()
abstract class ApiAuthService {
  factory ApiAuthService(Dio dio) = _ApiAuthService;

  @POST(ApiEndpoints.exists)
  Future<ApiResponse<UserExistsResponse>> checkIfUserExists(
    @Body() UserExistsDto request,
  );

  @POST(ApiEndpoints.sendOtp)
  Future<ApiResponse<bool>> sendOtp(@Body() SendOtpDto request);

  @POST(ApiEndpoints.signIn)
  Future<ApiResponse<AuthResponse>> signIn(@Body() LoginDto request);

  @POST(ApiEndpoints.register)
  Future<ApiResponse<AuthResponse>> signUp(@Body() RegisterDto request);

  @GET(ApiEndpoints.profile)
  Future<ApiResponse<User>> getProfile();

  @PATCH(ApiEndpoints.profile)
  Future<ApiResponse<User>> updateProfile(@Body() UpdateProfileDto request);
}
