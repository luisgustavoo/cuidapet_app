import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../app/app_controller.dart';
import '../app/modules/main_page/main_page.dart';
import '../shared/auth_store.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';


class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        //$AppController,
        Bind((i) => AppController()),
        Bind((i) => AuthStore()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (context, args) => MainPage()),
    ModularRouter('/home', module: HomeModule()),
    ModularRouter('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
