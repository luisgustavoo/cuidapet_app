import 'package:mobx/mobx.dart';

import '../repository/shared_prefs_repository.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @action
  Future<bool> isLogged() async {
    final prefs = await SharedPrefsRepository.instance;
    final accessToken = prefs.accessToken;

    return accessToken != null;
  }
}
