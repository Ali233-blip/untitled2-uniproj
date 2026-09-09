import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:untitled2/admin/menubutton.dart';

// ignore: must_be_immutable
class karbar extends StatelessWidget {
  final bool tamaskarbar;
  final String karbarName;
  final int kabarNumber;
  Function(bool?)? onChanged;
  Function(BuildContext?)? deleteFunction;
  karbar({
    required this.kabarNumber,
    required this.karbarName,
    required this.onChanged,
    required this.tamaskarbar,
    required this.deleteFunction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 23, right: 23),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          height: 178,
          padding: const EdgeInsets.only(
            top: 5,
            left: 6,
            right: 8,
          ),
          decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 3), child: popbutton()),
              // IconButton(onPressed: () {}
              // , icon: Icon(Icons.more_vert)),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 234, 199, 72),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 53,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextField(
                            controller: TextEditingController(
                              text: "$kabarNumber",
                            ),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5, left: 55),
                        child: Text(
                          "$karbarName",
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
                padding: EdgeInsets.only(top: 6),
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
                    value: tamaskarbar,
                    onChanged: onChanged,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 110),
                    child: Text(
                      'امکان تماس هشدار برای کاربر',
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
//  PopupMenuButton(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               elevation: 4,
//               position: PopupMenuPosition.under,
//               itemBuilder: (context) => [
//                 PopupMenuItem(
//                     onTap: () {
//                       deleteFunction;
//                     },
//                     child: Row(
//                       children: [Text('حذف')],
//                     ))
//               ],
//               child: Icon(Icons.more_vert),
//               onSelected: (context) => deleteFunction,
//             ),