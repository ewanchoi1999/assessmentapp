// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:assessment_app/screens/home.dart';
import 'package:assessment_app/questions/Q17.dart';

class Q16 extends StatefulWidget {
  const Q16({super.key});

  @override
  TestPageState createState() => TestPageState();
}

class TestPageState extends State<Q16> {
  static const String appBarTitle = '語法理解';
  // ignore: unused_field

  int _score = 0; //score for assessment in future
  int _submissions = 0;
  bool enable =
      false; //default state for submit is now allowed. button changes when option is selected
  List<bool> isSelected = [false, false, false];

  void canbeSubmitted() {
    if (enable = false) {
      enable = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appBarTitle)),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                '  16.',
                style: TextStyle(fontSize: 22),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected[0] = true;
                      isSelected[1] = false;
                      isSelected[2] = false;
                      enable = true;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      isSelected[0] = false;
                      isSelected[1] = false;
                      isSelected[2] = false;
                      enable = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected[0] ? Colors.blue : Colors.transparent,
                    ),
                    child: Image.asset(
                      'assets/images/boy1.png',
                      fit: BoxFit.contain,
                      height: 250,
                      width: 250,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected[0] = false;
                      isSelected[1] = true;
                      isSelected[2] = false;
                      enable = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected[1] ? Colors.blue : Colors.transparent,
                    ),
                    child: Image.asset(
                      'assets/images/boy2.png',
                      fit: BoxFit.contain,
                      height: 225,
                      width: 225,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected[0] = false;
                      isSelected[1] = false;
                      isSelected[2] = true;
                      enable = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected[2] ? Colors.blue : Colors.transparent,
                    ),
                    child: Image.asset(
                      'assets/images/boy3.png',
                      fit: BoxFit.contain,
                      height: 275,
                      width: 275,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                ElevatedButton.icon(
                    onPressed: () async {
                      AudioPlayer().play(AssetSource('/recording/16.wav'));
                    },
                    icon: const Icon(Icons.play_arrow_outlined),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ))),
                    label: const Text(
                      '播放',
                      style: TextStyle(fontSize: 30),
                    )),
                const Spacer(),
                ElevatedButton.icon(
                    onPressed: enable
                        ? () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Q17()));
                          }
                        : null,
                    icon: const Icon(Icons.arrow_right_alt_outlined),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ))),
                    label: const Text(
                      '下一題',
                      style: TextStyle(fontSize: 30),
                    )),
                const Spacer(),
                ElevatedButton.icon(
                    icon: const Icon(Icons.cancel_outlined),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('確定要取消?'),
                              actions: [
                                TextButton(
                                  child: const Text('否'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: const Text('是'),
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                const HomePage()),
                                        ModalRoute.withName('/'));
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ))),
                    label: const Text(
                      '取消',
                      style: TextStyle(fontSize: 30),
                    )),
                const Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
