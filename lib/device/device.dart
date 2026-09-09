import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class myDevice extends StatelessWidget {
  final String deviceName;
  final int deviceNumber;
  Function(BuildContext?)? deletedevice;
  myDevice(
      {required this.deviceName,
        required this.deviceNumber,
        required this.deletedevice,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23, right: 23, top: 13),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deletedevice,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          height: 135,
          padding: const EdgeInsets.only(
            top: 5,
            left: 6,
            right: 8,
          ),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(onTap: () {}, child: Icon(Icons.more_vert)),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 53,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller:
                            TextEditingController(text: "${deviceNumber}"),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5, left: 55),
                        child: Text(
                          "${deviceName}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
