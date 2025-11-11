import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UrlLauncherService {
  final _logger = getLogger('UrlLauncherService');

  Future<Either<String, Unit>> launchUrl(
    String url, {
    url_launcher.LaunchMode mode = url_launcher.LaunchMode.externalApplication,
  }) async {
    try {
      final uri = Uri.parse(url);
      if (!await url_launcher.canLaunchUrl(uri)) {
        _logger.e('Cannot launch URL: $url');
        return left('Cannot launch this URL');
      }

      final launched = await url_launcher.launchUrl(uri, mode: mode);
      if (!launched) {
        _logger.e('Failed to launch URL: $url');
        return left('Failed to launch URL');
      }

      _logger.i('Successfully launched URL: $url');
      return right(unit);
    } catch (e) {
      _logger.e('Error launching URL: $url', error: e);
      return left('An error occurred while launching the URL');
    }
  }

  Future<Either<String, Unit>> launchPhoneNumber(String phoneNumber) async {
    try {
      final cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
      final uri = Uri.parse('tel:$cleanedNumber');

      if (!await url_launcher.canLaunchUrl(uri)) {
        _logger.e('Cannot launch phone number: $phoneNumber');
        return left('Cannot make phone calls on this device');
      }

      final launched = await url_launcher.launchUrl(uri);
      if (!launched) {
        _logger.e('Failed to launch phone number: $phoneNumber');
        return left('Failed to open phone dialer');
      }

      _logger.i('Successfully launched phone number: $phoneNumber');
      return right(unit);
    } catch (e) {
      _logger.e('Error launching phone number: $phoneNumber', error: e);
      return left('An error occurred while opening the phone dialer');
    }
  }
}
