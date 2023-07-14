import 'package:assessment_app/questions/Q1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Results extends StatefulWidget {
  final int questionsAnswered;
  final int correctAnswer;

  const Results({
    Key? key,
    required this.questionsAnswered,
    required this.correctAnswer,
  }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Results> {
  static const String appBarTitle = '測試結果';
  final int wrongAnswer = (questionsAnswered - correctAnswer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(appBarTitle)),
        body: Center(
            child: Column(children: [
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(12),
            decoration: (BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(70),
            )),
            child: Text(
              '回答題數：$questionsAnswered',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(12),
            decoration: (BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(70),
            )),
            child: Text(
              '正確回答題數：$correctAnswer',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(12),
            decoration: (BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(70),
            )),
            child: Text(
              '錯誤回答題數：$wrongAnswer',
              style: const TextStyle(fontSize: 25),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ))),
            child: const Text(
              '完成',
              style: TextStyle(fontSize: 28),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(12),
            child: const Text(
              '請舉手並說：「我做完。」',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ])));
  }
}
