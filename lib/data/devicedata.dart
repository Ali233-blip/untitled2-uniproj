import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class devicedart {
  //devicedata

  List deviceha = [];
  final _deviceBox = Hive.box('mydevicebox');

  // every time that app runs
  void createedevice() {
    deviceha = [
      ["fjj", 123]
    ];
  }

  // upload the data from database
  void loaddeviceData() {
    deviceha = _deviceBox.get("ddevicebox");
  }

  //uoload from database
  void updatedeviceData() {
    _deviceBox.put("ddvicebox", deviceha);
  }
}
