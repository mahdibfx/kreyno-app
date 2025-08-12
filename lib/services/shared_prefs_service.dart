import 'package:kreyno/app/app.logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  final _logger = getLogger('SharedPrefsService');

  Future<void> writeData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    _logger.i('data saved');
  }

  Future<String?> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    _logger.i('data read');
    return value;
  }

  Future<void> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    _logger.i('data deleted');
  }

  Future<void> deleteAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _logger.i('all data deleted');
  }
}
