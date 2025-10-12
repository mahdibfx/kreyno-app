import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/models/user.dart';
import 'package:kreyno/services/user_service.dart';
import 'package:stacked/stacked.dart';

class ProfileSheetModel extends ReactiveViewModel {
  final _logger = getLogger('ProfileSheetModel');
  final _userService = locator<UserService>();

  User get currentUser => _userService.currentUser!;

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];
}
