import 'package:cuidapet_app/app/core/dio/custom_dio.dart';
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
}
