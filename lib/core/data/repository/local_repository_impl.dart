import 'package:shared_preferences/shared_preferences.dart';
import 'package:warranty_saver/core/domain/repository/local_repository.dart';

class LocalRepositoryImpl implements LocalRepository {
  LocalRepositoryImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const String _firstLaunchKey = 'first_launch';
  static const String _rememberDeviceKey = 'remember_device';
  static const String _emailKey = 'email';

  @override
  Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstLaunchKey) ?? true;
  }

  @override
  Future<void> setFirstLaunchCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstLaunchKey, false);
  }

  @override
  Future<bool> isDeviceRemembered() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_rememberDeviceKey) ?? true;
  }

  @override
  Future<void> setDeviceRemembered({required bool remembered}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_rememberDeviceKey, remembered);
  }

  @override
  Future<void> logout() async {
    await _sharedPreferences.remove(_emailKey);
  }
}
