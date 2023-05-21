class LoginModel {
  int? errorCode;
  String? message;
  bool? success;
  String? title;
  String? acessToken;
  Data? data;

  LoginModel(
      {this.errorCode,
      this.message,
      this.success,
      this.title,
      this.acessToken,
      this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['ErrorCode'];
    message = json['Message'];
    success = json['Success'];
    title = json['Title'];
    acessToken = json['acessToken'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrorCode'] = this.errorCode;
    data['Message'] = this.message;
    data['Success'] = this.success;
    data['Title'] = this.title;
    data['acessToken'] = this.acessToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? userName;
  int? id;
  int? branchId;
  int? groupID;

  User({this.userName, this.id, this.branchId, this.groupID});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    id = json['id'];
    branchId = json['branchId'];
    groupID = json['groupID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['id'] = this.id;
    data['branchId'] = this.branchId;
    data['groupID'] = this.groupID;
    return data;
  }
}
