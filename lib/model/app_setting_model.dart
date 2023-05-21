class AppSettingModel {
  int? status;
  bool? success;
  String? message;
  List<Data>? data;

  AppSettingModel({this.status, this.success, this.message, this.data});

  AppSettingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? branchId;
  String? userName;
  String? imageId;
  String? colorCode;
  String? videoId;
  String? type;

  Data(
      {this.branchId,
      this.userName,
      this.imageId,
      this.colorCode,
      this.videoId,
      this.type});

  Data.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    userName = json['userName'];
    imageId = json['imageId'];
    colorCode = json['colorCode'];
    videoId = json['videoId'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_id'] = this.branchId;
    data['userName'] = this.userName;
    data['imageId'] = this.imageId;
    data['colorCode'] = this.colorCode;
    data['videoId'] = this.videoId;
    data['type'] = this.type;
    return data;
  }
}
