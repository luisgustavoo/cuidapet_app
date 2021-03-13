import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

import 'core/theme_cuida_pet.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.addKey(Modular.navigatorKey),
      title: 'Flutter Slidy',
      theme: ThemeCuidapet.theme(),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      navigatorObservers: [GetObserver()],
    );
  }
}
