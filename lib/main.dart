import 'package:flutter/material.dart';
import 'package:periodicnotificationdaily/local_notification_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationRepo notificationRepo = LocalNotificationRepo();

  await notificationRepo.configureLocalTimeZone();
  notificationRepo.initNoti();
  notificationRepo.showLocalNoti(message: "app just opened");
  notificationRepo.scheduleDailyTenAMNotification();
  notificationRepo.scheduleDailyT1PMNotification();
  notificationRepo.scheduleDailyT3PMNotification();

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: const Center(
        child: Text(
          "Daily periodic notification at multiple time",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
