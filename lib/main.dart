import 'package:flutter/material.dart';
import 'package:periodicnotificationdaily/local_notification_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocalNotificationRepo notificationRepo = LocalNotificationRepo();

  @override
  void initState() {
    super.initState();
    notificationRepo.configureLocalTimeZone().then((value) {
      notificationRepo.initNoti();
      notificationRepo.scheduleDailyTenAMNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Daily periodic notification at 10:00 AM"),
      ),
    );
  }
}
