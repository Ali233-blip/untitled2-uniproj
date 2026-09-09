import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:untitled2/admin/menubuttonad.dart';

// ignore: must_be_immutable
class admanBox extends StatelessWidget {
  final String modirName;
  final int modirNumber;
  final bool tamasModir;
  Function(bool?)? changeshe;
  Function(BuildContext?)? deleteFunction2;
  admanBox(
      {required this.changeshe,
      required this.modirName,
      required this.modirNumber,
      required this.tamasModir,
      required this.deleteFunction2,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23, right: 23, top: 13),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction2,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          height: 173,
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
              Padding(
                  padding: const EdgeInsets.only(top: 3), child: popbuttonad()),
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
                                TextEditingController(text: "$modirNumber"),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5, left: 55),
                        child: Text(
                          modirName,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3),
                child: Divider(
                  height: 1,
                  thickness: 2,
                  color: Colors.black38,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: tamasModir,
                    onChanged: changeshe,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 110),
                    child: Text(
                      'امکان تماس هشدار برای مدیر',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
