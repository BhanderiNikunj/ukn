import 'dart:async';
import 'dart:developer';
import 'package:flutter_ukn_earning_app/exports.dart';

Future<void> main() async {
  await defaultInitData();
  await mainFunction();
}

Future<void> defaultInitData() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await loadMobileNotification();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  log("=========${await GetAccessToken.getAccessToken()}");
}

Future<void> mainFunction() async {
  var status = await Permission.notification.request();
  if (status.isGranted) {
    runApp(const UknApp());
  } else if (status.isDenied) {
    await Permission.notification.request();
  } else if (status.isPermanentlyDenied) {
    await openAppSettings();
  }
}
