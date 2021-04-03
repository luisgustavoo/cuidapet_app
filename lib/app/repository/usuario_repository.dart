import 'dart:io';

import 'package:cuidapet_app/app/models/confirm_login_model.dart';
import 'package:cuidapet_app/app/repository/shared_prefs_repository.dart';

import '../core/dio/custom_dio.dart';
import '../models/access_token_model.dart';

class UsuarioRepository {
  Future<AccessTokenModel> login(String email,
      {String password, bool facebookLogin = false, String avatar = ''}) {
    return CustomDio.instance.post('/login', data: {
      'login': email,
      'senha': password,
      'facebookLogin': facebookLogin,
      'avatar': avatar
    }).then((res) => AccessTokenModel.fromJson(res.data));
  }

  Future<ConfirmLoginModel> confirmLogin() async {
    final prefs = await SharedPrefsRepository.instance;
    final deviceId = prefs.deviceId;
    return CustomDio.authInstance.patch('/login/confirmar', data: {
      'ios_token': Platform.isIOS ? deviceId : null,
      'android_token': Platform.isAndroid ? deviceId : null,
    }).then((res) => ConfirmLoginModel.fromJson(res.data));
  }
}
