abstract class LocalRepository {
  Future<bool> isFirstLaunch();
  Future<void> setFirstLaunchCompleted();
  Future<bool> isDeviceRemembered();
  Future<void> setDeviceRemembered({required bool remembered});
  Future<void> logout();
}
