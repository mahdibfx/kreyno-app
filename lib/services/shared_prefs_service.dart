import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  final _logger = getLogger('SharedPrefsService');
  SharedPreferences? _prefs;

  Future<Either<String, Unit>> _ensureInitialized() async {
    try {
      _prefs ??= await SharedPreferences.getInstance();
      return const Right(unit);
    } catch (e) {
      _logger.e('Failed to initialize SharedPreferences: $e');
      return Left('Failed to initialize local storage: $e');
    }
  }

  Future<Either<String, Unit>> writeData(String key, String value) async {
    final initResult = await _ensureInitialized();

    return initResult.fold((error) => Left(error), (_) async {
      try {
        await _prefs!.setString(key, value);
        _logger.i('Data saved for key: $key');
        return const Right(unit);
      } catch (e) {
        _logger.e('Error saving data for key $key: $e');
        return Left('Failed to save data: $e');
      }
    });
  }

  Future<Either<String, String?>> readData(String key) async {
    final initResult = await _ensureInitialized();

    return initResult.fold((error) => Left(error), (_) async {
      try {
        final value = _prefs!.getString(key);
        _logger.i('Data read for key: $key');
        return Right(value);
      } catch (e) {
        _logger.e('Error reading data for key $key: $e');
        return Left('Failed to read data: $e');
      }
    });
  }

  Future<Either<String, Unit>> deleteData(String key) async {
    final initResult = await _ensureInitialized();

    return initResult.fold((error) => Left(error), (_) async {
      try {
        await _prefs!.remove(key);
        _logger.i('Data deleted for key: $key');
        return const Right(unit);
      } catch (e) {
        _logger.e('Error deleting data for key $key: $e');
        return Left('Failed to delete data: $e');
      }
    });
  }

  Future<Either<String, Unit>> deleteAllData() async {
    final initResult = await _ensureInitialized();

    return initResult.fold((error) => Left(error), (_) async {
      try {
        await _prefs!.clear();
        _logger.i('All data deleted');
        return const Right(unit);
      } catch (e) {
        _logger.e('Error deleting all data: $e');
        return Left('Failed to clear all data: $e');
      }
    });
  }
}
