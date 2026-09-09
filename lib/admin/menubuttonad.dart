import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:untitled2/admin/itemhamenuad.dart';

class popbuttonad extends StatelessWidget {
  const popbuttonad({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
          context: context,
          bodyBuilder: (context) => Itemhamenuad(),
          width: 120,
          height: 150,
          backgroundColor: Colors.blue.shade400),
      child: Icon(Icons.more_vert),
    );
  }
}
