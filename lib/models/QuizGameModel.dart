class QuizGameModel {
  String question;
  List<String> listOfOption;
  int answerIndex;
  String imageUrl;
  String message;
  String statusCode;

  QuizGameModel(
      {this.question,
      this.listOfOption,
      this.answerIndex,
      this.imageUrl,
      this.message,
      this.statusCode});

  factory QuizGameModel.fromJson(Map<String, dynamic> json) => QuizGameModel(
        listOfOption: json['options'],
        answerIndex: json['answerIndex'],
        imageUrl: json['imageUrl'],
        message: json['message'],
        question: json['question'],
        statusCode: json['statusCode'],
      );
}

const List sample_data = [
  {
    "options": ['a', 'b', 'c', 'd'],
    "question": "what is answer",
    "answerIndex": 1,
  },
  {
    "options": ['a', 'b', 'c', 'd'],
    "question": "what is answer",
    "answerIndex": 1,
  },
  {
    "options": ['a', 'b', 'c', 'd'],
    "question": "what is answer",
    "answerIndex": 1,
  },
  {
    "options": ['a', 'b', 'c', 'd'],
    "question": "what is answer",
    "answerIndex": 1,
  },
  {
    "options": ['a', 'b', 'c', 'd'],
    "question": "what is answer",
    "answerIndex": 1,
  },
  {
    "options": ['a', 'b', 'c', 'd'],
    "question": "what is answer",
    "answerIndex": 1,
  },
  {
    "options": ['a', 'b', 'c', 'd'],
    "question": "what is answer",
    "answerIndex": 1,
  },
  {
    "options": ['a', 'b', 'c', 'd'],
    "question": "what is answer",
    "answerIndex": 1,
  },
];
