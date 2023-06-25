import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(){
    _notificationsPlugin.
    resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.
    requestPermission();

    final InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings("(@mipmap/ic_launcher)"),
      iOS: DarwinInitializationSettings(),
    );
    _notificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }
  static onDidReceiveNotificationResponse (NotificationResponse? response){}
  static Future<void> displayText({required String title, required String body}) async{
    final id = DateTime.now().millisecondsSinceEpoch ~/1000;
    final NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        "MyApp",
        "My App Channel",
        channelDescription: "Channel Des",
        priority: Priority.high,
        importance: Importance.high
      ),
    );
    _notificationsPlugin.show(id, title, body, notificationDetails);
  }
}