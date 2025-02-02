import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // iOS Initialization Settings
    const DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      // onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {
      //   print('Received iOS local notification: $title');
      // },
    );

    // Android Initialization Settings
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/launcher_icon');


    // Combine both Android and iOS settings
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    // Initialize the plugin for both platforms
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          if (response.actionId == 'accept') {
            _handleAcceptAction(response.payload);
          } else if (response.actionId == 'cancel') {
            _handleCancelAction(response.payload);
          }
        }
      },
    );
  }

  Future<void> showNotificationWithActions({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'id759',
      'id759',
      importance: Importance.max,
      priority: Priority.high,

      actions: [
        AndroidNotificationAction('accept', 'Accept'), // Match action ID with backend
        AndroidNotificationAction('cancel', 'Cancel'), // Match action ID with backend
      ],
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  void _handleAcceptAction(String? payload) {
    log("User clicked Accept. Payload: $payload");
    // Implement your action logic here

  }

  void _handleCancelAction(String? payload) {
    log("User clicked Cancel. Payload: $payload");
    // Implement your action logic here
  }
}




