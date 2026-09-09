import 'package:flutter/material.dart';

class Itemhamenuad extends StatelessWidget {
  const Itemhamenuad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //1st menu option
        Container(
          child: Row(
            children: [
              GestureDetector(
                child: Text('del'),
              )
            ],
          ),
          height: 50,
          color: Colors.blue.shade400,
        ),
        //2nd menu option
        Container(
          height: 50,
          color: Colors.blue.shade300,
        ), //3rd menu option
        Container(
          height: 50,
          color: Colors.blue.shade200,
        )
      ],
    );
  }
}
