import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import './screens/home_screen.dart';
import './models/db_connect.dart';

void main() {
  var db = DBconnect();
  // db.addQuestion(Question(id: '20', title: 'What is 20 x 100?', options: {
  //   '100': false,
  //   '200': true,
  //   '300': false,
  //   '500': false,
  // }));
  db.fetchQuestions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'Flutter Quiz'),
    );
  }
}
