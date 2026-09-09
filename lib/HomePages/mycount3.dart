import 'package:flutter/material.dart';
import 'package:untitled2/nonotif.dart';
import 'package:untitled2/notif.dart';

class mycountain3 extends StatelessWidget {
  const mycountain3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // <-- SEE HERE
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        //<-- SEE HERE
                        Icons.train,
                        color: Colors.black,
                        size: 54,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), //<-- SEE HERE
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                    const Text(
                      'khk',
                      style: TextStyle(
                        color: Color.fromARGB(253, 10, 10, 10),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        LocalNotifications.showSimpleNotification(
                            title: 'sfv', body: 'fs', payload: 'hhhh');
                      },
                      child: Icon(
                        //<-- SEE HERE
                        Icons.train,
                        color: Colors.black,
                        size: 54,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), //<-- SEE HERE
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                    const Text(
                      'khk',
                      style: TextStyle(
                        color: Color.fromARGB(253, 10, 10, 10),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/rahnema');
                      },
                      child: Icon(
                        //<-- SEE HERE
                        Icons.info,
                        color: Colors.black,
                        size: 54,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), //<-- SEE HERE
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                    const Text(
                      'راهنما',
                      style: TextStyle(
                        color: Color.fromARGB(253, 10, 10, 10),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // <-- SEE HERE
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/tanzimat');
                      },
                      child: Icon(
                        //<-- SEE HERE
                        Icons.settings,
                        color: Colors.black,
                        size: 54,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), //<-- SEE HERE
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                    const Text(
                      'تنظیمات',
                      style: TextStyle(
                        color: Color.fromARGB(253, 10, 10, 10),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/adminha');
                      },
                      child: Icon(
                        //<-- SEE HERE
                        Icons.people_alt_rounded,
                        color: Colors.black,
                        size: 54,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), //<-- SEE HERE
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                    const Text(
                      'ادمین ها',
                      style: TextStyle(
                        color: Color.fromARGB(253, 10, 10, 10),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/gozaresh');
                      },
                      child: Icon(
                        //<-- SEE HERE
                        Icons.file_copy_rounded,
                        color: Colors.black,
                        size: 54,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), //<-- SEE HERE
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                    Text(
                      'گزارشات',
                      style: TextStyle(
                        color: Color.fromARGB(253, 10, 10, 10),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        width: double.infinity,
        height: 290,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Color.fromARGB(31, 28, 78, 204)),
      ),
    );
  }
}
