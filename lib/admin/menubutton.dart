import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:untitled2/admin/itemhamenu.dart';

class popbutton extends StatelessWidget {
  const popbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
          context: context,
          bodyBuilder: (context) => itemhamenu(),
          width: 120,
          height: 150,
          backgroundColor: Colors.yellow.shade400),
      child: Icon(Icons.more_vert),
    );
  }
}
