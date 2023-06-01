class SelectSubAreaModel {
  String? message;
  bool? success;
  List<ListOfData>? listOfData;

  SelectSubAreaModel({this.message, this.success, this.listOfData});

  SelectSubAreaModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['ListOfData'] != null) {
      listOfData = <ListOfData>[];
      json['ListOfData'].forEach((v) {
        listOfData!.add(new ListOfData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.listOfData != null) {
      data['ListOfData'] = this.listOfData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListOfData {
  String? nameEn;
  int? id;

  ListOfData({this.nameEn, this.id});

  ListOfData.fromJson(Map<String, dynamic> json) {
    nameEn = json['NameEn'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NameEn'] = this.nameEn;
    data['id'] = this.id;
    return data;
  }
}