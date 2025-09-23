import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/dtos/update_profile_dto.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/api/api_auth_service.dart';
import 'package:kreyno/services/api/dio_service.dart';
import 'package:stacked/stacked.dart';

class UserService with ListenableServiceMixin {
  final _logger = getLogger('UserService');
  final _apiAuthService = ApiAuthService(locator<DioService>().dio);

  User? _currentUser;

  UserService() {
    listenToReactiveValues([_currentUser]);
  }

  User? get currentUser => _currentUser;
  bool get hasUser => _currentUser != null;

  void setUserData(User user) {
    _currentUser = user;
    notifyListeners();
    _logger.i('User data set in memory');
  }

  Future<Either<String, Unit>> getProfile() {
    return _apiAuthService.getProfile().toEither().then((result) {
      return result.map((user) {
        setUserData(user);
        _logger.i('Profile fetched and updated in memory');
        return unit;
      });
    });
  }

  Future<Either<String, Unit>> updateProfile(UpdateProfileDto dto) {
    return _apiAuthService.updateProfile(dto).toEither().then((result) {
      return result.map((user) {
        setUserData(user);
        _logger.i('Profile updated and synchronized in memory');
        return unit;
      });
    });
  }

  void clearUserData() {
    _currentUser = null;
    notifyListeners();
    _logger.i('User data cleared from memory');
  }
}
