import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class karbardata {
  List karbarha = [];
  final _userBox = Hive.box('myuserbox');

  // every time that app runs
  void crreatInitialData() {
    karbarha = [];
  }

  //upload the data from database
  void loadkarbarData() {
    karbarha = _userBox.get("karbardata");
  }

  //update the database
  void updatekarbarData() {
    _userBox.put("karbardata", karbarha);
  }

//
  //admindata

  List damin = [];
  final _adminBox = Hive.box('myadminbox');

  // every time that app runs
  void crreatInitialData2() {
    damin = [];
  }

  //upload the data from database
  void loadkarbarData2() {
    damin = _adminBox.get("admindata");
  }

  //update the database
  void updatekarbarData2() {
    _adminBox.put("admindata", damin);
  }

  //
  //devicedata

  // List deviceha = [];
  // final _deviceBox = Hive.box('mydevicebox');

  // // every time that app runs
  // void createedevice() {
  //   deviceha = [
  //     ["fjj", 123]
  //   ];
  // }

  // // upload the data from database
  // void loaddeviceData() {
  //   deviceha = _deviceBox.get("ddevicebox");
  // }

  // //uoload from database
  // void updatedeviceData() {
  //   _deviceBox.put("ddvicebox", deviceha);
  // }
  List deviceha = [];
  final _deviceBox = Hive.box('mydevicebox');

  // every time that app runs
  void crreatInitialData3() {
    deviceha = [];
  }

  //upload the data from database
  void loadkarbarData3() {
    deviceha = _deviceBox.get("devicceedata");
  }

  //update the database
  void updatekarbarData3() {
    _deviceBox.put("devicceedata", deviceha);
  }
}
