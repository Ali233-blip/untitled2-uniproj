import 'dart:math' as math;
// import 'package:url_launcher/url_launcher.dart';
import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:readsms/readsms.dart';

class mycount2 extends StatefulWidget {
  mycount2({super.key});

  @override
  State<mycount2> createState() => _mycount2State();
}

class _mycount2State extends State<mycount2> {
  final plugin = Readsms();
  String sms = 'no sms received';
  String sender = 'no sms received';
  String time = 'no sms received';
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

  @override
  void initState() {
    super.initState();
    // getPermission().then((value) {
    //   if (value) {
    //     plugin.read();
    //     plugin.smsStream.listen((event) {
    //       setState(() {
    //         sms = event.body;
    //         sender = event.sender;
    //         time = event.timeReceived.toString();
    //       });
    //     });
    //   }
    // });
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

  @override
  void dispose() {
    super.dispose();
    plugin.dispose();
  }

  Future<bool?> get _supportCustomSim async =>
      await BackgroundSms.isSupportCustomSim;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(
            //         right: 33,
            //       ),
            //       child: Icon(
            //         Icons.refresh,
            //         size: 37,
            //       ),
            //     )
            //   ],
            // ),

            // quarterTurns: 90,

            Padding(
              padding: const EdgeInsets.only(left: 40, top: 60),
              child: Transform.rotate(
                angle: 300 * math.pi / 180,
                child: Image(
                  image: AssetImage('assets/we2.png'),
                  width: 300,
                  height: 139,
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(top: 52),
            //   child: Column(
            //     children: [
            //       Divider(
            //         height: 1,
            //         thickness: 2,
            //         color: Colors.black54,
            //         indent: 10,
            //         endIndent: 10,
            //       ),
            //       Row(
            //         children: [
            //           Align(
            //             alignment: Alignment.topLeft,
            //             child: GestureDetector(
            //               onTap: () async {
            //                 if (await _isPermissionGranted()) {
            //                   if ((await _supportCustomSim)!)
            //                     _sendMessage("09111111111", "Hello",
            //                         simSlot: 1);
            //                   else
            //                     _sendMessage("09111111111", "Hello");
            //                 } else
            //                   _getPermission();
            //               },
            //               child: Icon(
            //                 Icons.refresh,
            //                 size: 37,
            //               ),
            //             ),
            //           ),
            //           SizedBox(
            //             width: 210,
            //           ),
            //           Text('مقدار شارژ سیم کارت دستگاه'),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
        width: double.infinity,
        height: 290,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)),
            color: Color.fromARGB(31, 28, 204, 137)),
      ),
    );
  }
}
