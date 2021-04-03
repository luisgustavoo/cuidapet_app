import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsRepository {


  SharedPrefsRepository._();

  static Future<SharedPrefsRepository> get instance async {
    prefs ??= await SharedPreferences.getInstance();
    _instanceRepository ??= SharedPrefsRepository._();
    return _instanceRepository;
  }

  Future<void> registerAccessToken(String token) async {
    return await prefs.setString(_accessTokenKey, token);
  }

  String get accessToken => prefs.get(_accessTokenKey);

  Future<void> registerDeviceId(String deviceId) async {
    return await prefs.setString(_deviceIdKey, deviceId);
  }

  String get deviceId => prefs.get(_deviceIdKey);

  static const _accessTokenKey = '/_ACCESS_TOKEN/';
  static const _deviceIdKey = '/_DEVICE_ID/';
  static SharedPreferences prefs;
  static SharedPrefsRepository _instanceRepository;

}
