// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class fistPage extends StatefulWidget {
//   const fistPage({super.key, devphn, username, devname, userphn});
//   @override
//   State<fistPage> createState() => fistPageState();
// }

// class fistPageState extends State<fistPage> {
//   String info = 'Info';
//   TextEditingController userphn = TextEditingController();
//   TextEditingController devphn = TextEditingController();
//   TextEditingController passvorod = TextEditingController();
//   TextEditingController username = TextEditingController();
//   TextEditingController devname = TextEditingController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Padding(
//           padding: EdgeInsets.only(top: 16),
//           child: Text("اطلاعات کاربر و دستگاه",
//               style: TextStyle(
//                   color: Color.fromARGB(252, 10, 10, 10),
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold)),
//         ),
//         centerTitle: true,
//         backgroundColor: Color.fromARGB(29, 30, 32, 255),
//         toolbarHeight: 76,
//         elevation: 5,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//             color: Color.fromARGB(29, 30, 32, 255),
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//               child: SafeArea(
//                   child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   SizedBox(
//                     height: 8.0,
//                     width: 390.0,
//                   ),
//                   Text(
//                     ":نام کاربر",
//                     style: TextStyle(
//                       color: Color.fromARGB(253, 10, 10, 10),
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextField(
//                       keyboardType: TextInputType.text,
//                       controller: username,
//                       decoration: InputDecoration(
//                         hintText: 'نام خود را وارد کنید ',
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 171, 74, 195))),
//                         border: OutlineInputBorder(borderSide: BorderSide()),
//                       )),
//                   SizedBox(
//                     height: 30.0,
//                   ),
//                   Text(
//                     ':نام دستگاه',
//                     style: TextStyle(
//                       color: Color.fromARGB(253, 10, 10, 10),
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextField(
//                       keyboardType: TextInputType.text,
//                       controller: devname,
//                       decoration: InputDecoration(
//                         labelText: 'نام دستگاه',
//                         labelStyle:
//                             TextStyle(color: Color.fromARGB(255, 83, 105, 35)),
//                         hintText: 'نام دستگاه هشدار برق را وارد کنید ',
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 171, 74, 195))),
//                         border: OutlineInputBorder(borderSide: BorderSide()),
//                       )),
//                   SizedBox(
//                     height: 30.0,
//                   ),
//                   Text(
//                     ':شماره همراه',
//                     style: TextStyle(
//                       color: Color.fromARGB(253, 10, 10, 10),
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextField(
//                       keyboardType: TextInputType.number,
//                       controller: userphn,
//                       decoration: InputDecoration(
//                         labelStyle:
//                             TextStyle(color: Color.fromARGB(255, 83, 105, 35)),
//                         hintText: 'شماره خود را وارد کنید ',
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 171, 74, 195))),
//                         border: OutlineInputBorder(borderSide: BorderSide()),
//                       )),
//                   SizedBox(
//                     height: 30.0,
//                   ),
//                   Text(
//                     ':رمز ورود ',
//                     style: TextStyle(
//                       color: Color.fromARGB(253, 10, 10, 10),
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextField(
//                       keyboardType: TextInputType.number,
//                       controller: passvorod,
//                       decoration: InputDecoration(
//                         labelText: 'رمز ورود ',
//                         labelStyle:
//                             TextStyle(color: Color.fromARGB(255, 83, 105, 35)),
//                         hintText: 'رمز خود را وارد کنید ',
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 171, 74, 195))),
//                         border: OutlineInputBorder(borderSide: BorderSide()),
//                       )),
//                   SizedBox(
//                     height: 30.0,
//                   ),
//                   Text(
//                     ' :شماره دستگاه',
//                     style: TextStyle(
//                       color: Color.fromARGB(253, 10, 10, 10),
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextField(
//                       keyboardType: TextInputType.number,
//                       controller: devphn,
//                       decoration: InputDecoration(
//                         labelText: 'شماره سیم کارت دستگاه را وارد کنید ',
//                         labelStyle:
//                             TextStyle(color: Color.fromARGB(255, 83, 105, 35)),
//                         hintText: '0913*******',
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 171, 74, 195))),
//                         border: OutlineInputBorder(borderSide: BorderSide()),
//                       )),
//                   SizedBox(
//                     height: 9,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       ElevatedButton(
//                           onPressed: saveData,
//                           child: Text("ثبت"),
//                           style: ElevatedButton.styleFrom(
//                             foregroundColor: Colors.green,
//                             backgroundColor: Colors.indigo,
//                             textStyle: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontStyle: FontStyle.normal),
//                             minimumSize: Size(double.infinity, 60),
//                           )),
//                       SizedBox(
//                         height: 9,
//                       ),
//                       ElevatedButton(
//                           onPressed: () {
//                             Navigator.pushNamed(context, '/home');
//                           },
//                           child: Text("رد کردن"),
//                           style: ElevatedButton.styleFrom(
//                             foregroundColor: Colors.green,
//                             backgroundColor: Colors.indigo,
//                             textStyle: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontStyle: FontStyle.normal),
//                             minimumSize: Size(double.infinity, 60),
//                           )),
//                     ],
//                   )
//                 ],
//               )),
//             )),
//       ),
//     );
//   }

//   void saveData() async {
//     print('sava data');
//     String UserName = username.text;
//     String DeviceName = devname.text;
//     var UserPhone = int.parse(userphn.text);
//     var DevicePPhone = int.parse(devphn.text);
//     var Passvored = int.parse(passvorod.text);

//     var box = await Hive.openBox(info);
//     box.put('UserName', UserName);
//     box.put('DeviceName', DeviceName);
//     box.put('UserPhone', UserPhone);
//     box.put('DevicePhone', DevicePPhone);
//     box.put('Pasvored', Passvored);
//     box.close();
//     Navigator.pushNamed(context, '/home');
//   }

//   void LoadData() async {
//     print('load data');
//     var box = await Hive.openBox(info);
//     username.text = box.get('UserName');
//     devname.text = box.get('DeviceName');
//     userphn.text = "${box.get('UserPhone')}";
//     devphn.text = "${box.get('DevicePhone')}";
//     passvorod.text = "${box.get('Pasvored')}";

//     setState(() {});
//   }
// }
