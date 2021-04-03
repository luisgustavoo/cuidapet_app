import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../repository/shared_prefs_repository.dart';


class PushMessageConfigure {
  final _fcm = FirebaseMessaging();

  Future<void> configure() async {
    if(Platform.isIOS){
      await _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    final deviceId = await _fcm.getToken();
    final prefs = await SharedPrefsRepository.instance;
    await prefs.registerAccessToken(deviceId);
  }

}