import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unk/firebase_options.dart';
import 'package:unk/ukn_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:unk/utils/notification_handler.dart';

Future<void> main() async {
  await defaultInitData();

  var status = await Permission.notification.request();
  if (status.isGranted) {
    runApp(const UknApp());
  } else if (status.isDenied) {
    await Permission.notification.request();
  } else if (status.isPermanentlyDenied) {
    await openAppSettings();
  }
}

Future<void> defaultInitData() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await loadMobileNotification();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
