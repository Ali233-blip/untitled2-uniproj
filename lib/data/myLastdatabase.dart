import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class laaastBase {
  List kkol = [];
  final _lsatbox = Hive.box('MyLastbox');

  void creteintdata() {
    kkol = [];
  }

  void loadingDot() {
    kkol = _lsatbox.get("chaman");
  }

  void upbada() {
    _lsatbox.put("chaman", kkol);
  }
}
