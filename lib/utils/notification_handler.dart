import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:unk/common/colors.dart';

Future<void> loadMobileNotification() async {
  await LocalNotificationService.initialize();

  debugPrint("============${await FirebaseMessaging.instance.getToken()}");

  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) async {
      await LocalNotificationService.display(message);

      debugPrint('Handling a foreground message: ${message.messageId}');
      debugPrint('Message data: ${message.data}');
      debugPrint('Message notification: ${message.notification?.title}');
      debugPrint('Message notification: ${message.notification?.body}');
    },
  );
}

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
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
    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.input != null) {}
      },
    );
  }

  static Future<void> display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          color: AppColor.primary1Color,
          colorized: true,
          message.notification?.android?.sound ?? "Channel Id",
          message.notification?.android?.sound ?? "Main Channel",
          groupKey: message.senderId,
          importance: Importance.max,
          playSound: true,
          icon: "@mipmap/ic_launcher",
          priority: Priority.high,
          fullScreenIntent: true,
          channelShowBadge: true,
        ),
      );
      await _notificationsPlugin.show(
        id,
        message.notification?.title,
        message.notification?.body,
        notificationDetails,
        payload: message.data['route'],
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

Future<void> backgroundHandler(RemoteMessage msg) async {
  await LocalNotificationService.display(msg);
}
