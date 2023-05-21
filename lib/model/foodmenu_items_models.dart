class FoodMenuItemsModel {
  int? status;
  bool? success;
  String? message;
  List<Data>? data;

  FoodMenuItemsModel({this.status, this.success, this.message, this.data});

  FoodMenuItemsModel.fromJson(Map<String, dynamic> json) {
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
  String? enName;
  String? detailsEn;
  String? detailsAr;
  dynamic? price;
  String? image;

  Data({this.enName, this.detailsEn, this.detailsAr, this.price, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    enName = json['enName'];
    detailsEn = json['detailsEn'];
    detailsAr = json['detailsAr'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enName'] = this.enName;
    data['detailsEn'] = this.detailsEn;
    data['detailsAr'] = this.detailsAr;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
