import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationRepo {
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initNoti() async {
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    // const AndroidInitializationSettings initializationSettingsAndroid =
    //     AndroidInitializationSettings('@mipmap/ic_launcher');
    // final IOSInitializationSettings initializationSettingsIOS =
    //     IOSInitializationSettings(
    //         onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    // final MacOSInitializationSettings initializationSettingsMacOS =
    //     MacOSInitializationSettings();
    // final InitializationSettings initializationSettings =
    //     InitializationSettings(
    //         android: initializationSettingsAndroid,
    //         iOS: initializationSettingsIOS,
    //         macOS: initializationSettingsMacOS);
    // await flutterLocalNotificationsPlugin!.initialize(initializationSettings,
    //     onSelectNotification: selectNotification);

// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin!.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future<void> configureLocalTimeZone() async {
    try {
      tz.initializeTimeZones();
      final String? timeZoneName =
          await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZoneName!));
    } catch (e) {
      print("error: $e");
    }
  }

  showLocalNoti({@required String? message}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            sound: RawResourceAndroidNotificationSound('slow_spring_board'),
            playSound: true,
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin!.show(
        0, 'test App', message, platformChannelSpecifics,
        payload: 'item x');
  }

  void onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
  }

  void selectNotification(String? payload) async {
    if (payload != null) {
      // debugPrint('notification payload: $payload');
    }
  }

// daily notification at 10 AM
  Future<void> scheduleDailyTenAMNotification() async {
    await flutterLocalNotificationsPlugin!.zonedSchedule(
        0,
        '10 AM ',
        'fired at 10 PM',
        _nextInstanceOfTenAM(),
        const NotificationDetails(
          android: AndroidNotificationDetails('daily 111', 'daily 11',
              sound: RawResourceAndroidNotificationSound('slow_spring_board'),
              playSound: true,
              channelDescription: 'daily  1'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime);
  }

// daily time zone
  tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  // 1 pm

  // daily notification at 10 AM
  Future<void> scheduleDailyT1PMNotification() async {
    await flutterLocalNotificationsPlugin!.zonedSchedule(
        0,
        '1 PM ',
        'fired at 1 pm',
        _nextInstanceOf1Pm(),
        const NotificationDetails(
          android: AndroidNotificationDetails('daily 444', 'daily 44',
              sound: RawResourceAndroidNotificationSound('slow_spring_board'),
              playSound: true,
              channelDescription: 'daily  4'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime);
  }

// daily time zone
  tz.TZDateTime _nextInstanceOf1Pm() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 13);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  // 1 pm

  // daily notification at 10 AM
  Future<void> scheduleDailyT3PMNotification() async {
    await flutterLocalNotificationsPlugin!.zonedSchedule(
        0,
        '3 PM ',
        'fired at 3 pm',
        _nextInstanceOf3Pm(),
        const NotificationDetails(
          android: AndroidNotificationDetails('daily 222', 'daily 22',
              sound: RawResourceAndroidNotificationSound('slow_spring_board'),
              playSound: true,
              channelDescription: 'daily  2'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime);
  }

// daily time zone
  tz.TZDateTime _nextInstanceOf3Pm() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 15);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
