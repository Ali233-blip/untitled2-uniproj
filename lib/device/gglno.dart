import 'package:flutter/material.dart';
import 'package:untitled2/data/myLastdatabase.dart';
import 'package:untitled2/device/jjhv.dart';
import 'package:untitled2/device/showDialogdevice.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class ffls extends StatefulWidget {
  const ffls({super.key});

  @override
  State<ffls> createState() => _fflsState();
}

class _fflsState extends State<ffls> {
  final esmadaattggaahh = TextEditingController();
  final shhoommaarreeddaassttggaahh = TextEditingController();

  final _lsatbox = Hive.box('MyLastbox');

  laaastBase cconm = laaastBase();

  @override
  void initState() {
    if (_lsatbox.get("chaman") == null) {
      cconm.creteintdata();
    } else {
      cconm.loadingDot();
    }
    super.initState();
  }

  void delleetteessyysstteemm(int index) {
    setState(() {
      cconm.kkol.removeAt(index);
    });
    cconm.upbada();
  }

  void saaavveeddaassttggaahh() {
    setState(() {
      cconm.kkol.add(
          [esmadaattggaahh.text, int.parse(shhoommaarreeddaassttggaahh.text)]);
      esmadaattggaahh.clear();
      shhoommaarreeddaassttggaahh.clear();
    });
    Navigator.of(context).pop();
    cconm.upbada();
  }

  // void vojodtask(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return deviceDialog(
  //           namedastgah: esmadaattggaahh,
  //           shomaredastgah: shhoommaarreeddaassttggaahh,
  //           baracancle: () => Navigator.of(context).pop(),
  //           barasave: saaavveeddaassttggaahh);
  //     },
  //   );
  // }

  void saakkhhtteeddaassttggaahh(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return deviceDialog(
            namedastgah: esmadaattggaahh,
            shomaredastgah: shhoommaarreeddaassttggaahh,
            baracancle: () => Navigator.of(context).pop(),
            barasave: saaavveeddaassttggaahh);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(214, 116, 71, 180),
        centerTitle: true,
        title: const Text('دستگاه'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        shape: const CircleBorder(),
        onPressed: () => saakkhhtteeddaassttggaahh(context),
      ),
      body: ListView.builder(
        itemCount: cconm.kkol.length,
        itemBuilder: (context, index) {
          return kkjm(
            naammee: cconm.kkol[index][0],
            shhoommaarree: cconm.kkol[index][1],
            dellddassttggaahh: (context) => delleetteessyysstteemm(index),
          );
        },
      ),
    );
  }
}
