import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ukn_earning_app/firebase_options.dart';

Future<void> loadMobileNotification() async {
  await LocalNotificationService.initialize();

  debugPrint("============${await FirebaseMessaging.instance.getToken()}");

  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) async {
      debugPrint('Handling a foreground message: ${message.messageId}');
      debugPrint('Message data: ${message.data}');
      debugPrint('Message notification: ${message.notification?.title}');
      debugPrint('Message notification: ${message.notification?.body}');
      await LocalNotificationService.display(message);
    },
  );
}

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings(
        "@mipmap/ic_launcher",
      ),
      iOS: DarwinInitializationSettings(
        defaultPresentBadge: true,
        defaultPresentSound: true,
      ),
    );
    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.input != null) {}
      },
    );
  }

  static Future<void> display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      // Uint8List imageByte = await loadImage(image: message.data["image"]);
      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          message.notification?.android?.sound ?? "Channel Id",
          message.notification?.android?.sound ?? "Main Channel",
          // largeIcon: ByteArrayAndroidBitmap(imageByte),
          groupKey: message.senderId,
          importance: Importance.max,
          icon: "@mipmap/ic_launcher",
          priority: Priority.high,
          fullScreenIntent: true,
          channelShowBadge: true,
          number: 5,
        ),
      );
      await notificationsPlugin.show(
        id,
        message.data["title"],
        message.data["body"],
        notificationDetails,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // static Future<Uint8List> loadImage({required String image}) async {
  //   var dir = await getTemporaryDirectory();
  //   File imageFile = File('${dir.path}/${image.split('/').last}');
  //   if (await imageFile.exists()) {
  //     return await imageFile.readAsBytes();
  //   }
  //   var res = await get(Uri.parse(image));
  //   imageFile.create(recursive: true);
  //   imageFile.writeAsBytes(res.bodyBytes);
  //   return await imageFile.readAsBytes();
  // }
}

@pragma("vm:entry-point")
Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint('Handling a foreground message: ${message.messageId}');
  debugPrint('Message data: ${message.data}');
  debugPrint('Message notification: ${message.notification?.title}');
  debugPrint('Message notification: ${message.notification?.body}');
  await LocalNotificationService.display(message);
}
