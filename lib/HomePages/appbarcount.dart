import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

class appbarcount extends StatelessWidget {
  const appbarcount({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current time in Shamsi (Persian) calendar
    Jalali shamsiNow = Jalali.fromDateTime(DateTime.now());

    // Get Shamsi weekday name
    String shamsiWeekday = getShamsiWeekdayName(shamsiNow.weekDay);
    return Container(
      width: double.infinity,
      height: 158.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0)),
        color: Color.fromARGB(31, 28, 78, 204),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Container(
                width: 78,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 113, 129, 220),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text('دستگاه'), Icon(Icons.arrow_drop_down_sharp)],
                ),
              ),
            ),
            Container(
                width: 110.0,
                height: 110.0,
                child: Column(
                  children: [
                    Text(' $shamsiWeekday',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(
                      '${shamsiNow.hour}:${shamsiNow.minute}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        '${shamsiNow.year}/${shamsiNow.month}/${shamsiNow.day}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Container(
                width: 78,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 113, 129, 220),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text('کاربر'), Icon(Icons.arrow_drop_down_sharp)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
}
