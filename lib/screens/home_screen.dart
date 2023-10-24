import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import '../screens/constants.dart';
import '../widgets/question_widgets.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';

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
  int score = 0;

  bool isPressed = false;

  bool isAlreadySelected = false;

  void nextQuestion() {
    if (index == _question.length - 1) {
      return;
    } else {
      setState(() {
        index++;
        isPressed = false;
        isAlreadySelected = false;
      });
    }
  }

  void CheckAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value = true) {
        score++;
        setState(() {
          isPressed = true;
          isAlreadySelected = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Score: $score',
              style: const TextStyle(fontSize: 18.0),
            ),
          )
        ],
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
            const SizedBox(
              height: 25.0,
            ),
            for (int i = 0; i < _question[index].options.length; i++)
              GestureDetector(
                onTap: () => CheckAnswerAndUpdate(
                    _question[index].options.values.toList()[i]),
                child: OptionCard(
                  option: _question[index].options.keys.toList()[i],
                  color: isPressed
                      ? _question[index].options.values.toList()[i] == true
                          ? correct
                          : incorrect
                      : neutral,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
