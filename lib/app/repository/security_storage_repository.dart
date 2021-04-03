import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityStorageRepository {
  static const refreshTokenKey = '/REFRESH_TOKEN/';

  Future<void> registerRefreshToken(String token) async {
    final store = FlutterSecureStorage();
    return await store.write(key: refreshTokenKey, value: token);
  }

  Future<String> get refreshToken async {
    final store = FlutterSecureStorage();
    return await store.read(key: refreshTokenKey);
  }
}
