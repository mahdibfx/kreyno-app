import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/app/app_constants.dart';
import 'package:kreyno/enums/supported_language.dart';
import 'package:kreyno/services/shared_prefs_service.dart';

class PickedLanguageService {
  final _logger = getLogger('PickedLanguageService');
  final _sharedPrefsService = locator<SharedPrefsService>();

  Future<Either<String, bool>> isLanguageSelected() async {
    final readResult = await _sharedPrefsService.readData(
      AppConstants.pickedLanguageKey,
    );

    return readResult.fold(
      (error) => Left('Failed to check language selection: $error'),
      (languageCode) => Right(languageCode != null && languageCode.isNotEmpty),
    );
  }

  Future<Either<String, SupportedLanguage?>> getPickedLanguage() async {
    final readResult = await _sharedPrefsService.readData(
      AppConstants.pickedLanguageKey,
    );

    return readResult.fold(
      (error) => Left('Failed to get picked language: $error'),
      (languageCode) {
        if (languageCode == null || languageCode.isEmpty) {
          return const Right(null);
        }

        try {
          final language = SupportedLanguage.values.firstWhere(
            (lang) => lang.code == languageCode,
          );
          return Right(language);
        } catch (e) {
          _logger.w('Invalid language code found: $languageCode');
          return const Right(null);
        }
      },
    );
  }

  Future<Either<String, Unit>> savePickedLanguage(
    SupportedLanguage language,
  ) async {
    final writeResult = await _sharedPrefsService.writeData(
      AppConstants.pickedLanguageKey,
      language.code,
    );

    return writeResult.fold(
      (error) => Left('Failed to save picked language: $error'),
      (_) {
        _logger.i('Saved picked language: ${language.code}');
        return const Right(unit);
      },
    );
  }

  Future<Either<String, Unit>> clearPickedLanguage() async {
    final result = await _sharedPrefsService.deleteData(
      AppConstants.pickedLanguageKey,
    );

    return result.fold(
      (error) => Left('Failed to clear picked language: $error'),
      (_) {
        _logger.i('Picked language cleared');
        return const Right(unit);
      },
    );
  }
}
