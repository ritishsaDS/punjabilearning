class Fatti {
  List<Content> content;
  int code;
  String message;

  Fatti({this.content, this.code, this.message});

  Fatti.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = new List<Content>();
      json['content'].forEach((v) {
        content.add(new Content.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content.map((v) => v.toJson()).toList();
      //print(data['content']);
    }
    data['code'] = this.code;
    print(data);
    return data;
  }
}

class Content {
  int id;
  String name;
  String content;
  String image;
  String order;
  String audio;
  String description;
  String createdAt;
  String updatedAt;
  String title;
  String khani;

  Content(
      {this.id,
      this.name,
      this.content,
      this.image,
      this.order,
      this.audio,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.khani});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    order = json['order'];
    audio = json['audio'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    khani = json['khani'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['order'] = this.order;
    data['audio'] = this.audio;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
