import 'package:flutter/material.dart';
import 'package:assessment_app/screens/instructions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static const String appBarTitle = '沙田公立學校 言語治療組 粵語語法測試';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(appBarTitle)),
        body: Center(
            child: Column(
          children: [
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(12),
              decoration: (BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(70),
              )),
              child: const Text(
                '語法理解',
                style: TextStyle(fontSize: 25),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 10),
              child: const Text(
                '每題題目只能重複一次, 必須完成所有的題目',
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
            ),
            const Spacer(),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 10),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ))),
                child: const Text(
                  '開始評核',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Instruction()));
                },
              ),
            ),
            const Spacer(),
            const Spacer(),
          ],
        )));
  }
}
