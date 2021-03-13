import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {

  @action
  Future<bool> isLogged() async {
    return Future.value(true);
  }
}