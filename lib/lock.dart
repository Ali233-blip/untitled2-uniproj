import 'package:flutter/material.dart';
// import 'package:flutter_app_lock/flutter_app_lock.dart';

class lockas extends StatefulWidget {
  const lockas({super.key});

  @override
  State<lockas> createState() => _lockasState();
}

class _lockasState extends State<lockas> {
  String pin = '';
  String correctpin = '1234';
  bool isPincorrect = false;
  bool isError = false;

  void addNumber(String text) {
    setState(() {
      if (!isPincorrect) {
        if (pin.length < 4) {
          pin += text;
          if (pin.length == 4) {
            if (pin != correctpin) {
              isError = true;
              pin = '';
            } else {
              isError = false;
              isPincorrect = true;
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Success'),
                      content: const Text('Tou entered the correct PIN.'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            child: const Text('OK'))
                      ],
                    );
                  });
            }
          }
        }
      }
    });
  }

  void removeNumber() {
    setState(() {
      if (!isPincorrect && pin.isNotEmpty) {
        pin = pin.substring(0, pin.length - 1);
        isError = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final gridCount = screenWidth > 360 ? 3 : 2;

    return Scaffold(
      backgroundColor: Colors.white12,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  isPincorrect == true ? Icons.lock_open : Icons.lock_outline,
                  color: Colors.black,
                  size: 120,
                ),
                const Text(
                  'Enter your Pin',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      4, (index) => _buildPinBox(index < pin.length)),
                ),
                const SizedBox(height: 20),
                if (isError)
                  const Text(
                    'Invalid Pin,please try again.',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                  height: 10,
                ),
                GridView.count(
                  crossAxisCount: gridCount,
                  shrinkWrap: true,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9',
                    '',
                    '0',
                    Icons.backspace
                  ].map((key) {
                    if (key is String) {
                      return _buildKeyboardButton(key);
                    } else if (key is IconData) {
                      return _buildSpecialButton(key);
                    }
                    return Container();
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPinBox(bool hasValue) {
    return Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        child: hasValue
            ? const Icon(
          Icons.circle,
          color: Colors.black,
          size: 12,
        )
            : null);
  }

  Widget _buildKeyboardButton(String text) {
    return TextButton(
        onPressed: () {
          addNumber(text);
        },
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ));
  }

  Widget _buildSpecialButton(IconData icon) {
    return IconButton(
      onPressed: () {
        if (icon == Icons.backspace) {
          removeNumber();
        }
      },
      icon: Icon(icon),
      iconSize: 30,
      color: Colors.black,
    );
  }
}
