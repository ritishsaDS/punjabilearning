import 'dart:convert';

import 'package:flutter_punjabilearning/models/QuizGameModel.dart';
import 'package:http/http.dart';

class QuizApiHitter {
  Future<List<QuizGameModel>> getThisQuizList() async {
    final Response response = await get('');
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      List<QuizGameModel> quizList = QuizGameModel.fromJson(json) as List;

      print(quizList[1].question);

      return quizList;
    } else {
      throw Exception("Error accessing the User API \nStatus Code: " +
          response.statusCode.toString());
    }
  }
}
