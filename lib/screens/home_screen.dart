import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import '../screens/constants.dart';
import '../widgets/question_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> _question = [
    Question(
      id: '10',
      title: 'What is 2+2?',
      options: {'5': false, '30': false, '4': true, '10': false},
    ),
    Question(
      id: '11',
      title: 'Wthat is 10+20?',
      options: {'50': false, '30': true, '4': false, '10': false},
    ),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              QuestionWidget(
                indexAction: index,
                question: _question[index].title,
                totalQuestion: _question.length,
              ),
              const Divider(
                color: neutral,
              ),
            ],
          ),
        ));
  }
}
