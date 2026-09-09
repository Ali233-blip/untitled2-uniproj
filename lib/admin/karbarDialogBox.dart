import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class MyDialog extends StatelessWidget {
  final namekarbar;
  final shomarekarbar;
  VoidCallback forSave;
  VoidCallback forCancle;
  MyDialog(
      {super.key,
        required this.namekarbar,
        required this.shomarekarbar,
        required this.forSave,
        required this.forCancle});

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
                    controller: namekarbar,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "نام کاربر"),
                  )),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                  width: 210,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: shomarekarbar,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "شماره کاربر"),
                  )),
              const SizedBox(
                height: 24,
              ),
              const Divider(
                height: 1,
                thickness: 2,
                color: Colors.black54,
                indent: 16,
                endIndent: 16,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'امکان تماس هشدار برای کاربر',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
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
                    child: const Text('Cancle'),
                    onPressed: forCancle,
                  ),
                  ElevatedButton(
                    child: const Text('Save'),
                    onPressed: forSave,
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
// final namekarbar = TextEditingController();
// final shomarekarbar = TextEditingController();