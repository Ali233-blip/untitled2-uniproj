import 'package:flutter/material.dart';
// import 'package:flutter_sms/flutter_sms.dart';

class gozareshPage extends StatelessWidget {
  gozareshPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Image(image: AssetImage('assets/we1.png')),
                ElevatedButton(
                  onPressed: () {
                    print("krbnrsfwefnwef");
                  },
                  child: Icon(Icons.refresh),
                )
              ],
            ),
          ),
        ],
      ),
    );
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
}
