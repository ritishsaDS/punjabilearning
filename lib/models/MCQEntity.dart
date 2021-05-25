class MCQEntity {
  int code;
  QuestionData data;
  String message;

  MCQEntity({this.code, this.data,this.message});

  MCQEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new QuestionData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class QuestionData {
  int currentPage;
  List<Data> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String path;
  int perPage;
  int to;
  int total;

  QuestionData(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.path,
        this.perPage,
        this.to,
        this.total});

  QuestionData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int id;
  String question;
  String option1;
  String option2;
  String option3;
  String option4;
  String correctOptionNo;
  String correctAnswer;
  String createdAt;
  String updatedAt;
  bool isselected1 = false;
  bool isselected2 = false;
  bool isselected3 = false;
  bool isselected4 = false;


  Data(
      {this.id,
        this.question,
        this.option1,
        this.option2,
        this.option3,
        this.option4,
        this.correctOptionNo,
        this.correctAnswer,
        this.createdAt,
        this.updatedAt,this.isselected1 = false,
        this.isselected2 = false,
        this.isselected3 = false,
        this.isselected4 = false,

      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    option1 = json['option_1'];
    option2 = json['option_2'];
    option3 = json['option_3'];
    option4 = json['option_4'];
    correctOptionNo = json['correct_option_no'];
    correctAnswer = json['correct_answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isselected1 = json['isselected1']!=null?json['isselected1']:false;
    isselected2 = json['isselected2']!=null?json['isselected2']:false;
    isselected3 = json['isselected3']!=null?json['isselected3']:false;
    isselected4 = json['isselected4']!=null?json['isselected4']:false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['option_1'] = this.option1;
    data['option_2'] = this.option2;
    data['option_3'] = this.option3;
    data['option_4'] = this.option4;
    data['correct_option_no'] = this.correctOptionNo;
    data['correct_answer'] = this.correctAnswer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}