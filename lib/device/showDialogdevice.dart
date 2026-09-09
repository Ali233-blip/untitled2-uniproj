import 'package:flutter/material.dart';

// ignore: must_be_immutable
class deviceDialog extends StatelessWidget {
  final namedastgah;
  final shomaredastgah;
  VoidCallback barasave;
  VoidCallback baracancle;
  deviceDialog(
      {required this.namedastgah,
        required this.shomaredastgah,
        required this.baracancle,
        required this.barasave,
        super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Counter'),
      actions: [
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                  width: 210,
                  height: 50,
                  child: TextField(
                    controller: namedastgah,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "نام دستگاه"),
                  )),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                  width: 210,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: shomaredastgah,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "شماره دستگاه"),
                  )),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: const Color.fromARGB(29, 30, 32, 255),
                child: const Row(
                  children: [],
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    child: Text('Cancle'),
                    onPressed: baracancle,
                  ),
                  ElevatedButton(
                    child: Text('Save'),
                    onPressed: barasave,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
