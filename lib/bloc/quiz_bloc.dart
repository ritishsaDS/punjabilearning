import 'package:flutter_punjabilearning/models/QuizGameModel.dart';
import 'package:rxdart/subjects.dart';

class QuizBloc {
  final _optionList = BehaviorSubject<List<String>>();
  final _correctAnswer = BehaviorSubject<int>();
  final _quesiton = BehaviorSubject<String>();

  QuizBloc() {
    loadListOfOptions();
  }

  Stream<List<String>> get getListOfOption => _optionList.stream;
  Stream<int> get getCorrectAnswerIndex => _correctAnswer.stream;
  Stream<String> get getQuestion => _quesiton.stream;

  Function(List<String>) get ChangeOptionList => _optionList.sink.add;
  Function(int) get ChangeCorrectAnswer => _correctAnswer.sink.add;

  dispose() {
    _optionList.close();
    _quesiton.close();
    _correctAnswer.close();
  }

  loadListOfOptions() {
    var list = questions.map((e) => e.listOfOption);
    list.forEach((element) {
      ChangeOptionList(element);
    });
  }
}

final List<QuizGameModel> questions =
    sample_data.map((question) => QuizGameModel.fromJson(question));
