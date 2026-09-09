import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled2/Baratest.dart';
import 'package:untitled2/admin/Adminha.dart';
import 'package:untitled2/Gozareshat.dart';
import 'package:untitled2/Homepages/Home.dart';
import 'package:untitled2/Rahnema.dart';
import 'package:hive/hive.dart';
import 'package:untitled2/device/setting.dart';
import 'package:untitled2/bbafay.dart';
import 'package:untitled2/device/gglno.dart';
import 'package:untitled2/nonotif.dart';
import 'package:untitled2/notif.dart';
import 'package:untitled2/Baratest.dart';

// import 'package:untitled2/lock.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter_sms/flutter_sms.dart';
// import 'package:flutter_sms_listener/flutter_sms_listener.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  // ignore: unused_local_variable
  var userBox = await Hive.openBox('myuserbox');
  // ignore: unused_local_variable
  var adminBox = await Hive.openBox('myadminbox');
  //
  // ignore: unused_local_variable
  var deviceBox = await Hive.openBox('mydevicebox');

  var lastbox = await Hive.openBox('MyLastbox');

  // Future<void> _requestSmsPermission() async {
  //   final status = await Permission.sms.request();
  //   if (status.isGranted) {
  //     // Permission granted, proceed with sending SMS
  //   } else if (status.isPermanentlyDenied) {
  //     // Handle permanently denied permission (optional)
  //   } else {
  //     // Handle other permission statuses (optional)
  //   }
  // }

  // Uri smsUri = Uri(
  //   scheme: 'sms',
  //   path: "+989136885240", // Optional: Phone number of the recipient
  //   queryParameters: {'body': "message"}, // Message body
  // );
  // void sendSMS(String phoneNumber, String message) async {
  //   final Uri smsUri = Uri(
  //     scheme: 'sms',
  //     path: phoneNumber,
  //     queryParameters: {'body': message},
  //   );

  //   if (await canLaunchUrl(smsUri)) {
  //     await launchUrl(smsUri);
  //   } else {
  //     // Handle cases where the messaging app is not available
  //     print('Failed to launch SMS app');
  //   }
  // }

  // Future<bool> requestSmsPermission() async {
  //   final status = await Permission.sms.request();
  //   if (status.isGranted) {
  //     return true;
  //   } else if (status.isPermanentlyDenied) {
  //     // Handle permanently denied permission (optional)
  //     await openAppSettings(); // Open app settings for user to grant permission
  //     return false;
  //   } else {
  //     // Handle other permission statuses (optional)
  //     return false;
  //   }
  // }

  //gmk
  // Future<bool> _requestSmsPermission() async {
  //   final status = await Permission.sms.request();
  //   if (status.isGranted) {
  //     return true;
  //   } else if (status.isPermanentlyDenied) {
  //     // Handle permanently denied permission (optional)
  //     await openAppSettings(); // Open app settings for user to grant permission
  //     return false;
  //   } else {
  //     // Handle other permission statuses (optional)
  //     return false;
  //   }
  // }

  // // SmsStatus result = await BackgroundSms.sendMessage(
  //     phoneNumber: "09xxxxxxxxx", message: "Message");
  // if (result == SmsStatus.sent) {
  //   print("Sent");
  // } else {
  //   print("Failed");
  // }
  //  FlutterSmsListener smsListtener = FlutterSmsListener();

  //   smsListtener.onSmsReceived!((SmsMessage) {
  //       message
  //   });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const baradre(),
      routes: {
        '/home': (context) => homePage(),
        '/gozaresh': (context) => gozareshPage(),
        '/adminha': (context) => Adminha(),
        '/tanzimat': (context) => ffls(),
        '/rahnema': (context) => Rahnema(),
      },
    );
  }

// void sendSMSInBackground(String message, List<String> recipients) async {
//   String result = await sendSMS(message: message, recipients: recipients)
//       .catchError((onError) {
//     print("Error sending SMS: $onError");
//   });
//   print("SMS sent: $result");
// }
}







//  Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 40, left: 70, top: 70),
//             child: Container(
//               height: 190.0,
//               width: 300,
//               decoration: BoxDecoration(
//                   color: Colors.purpleAccent,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(16.0),
//                       topRight: Radius.circular(16.0))),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               right: 40,
//               left: 70,
//             ),
//             child: Container(
//               height: 50.0,
//               width: 300,
//               decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 64, 95, 251),
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(16.0),
//                       bottomRight: Radius.circular(16.0))),
//             ),
//           ),
//         ],
//       ),