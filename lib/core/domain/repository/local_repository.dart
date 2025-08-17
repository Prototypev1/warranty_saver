abstract class LocalRepository {
  Future<bool> isFirstLaunch();
  Future<void> setFirstLaunchCompleted();
  Future<bool> isDeviceRemembered();
  Future<void> setDeviceRemembered({required bool remembered});
  Future<bool> isLoggedIn();
  Future<void> saveUser(String email);
  Future<void> logout();
}
