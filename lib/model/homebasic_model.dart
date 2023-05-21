class HomeBasicModel {
  String? message;
  bool? success;
  Data? data;

  HomeBasicModel({this.message, this.success, this.data});

  HomeBasicModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? branchNameAr;
  String? branchNameEn;
  int? inside;
  int? outside;
  bool? isInsideFull;
  bool? isOutsideFull;
  bool? outsideActive;
  bool? insideActive;

  Data(
      {this.branchNameAr,
      this.branchNameEn,
      this.inside,
      this.outside,
      this.isInsideFull,
      this.isOutsideFull,
      this.outsideActive,
      this.insideActive});

  Data.fromJson(Map<String, dynamic> json) {
    branchNameAr = json['branchNameAr'];
    branchNameEn = json['branchNameEn'];
    inside = json['inside'];
    outside = json['outside'];
    isInsideFull = json['isInsideFull'];
    isOutsideFull = json['isOutsideFull'];
    outsideActive = json['outsideActive'];
    insideActive = json['insideActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branchNameAr'] = this.branchNameAr;
    data['branchNameEn'] = this.branchNameEn;
    data['inside'] = this.inside;
    data['outside'] = this.outside;
    data['isInsideFull'] = this.isInsideFull;
    data['isOutsideFull'] = this.isOutsideFull;
    data['outsideActive'] = this.outsideActive;
    data['insideActive'] = this.insideActive;
    return data;
  }
}
