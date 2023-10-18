abstract class ILocalStorage {
  Future<void> saveRefreshToken(String token);
  Future<String> getRefreshToken();
}
