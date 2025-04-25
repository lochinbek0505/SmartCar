import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInit,
    );

    await _notificationsPlugin.initialize(initSettings);
  }

  static Future<void> showSimpleNotification(String text) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'simple_channel_id',
          'Simple Notifications',
          channelDescription: 'Shows simple notifications',
          importance: Importance.max,
          priority: Priority.high,
          icon: 'ic_launcher', // Bu yerda PNG fayl nomi, kengaytmasiz
        );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _notificationsPlugin.show(
      0, // notification ID
      'Eslatma', // title
      text, // body (sizga berilgan matn)
      platformDetails,
    );
  }
}
