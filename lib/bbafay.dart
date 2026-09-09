import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:untitled2/HomePages/mycount.dart';
import 'package:untitled2/Homepages/mycount2.dart';
import 'package:untitled2/Homepages/appbarcount.dart';
import 'package:untitled2/HomePages/mycount3.dart';
import 'package:untitled2/Homepages/info.dart';
import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:readsms/readsms.dart';
import 'package:untitled2/nonotif.dart';
import 'package:readsms/readsms.dart';
import 'dart:async';

class baradre extends StatefulWidget {
  const baradre({super.key});

  @override
  State<baradre> createState() => _baradreState();
}

class _baradreState extends State<baradre> {
  String zxcvb = "mnk";
  bool vopnd = true;
  final plugin = Readsms();
  String sms = 'no sms received';
  String sender = 'no sms received';
  String time = 'no sms received';
  Timer? _timer;

  _getPermission() async => await [
        Permission.sms,
      ].request();
  Future<bool> _isPermissionGranted() async =>
      await Permission.sms.status.isGranted;

  _sendMessage(String phoneNumber, String message, {int? simSlot}) async {
    var result = await BackgroundSms.sendMessage(
        phoneNumber: phoneNumber, message: message, simSlot: simSlot);
    if (result == SmsStatus.sent) {
      print("Sent");
    } else {
      print("Failed");
    }
  }

  Future<bool?> get _supportCustomSim async =>
      await BackgroundSms.isSupportCustomSim;
  // fdcs() {
  //   setState(() {
  //     if (zxcvb == "mnk") {
  //       vopnd = true;
  //     } else {
  //       vopnd = false; // Change this line
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    getPermission().then((value) {
      if (value) {
        plugin.read();
        plugin.smsStream.listen((event) {
          setState(() {
            sms = event.body;
            sender = event.sender;
            time = event.timeReceived.toString();
          });
        });
      }
    });
    // fdcs();
    if (vopnd == true) {
      notif();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => hbk());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    // plugin.dispose();
  }

  notif() {
    setState(() {
      if (vopnd == true) {
        LocalNotifications.showSimpleNotification(
            title: 'sfv', body: 'fs', payload: 'hhhh');
      }
    });
  }

  Future<bool> getPermission() async {
    if (await Permission.sms.status == PermissionStatus.granted) {
      return true;
    } else {
      if (await Permission.sms.request() == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  void hbk() {
    setState(() {
      if (sender == "+989160950373" && sms == "mnk") {
        vopnd = true;
      } else {
        vopnd = false;
      }
    });
  }
  // @override
  // void initState() {
  //   // void midcount() {
  //   //   if (kinfo == false) {
  //   //     mycount();
  //   //   } else {
  //   //     mycount2();
  //   //   }
  //   // }

  //   super.initState();
  // }

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

// Future<void> _sendSms() async {
//   await _requestSmsPermission(); // Request permission on Android

//   final SmsAdvanced smsAdvanced = SmsAdvanced();

//   // Replace with recipient phone number and message content
  // final recipients = ['+1234567890']; // Replace with actual phone number(s)
  // final message = 'This is a test message.';

//   try {
//     await smsAdvanced.sendSms(recipients: recipients, message: message);
//     print('SMS sent successfully!');
//   } catch (error) {
//     print('Error sending SMS: $error');
//   }
// }

  @override
  Widget build(BuildContext context) {
    // Get current time in Shamsi (Persian) calendar
    Jalali shamsiNow = Jalali.fromDateTime(DateTime.now());
    // Get Shamsi weekday name

    // ignore: unused_local_variable
    String shamsiWeekday = getShamsiWeekdayName(shamsiNow.weekDay);
    return Scaffold(
      body: ListView(
        children: [
          appbarcount(),
          // ignore: dead_code
          vopnd ? mycount() : mycount2(),
          Container(
            child: Container(
              height: 55.0,
              width: 300,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(31, 28, 78, 204),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0))),
              child: Column(
                children: [
                  Divider(
                    height: 1,
                    thickness: 2,
                    color: Colors.black54,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child:
                            // GestureDetector(
                            //   onTap: () async {
                            //     if (await _isPermissionGranted()) {
                            //       if ((await _supportCustomSim)!)
                            //         _sendMessage("09160950373", "Hello",
                            //             simSlot: 1);
                            //       else {
                            //         _sendMessage("09160950373", "Hello");
                            //       }
                            //     } else {
                            //       _getPermission();
                            //     }
                            //   },
                            //   child: Icon(
                            //     Icons.refresh,
                            //     size: 37,
                            //   ),
                            // ),
                            IconButton(
                          onPressed: () async {
                            if (await _isPermissionGranted()) {
                              if ((await _supportCustomSim)!)
                                _sendMessage("09160950373", "Hello",
                                    simSlot: 1);
                              else {
                                _sendMessage("09160950373", "Hello");
                              }
                            } else {
                              _getPermission();
                            }
                          },
                          icon: Icon(
                            Icons.refresh,
                            size: 37,
                          ),
                        ),
                      ),

                      ElevatedButton(onPressed: () {}, child: Text('f')),
                      // GestureDetector(
                      //   child: Icon(
                      //     Icons.ac_unit,
                      //   ),
                      //   onTap: fdcs(vopnd),
                      // ),
                      SizedBox(
                        width: 150,
                      ),
                      Text(
                        sms,
                        style: TextStyle(fontSize: 9),
                      ),
                      Text(
                        sender,
                        style: TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          mycountain3(),
        ],
      ),
    );
    // Scaffold(
    //   body: SingleChildScrollView(
    //     child: Container(
    //       child: Column(
    //         children: [
    //           Container(
    //             width: double.infinity,
    //             height: 158.0,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.only(
    //                   bottomRight: Radius.circular(16.0),
    //                   bottomLeft: Radius.circular(16.0)),
    //               color: Color.fromARGB(31, 28, 78, 204),
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.only(top: 34.0),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(left: 6.0),
    //                     child: Container(
    //                       width: 78,
    //                       height: 32,
    //                       decoration: BoxDecoration(
    //                         color: const Color.fromARGB(255, 113, 129, 220),
    //                         borderRadius: BorderRadius.circular(10),
    //                       ),
    //                       child: const Row(
    //                         mainAxisAlignment: MainAxisAlignment.end,
    //                         children: [
    //                           Text('دستگاه'),
    //                           Icon(Icons.arrow_drop_down_sharp)
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                   Container(
    //                       width: 110.0,
    //                       height: 110.0,
    //                       child: Column(
    //                         children: [
    //                           Text(' $shamsiWeekday',
    //                               style: const TextStyle(
    //                                   fontSize: 20,
    //                                   fontWeight: FontWeight.bold)),
    //                           Text(
    //                             '${shamsiNow.hour}:${shamsiNow.minute}',
    //                             style: const TextStyle(
    //                                 fontSize: 20, fontWeight: FontWeight.bold),
    //                           ),
    //                           Text(
    //                               '${shamsiNow.year}/${shamsiNow.month}/${shamsiNow.day}',
    //                               style: const TextStyle(
    //                                   fontSize: 20,
    //                                   fontWeight: FontWeight.bold)),
    //                         ],
    //                       )),
    //                   Padding(
    //                     padding: const EdgeInsets.only(right: 6.0),
    //                     child: Container(
    //                       width: 78,
    //                       height: 32,
    //                       decoration: BoxDecoration(
    //                         color: const Color.fromARGB(255, 113, 129, 220),
    //                         borderRadius: BorderRadius.circular(10),
    //                       ),
    //                       child: const Row(
    //                         mainAxisAlignment: MainAxisAlignment.end,
    //                         children: [
    //                           Text('کاربر'),
    //                           Icon(Icons.arrow_drop_down_sharp)
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 30.0,
    //           ),
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               // ListView(
    //               //   children: [mycount()],
    //               // ),
    //               Container(
    //                 child: Column(
    //                   children: [
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.end,
    //                       children: [
    //                         Padding(
    //                           padding: EdgeInsets.only(
    //                             right: 33,
    //                           ),
    //                           child: Icon(
    //                             Icons.refresh,
    //                             size: 37,
    //                           ),
    //                         )
    //                       ],
    //                     ),

    //                     // quarterTurns: 90,

    //                     Padding(
    //                       padding: const EdgeInsets.only(left: 40, top: 30),
    //                       child: Transform.rotate(
    //                         angle: 300 * math.pi / 180,
    //                         child: Image(
    //                           image: AssetImage('assets/we1.png'),
    //                           width: 300,
    //                           height: 139,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 width: double.infinity,
    //                 height: 290,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(16.0),
    //                     color: Color.fromARGB(31, 28, 78, 204)),
    //               ),
    //               const SizedBox(
    //                 height: 30.0,
    //               ),
    //               Container(
    //                 child: Column(
    //                   children: [
    //                     const SizedBox(
    //                       height: 14,
    //                     ),
    //                     Row(
    //                       mainAxisAlignment:
    //                           MainAxisAlignment.spaceEvenly, // <-- SEE HERE
    //                       children: [
    //                         Column(
    //                           children: [
    //                             ElevatedButton(
    //                               onPressed: () {},
    //                               child: Icon(
    //                                 //<-- SEE HERE
    //                                 Icons.train,
    //                                 color: Colors.black,
    //                                 size: 54,
    //                               ),
    //                               style: ElevatedButton.styleFrom(
    //                                 shape: CircleBorder(), //<-- SEE HERE
    //                                 padding: EdgeInsets.all(20),
    //                               ),
    //                             ),
    //                             const Text(
    //                               'khk',
    //                               style: TextStyle(
    //                                 color: Color.fromARGB(253, 10, 10, 10),
    //                                 fontSize: 18,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             )
    //                           ],
    //                         ),
    //                         Column(
    //                           children: [
    //                             ElevatedButton(
    //                               onPressed: () {},
    //                               child: Icon(
    //                                 //<-- SEE HERE
    //                                 Icons.train,
    //                                 color: Colors.black,
    //                                 size: 54,
    //                               ),
    //                               style: ElevatedButton.styleFrom(
    //                                 shape: CircleBorder(), //<-- SEE HERE
    //                                 padding: EdgeInsets.all(20),
    //                               ),
    //                             ),
    //                             const Text(
    //                               'khk',
    //                               style: TextStyle(
    //                                 color: Color.fromARGB(253, 10, 10, 10),
    //                                 fontSize: 18,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             )
    //                           ],
    //                         ),
    //                         Column(
    //                           children: [
    //                             ElevatedButton(
    //                               onPressed: () {
    //                                 Navigator.pushNamed(context, '/rahnema');
    //                               },
    //                               child: Icon(
    //                                 //<-- SEE HERE
    //                                 Icons.info,
    //                                 color: Colors.black,
    //                                 size: 54,
    //                               ),
    //                               style: ElevatedButton.styleFrom(
    //                                 shape: CircleBorder(), //<-- SEE HERE
    //                                 padding: EdgeInsets.all(20),
    //                               ),
    //                             ),
    //                             const Text(
    //                               'راهنما',
    //                               style: TextStyle(
    //                                 color: Color.fromARGB(253, 10, 10, 10),
    //                                 fontSize: 18,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             )
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                     const SizedBox(
    //                       height: 20,
    //                     ),
    //                     Row(
    //                       mainAxisAlignment:
    //                           MainAxisAlignment.spaceEvenly, // <-- SEE HERE
    //                       children: [
    //                         Column(
    //                           children: [
    //                             ElevatedButton(
    //                               onPressed: () {
    //                                 Navigator.pushNamed(context, '/tanzimat');
    //                               },
    //                               child: Icon(
    //                                 //<-- SEE HERE
    //                                 Icons.settings,
    //                                 color: Colors.black,
    //                                 size: 54,
    //                               ),
    //                               style: ElevatedButton.styleFrom(
    //                                 shape: CircleBorder(), //<-- SEE HERE
    //                                 padding: EdgeInsets.all(20),
    //                               ),
    //                             ),
    //                             const Text(
    //                               'تنظیمات',
    //                               style: TextStyle(
    //                                 color: Color.fromARGB(253, 10, 10, 10),
    //                                 fontSize: 18,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             )
    //                           ],
    //                         ),
    //                         Column(
    //                           children: [
    //                             ElevatedButton(
    //                               onPressed: () {
    //                                 Navigator.pushNamed(context, '/adminha');
    //                               },
    //                               child: Icon(
    //                                 //<-- SEE HERE
    //                                 Icons.people_alt_rounded,
    //                                 color: Colors.black,
    //                                 size: 54,
    //                               ),
    //                               style: ElevatedButton.styleFrom(
    //                                 shape: CircleBorder(), //<-- SEE HERE
    //                                 padding: EdgeInsets.all(20),
    //                               ),
    //                             ),
    //                             const Text(
    //                               'ادمین ها',
    //                               style: TextStyle(
    //                                 color: Color.fromARGB(253, 10, 10, 10),
    //                                 fontSize: 18,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             )
    //                           ],
    //                         ),
    //                         Column(
    //                           children: [
    //                             ElevatedButton(
    //                               onPressed: () {
    //                                 Navigator.pushNamed(context, '/gozaresh');
    //                               },
    //                               child: Icon(
    //                                 //<-- SEE HERE
    //                                 Icons.file_copy_rounded,
    //                                 color: Colors.black,
    //                                 size: 54,
    //                               ),
    //                               style: ElevatedButton.styleFrom(
    //                                 shape: CircleBorder(), //<-- SEE HERE
    //                                 padding: EdgeInsets.all(20),
    //                               ),
    //                             ),
    //                             Text(
    //                               'گزارشات',
    //                               style: TextStyle(
    //                                 color: Color.fromARGB(253, 10, 10, 10),
    //                                 fontSize: 18,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             )
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 width: double.infinity,
    //                 height: 290,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(16.0),
    //                     color: Color.fromARGB(31, 28, 78, 204)),
    //               )
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  // Function to get Shamsi weekday name from its index
  String getShamsiWeekdayName(int weekdayIndex) {
    switch (weekdayIndex) {
      case 1:
        return 'شنبه';
      case 2:
        return 'یک‌شنبه';
      case 3:
        return 'دوشنبه';
      case 4:
        return 'سه‌شنبه';
      case 5:
        return 'چهارشنبه';
      case 6:
        return 'پنج‌شنبه';
      case 7:
        return 'جمعه';
      default:
        return '';
    }
  }

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

// Uri smsUri = Uri(
//   scheme: 'sms',
//   path: "0999999999", // Optional: Phone number of the recipient
//   queryParameters: {'body': "message"}, // Message body
// );

//oiuytrfdcvbnj987tfvbnko
// void sendSMSInBackground(String message, List<String> recipients) async {
//   String result = await sendSMS(message: message, recipients: recipients)
//       .catchError((onError) {
//     print("Error sending SMS: $onError");
//   });
//   print("SMS sent: $result");
// }

////;lkjhgvb nm,lp0987ytgbnm,
// Example usage:
// String message = "Hello from Flutter!";
// List<String> recipients = ["1234567890", "5556787676"];
// sendSMSInBackground(message, recipients);
}
