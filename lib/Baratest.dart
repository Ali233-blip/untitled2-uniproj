import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:untitled2/admin/karbar.dart';
import 'package:untitled2/admin/karbarDialogBox.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:untitled2/data/userdata.dart';
import 'package:untitled2/admin/adminDialogBox.dart';
import 'package:untitled2/admin/admin.dart';

class barafek extends StatefulWidget {
  barafek({super.key});

  @override
  State<barafek> createState() => _barafekState();
}

class _barafekState extends State<barafek> {
  final _userBox = Hive.box('myuserbox');
  karbardata kdata = karbardata();

  //
  final _adminBox = Hive.box('myadminbox');

  // @override
  // void initState() {
  //   super.initState();

  //   bool needsInitialData = _adminBox.get("admindata") == null ||
  //       _userBox.get("karbardata") == null;

  //   if (needsInitialData) {
  //     kdata
  //         .crreatInitialData2(); // Assuming this covers both admin and user data
  //     kdata.crreatInitialData2();
  //   } else {
  //     // Load both admin and user data if both exist
  //     kdata.loadkarbarData2();
  //     kdata.loadkarbarData();
  //   }
  // }

  @override
  void initState() {
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

    super.initState();
  }

  final karbarnamee = TextEditingController();
  final karbarshonare = TextEditingController();

  // final List karbarha = [
  //   ['jhkry', 876543, false],
  //   ['tt', 343, true]
  // ];
  final adminnamee = TextEditingController();
  final adminshomare = TextEditingController();
  //
  // final List damin = [
  //   ['ff', 2334, false],
  // ];

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
        });
  }

  void saveforAdmin() {
    setState(() {
      kdata.damin.add([adminnamee.text, int.parse(adminshomare.text), false]);
      adminnamee.clear();
      adminshomare.clear();
    });
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

    Navigator.of(context).pop();
    kdata.updatekarbarData();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      kdata.karbarha[index][2] = !kdata.karbarha[index][2];
      //کد فعال شدن تماس برای کاربر تکمیل گردد

      kdata.updatekarbarData();
    });
  }

  void checkBoxChanged2(bool? value, int index) {
    setState(() {
      kdata.damin[index][2] = !kdata.damin[index][2];
      //کد فعال شدن تماس برای کاربر تکمیل گردد

      kdata.updatekarbarData2();
    });
  }

  void deleteTask(int index) {
    setState(() {
      kdata.karbarha.removeAt(index);
      kdata.updatekarbarData();
    });
  }

  void deleteTask2(int index) {
    setState(() {
      kdata.damin.removeAt(index);
      kdata.updatekarbarData2();
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
            // Check if any admins exist in the data before displaying the "Add Admin" option
            if (_adminBox.get("admindata") == null || _adminBox.length == 0)
              SpeedDialChild(
                shape: const CircleBorder(),
                child: const Icon(Icons.add),
                label: 'افزودن مدیر',
                onTap: () => createAdmin(context),
              ),
            SpeedDialChild(
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
              label: 'افزودن کاربر',
              onTap: () => createKarbar(context),
            )
          ],
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(29, 30, 32, 255),
          centerTitle: true,
          title: const Text('ادمین ها'),
        ),
        body: Expanded(
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    if (kdata.damin.isEmpty) {
                      return Text(
                          'No data available'); // Display a placeholder if no data
                    } else {
                      return admanBox(
                        changeshe: (value) => checkBoxChanged2(value, index),
                        modirName: kdata.damin[index][0],
                        modirNumber: kdata.damin[index][1],
                        tamasModir: kdata.damin[index][2],
                        deleteFunction2: (context) => deleteTask2(index),
                      );
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    height: 1,
                    thickness: 2,
                    color: Colors.black38,
                  ),
                  // ... rest of your code
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext, int) => Divider(
                    height: 1,
                    thickness: 2,
                    color: Colors.black38,
                  ),
                  itemCount:
                      kdata.karbarha.length < 5 ? kdata.karbarha.length : 5,
                  itemBuilder: (context, index) {
                    if (index >= kdata.karbarha.length) {
                      return SizedBox
                          .shrink(); // Don't build items beyond available data
                    } else {
                      return karbar(
                          kabarNumber: kdata.karbarha[index][1],
                          karbarName: kdata.karbarha[index][0],
                          onChanged: (value) => checkBoxChanged(value, index),
                          tamaskarbar: kdata.karbarha[index][2],
                          deleteFunction: (context) => deleteTask(index));
                    }
                  },
                  // ... rest of your code
                ),
              ),
            ],
          ),
        ));
  }
}
