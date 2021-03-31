import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthInterceptorWrapper extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    if (DotEnv().env['profile'] == 'dev') {
      print('###### Request Log ######');
      print('url ${options.uri}');
      print('method ${options.method}');
      print('data ${options.data}');
      print('headers  ${options.headers}');
    }
  }

  @override
  Future onResponse(Response response) async {
    if (DotEnv().env['profile'] == 'dev') {
      print('###### Response Log ######');
      print('data ${response.data}');
    }
  }

  @override
  Future onError(DioError err) async {
    print('###### On Error ######');
    print('error: ${err.response}');
    // verificar se deu erro 403, 401 fazer refresh do token.
    return err;
  }
}
