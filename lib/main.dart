import 'dart:developer';
import 'package:unk/exports.dart';

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
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  log("=========${await GetAccessToken.getAccessToken()}");
}
