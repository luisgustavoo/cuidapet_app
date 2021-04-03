import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/core/push_notification/push_message_configure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await loadEnv();
  await PushMessageConfigure().configure();
  runApp(ModularApp(module: AppModule()));
}

Future<void> loadEnv() async {
  const isProduction = bool.fromEnvironment('dart.vm.product');
  await DotEnv().load(isProduction ? '.env' : '.env_dev');
}
