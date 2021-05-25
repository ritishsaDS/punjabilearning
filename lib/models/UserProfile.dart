class UserProfile {
  User user;
  String message;

  UserProfile({this.user,this.message});

  UserProfile.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String email;
  String emailVerify;
  String profilePic;
  Null phoneNumber;
  String status;
  Null deletedAt;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerify,
        this.profilePic,
        this.phoneNumber,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerify = json['email_verify'];
    profilePic = json['profile_pic'];
    phoneNumber = json['phone_number'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verify'] = this.emailVerify;
    data['profile_pic'] = this.profilePic;
    data['phone_number'] = this.phoneNumber;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}