//import 'dart:async';
import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  void _answerQuestions() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What is your favourite color?',
        'asnwers': ['blue', 'green', 'red', 'yellow']
      },
      {
        'questionText': 'What is your favourite animal?',
        'asnwers': ['cat', 'dog', 'horse', 'elephant']
      },
      {
        'questionText': 'What is your favourite car?',
        'asnwers': ['mazda', 'honda', 'ferrari', 'toyota']
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First APP'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['asnwers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestions, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
