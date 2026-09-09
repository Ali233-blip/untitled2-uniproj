import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:untitled2/admin/karbar.dart';
import 'package:untitled2/admin/karbarDialogBox.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:untitled2/data/userdata.dart';
import 'package:untitled2/admin/adminDialogBox.dart';
import 'package:untitled2/admin/admin.dart';

class Adminha extends StatefulWidget {
  Adminha({super.key});

  @override
  State<Adminha> createState() => _AdminhaState();
}

class _AdminhaState extends State<Adminha> {
  final _userBox = Hive.box('myuserbox');
  karbardata kdata = karbardata();
  bool isAdminVisible = true;
  bool isKarbarVisible = true;
  final _adminBox = Hive.box('myadminbox');

  @override
  void initState() {
    super.initState();
    if (_adminBox.get("admindata") == null) {
      kdata.crreatInitialData2();
    } else {
      kdata.loadkarbarData2();
    }

    if (_userBox.get("karbardata") == null) {
      kdata.crreatInitialData();
    } else {
      kdata.loadkarbarData();
    }

    _updateAdminVisibility();
    _updateKarbarVisibility();
  }

  final karbarnamee = TextEditingController();
  final karbarshonare = TextEditingController();
  final adminnamee = TextEditingController();
  final adminshomare = TextEditingController();

  void createKarbar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialog(
          namekarbar: karbarnamee,
          shomarekarbar: karbarshonare,
          forSave: saveNewKarbar,
          forCancle: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void createAdmin(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAdminDialog(
          nameadmin: adminnamee,
          shomareadmin: adminshomare,
          forSave: saveforAdmin,
          forCancle: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void saveforAdmin() {
    setState(() {
      kdata.damin.add([adminnamee.text, int.parse(adminshomare.text), false]);
      adminnamee.clear();
      adminshomare.clear();
    });
    _updateAdminVisibility();
    Navigator.of(context).pop();
    kdata.updatekarbarData2();
  }

  void saveNewKarbar() {
    setState(() {
      kdata.karbarha
          .add([karbarnamee.text, int.parse(karbarshonare.text), false]);
      karbarshonare.clear();
      karbarnamee.clear();
    });
    _updateKarbarVisibility();
    Navigator.of(context).pop();
    kdata.updatekarbarData();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      kdata.karbarha[index][2] = !kdata.karbarha[index][2];
      kdata.updatekarbarData();
    });
  }

  void checkBoxChanged2(bool? value, int index) {
    setState(() {
      kdata.damin[index][2] = !kdata.damin[index][2];
      kdata.updatekarbarData2();
    });
  }

  void deleteTask(int index) {
    setState(() {
      kdata.karbarha.removeAt(index);
      kdata.updatekarbarData();
    });
    _updateKarbarVisibility();
  }

  void deleteTask2(int index) {
    setState(() {
      kdata.damin.removeAt(index);
      kdata.updatekarbarData2();
    });
    _updateAdminVisibility();
  }

  void _updateAdminVisibility() {
    setState(() {
      isAdminVisible = kdata.damin.isEmpty;
    });
  }

  void _updateKarbarVisibility() {
    setState(() {
      isKarbarVisible = kdata.karbarha.length < 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayOpacity: 0.4,
        spacing: 6.0,
        children: [
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
            label: 'افزودن مدیر',
            onTap: () => createAdmin(context),
            visible: isAdminVisible,
          ),
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
            label: 'افزودن کاربر',
            onTap: () => createKarbar(context),
            visible: isKarbarVisible,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(29, 30, 32, 255),
        centerTitle: true,
        title: const Text('ادمین ها'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 1,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: kdata.damin.length,
                itemBuilder: (context, index) {
                  return admanBox(
                    changeshe: (value) => checkBoxChanged2(value, index),
                    modirName: kdata.damin[index][0],
                    modirNumber: kdata.damin[index][1],
                    tamasModir: kdata.damin[index][2],
                    deleteFunction2: (context) => deleteTask2(index),
                  );
                },
              ),
            ),
            Flexible(
              flex: 2,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: kdata.karbarha.length,
                itemBuilder: (context, index) {
                  return karbar(
                    karbarName: kdata.karbarha[index][0],
                    onChanged: (value) => checkBoxChanged(value, index),
                    tamaskarbar: kdata.karbarha[index][2],
                    kabarNumber: kdata.karbarha[index][1],
                    deleteFunction: (context) => deleteTask(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
