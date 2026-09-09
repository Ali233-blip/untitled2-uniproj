import 'package:flutter/material.dart';

class itemhamenu extends StatelessWidget {
  const itemhamenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //1st menu option
        Container(
          child: Row(
            children: [
              GestureDetector(
                child: Icon(Icons.edit),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Counter'),
                        // actions: [
                        //   SingleChildScrollView(
                        //     child: Column(
                        //       children: [
                        //         const SizedBox(
                        //           height: 8,
                        //         ),
                        //         SizedBox(
                        //             width: 210,
                        //             height: 50,
                        //             child: TextField(
                        //               controller: ,
                        //               decoration: const InputDecoration(
                        //                   border: OutlineInputBorder(), labelText: "نام کاربر"),
                        //             )),
                        //         const SizedBox(
                        //           height: 24,
                        //         ),
                        //         SizedBox(
                        //             width: 210,
                        //             height: 50,
                        //             child: TextField(
                        //               keyboardType: TextInputType.number,
                        //               controller: ,
                        //               decoration: const InputDecoration(
                        //                   border: OutlineInputBorder(), labelText: "شماره کاربر"),
                        //             )),
                        //         const SizedBox(
                        //           height: 24,
                        //         ),
                        //         const Divider(
                        //           height: 1,
                        //           thickness: 2,
                        //           color: Colors.black54,
                        //           indent: 16,
                        //           endIndent: 16,
                        //         ),
                        //         const SizedBox(
                        //           height: 15,
                        //         ),
                        //         Row(
                        //           children: [
                        //             Checkbox(
                        //               value: true,
                        //               onChanged: (value) {},
                        //             ),
                        //             const Padding(
                        //               padding: EdgeInsets.only(left: 16),
                        //               child: Text(
                        //                 'امکان تماس هشدار برای کاربر',
                        //                 style: TextStyle(fontSize: 15),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         const SizedBox(
                        //           height: 18,
                        //         ),
                        //         Container(
                        //           color: const Color.fromARGB(29, 30, 32, 255),
                        //           child: const Row(
                        //             children: [],
                        //           ),
                        //         ),
                        //         Row(
                        //           children: [
                        //             ElevatedButton(
                        //               child: const Text('Cancle'),
                        //               onPressed: ,
                        //             ),
                        //             ElevatedButton(
                        //               child: const Text('Save'),
                        //               onPressed: ,
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   )
                        // ],
                      );
                    },
                  );
                },
              )
            ],
          ),
          height: 50,
          color: Colors.yellow.shade400,
        ),
        //2nd menu option
        Container(
          height: 50,
          color: Colors.yellow.shade300,
        ), //3rd menu option
        Container(
          height: 50,
          color: Colors.yellow.shade200,
        )
      ],
    );
  }
}
