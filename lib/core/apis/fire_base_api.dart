import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handelBackgroundNotification(RemoteMessage message) async {
  print('Handling background notification with ID: ${message.messageId}');

  if (message.notification != null) {

    if (message.data.isNotEmpty) {
    }
  }
}
class FireBaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> _setupLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _localNotifications.initialize(initializationSettings);
  }

  void handelMessage(RemoteMessage? remoteMessage) {
    if (remoteMessage == null) {
      return;
    } else {
      if (remoteMessage.notification != null) {
        _showNotification(remoteMessage);
      }
    }
  }

  Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'high_importance_channel', // ID
      'High Importance Notifications', // Name
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await _localNotifications.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: message.data['payload'], // Optional payload
    );
  }

  Future<void> initPushNotification() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        _showNotification(message); // Show the notification manually
      }
    });

    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        print('Initial message: ${message.messageId}');
        handelMessage(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      handelMessage(message);
    });
    FirebaseMessaging.onBackgroundMessage(handelBackgroundNotification);
  }



  Future<void> initNotifications() async {
    await _setupLocalNotifications();
    NotificationSettings setting = await _firebaseMessaging.requestPermission();
    if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      var token = await _firebaseMessaging.getToken();
      initPushNotification();
    }
  }
}
