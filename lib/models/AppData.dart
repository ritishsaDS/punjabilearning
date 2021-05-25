class AppData {
  Datas data;
  bool success;
  String message;

  AppData({this.data, this.success, this.message});

  AppData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Datas.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Datas {
  int id;
  String appVersion;
  String logo;
  String createdAt;
  String updatedAt;

  Datas({this.id, this.appVersion, this.logo, this.createdAt, this.updatedAt});

  Datas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appVersion = json['app_version'];
    logo = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['app_version'] = this.appVersion;
    data['logo'] = this.logo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}