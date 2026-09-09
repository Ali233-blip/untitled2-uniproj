// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/rxdart.dart';

// class LocalNotificationService {
//   // LocalNotificationService();

//   final localNotificationService = FlutterLocalNotificationsPlugin();

//   Future<void> intialize() async {
//     AndroidInitializationSettings androidInitializationSettings =
//         const AndroidInitializationSettings('@drawable/ic_stat_account_box');

//     var initializationSettingsIOS = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification:
//           (int id, String? title, String? body, String? payload) async {},
//     );
//     var initializationSettings = InitializationSettings(
//         android: androidInitializationSettings, iOS: initializationSettingsIOS);
//     await localNotificationService.initialize(initializationSettings,
//         onDidReceiveBackgroundNotificationResponse:
//             (NotificationResponse notificationResponse) async {});
//   }

//   notificationDetails() {
//     return const NotificationDetails(
//         android: AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max),
//         iOS: DarwinNotificationDetails());
//   }

//   Future showNotification(
//       {int id = 0, String? title, String? body, String? payload}) async {
//     return localNotificationService.show(
//         id, title, body, await notificationDetails());
//   }
// }
