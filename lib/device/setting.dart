import 'package:flutter/material.dart';
import 'package:untitled2/device/showDialogdevice.dart';
import 'package:untitled2/device/device.dart';
import 'package:untitled2/data/userdata.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class Tanzimat extends StatefulWidget {
  Tanzimat({super.key});

  @override
  State<Tanzimat> createState() => _TanzimatState();
}

class _TanzimatState extends State<Tanzimat> {
  final _deviceBox = Hive.box('mydevicebox');
  karbardata kdevice = karbardata();

  @override
  void initState() {
    if (_deviceBox.get("ddevicebox") != null) {
      kdevice.loadkarbarData3();
    } else {
      kdevice.crreatInitialData3();
    }

    // if (_deviceBox.get("ddevicebox") == null) {
    //   kdevice.crreatInitialData3();
    // } else {
    //   kdevice.loadkarbarData3();
    // }
    super.initState();
  }

  final nsmeedastgsh = TextEditingController();
  final dastgahshomare = TextEditingController();

  // List deviceha = [
  //   ["fjj", 123]
  // ];

  void createDevice(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return deviceDialog(
            namedastgah: nsmeedastgsh,
            shomaredastgah: dastgahshomare,
            baracancle: () => Navigator.of(context).pop(),
            barasave: savedastgah);
      },
    );
  }

  void savedastgah() {
    setState(() {
      kdevice.deviceha.add([nsmeedastgsh.text, int.parse(dastgahshomare.text)]);
      dastgahshomare.clear();
      nsmeedastgsh.clear();
    });
    Navigator.of(context).pop();
    kdevice.updatekarbarData3();
  }

  void deltedeviceha(int index) {
    setState(() {
      kdevice.deviceha.removeAt(index);
      kdevice.updatekarbarData3();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(214, 116, 71, 180),
          centerTitle: true,
          title: const Text('دستگاه'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          shape: const CircleBorder(),
          onPressed: () => createDevice(context),
        ),
        body: ListView.builder(
          itemCount: kdevice.deviceha.length,
          itemBuilder: (context, index) {
            return myDevice(
              deviceName: kdevice.deviceha[index][0],
              deviceNumber: kdevice.deviceha[index][1],
              deletedevice: (context) => deltedeviceha(index),
            );
          },
        ));
  }
}
