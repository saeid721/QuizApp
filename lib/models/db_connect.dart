import 'package:http/http.dart' as http;
import '../models/question_model.dart';
import 'dart:convert';

class DBconnect {
  final url = Uri.parse(
      'https://flutterquizapp-2183c-default-rtdb.firebaseio.com/questions.json');
  Future<void> addQuestion(Question question) async {
    http.post(url,
        body: json.encode({
          'title': question.title,
          'options': question.options,
        }));
  }

  Future<void> fetchQuestions() async {
    http.get(url).then((response) {
      var data = json.decode(response.body);
      print(data);
    });
  }
}
