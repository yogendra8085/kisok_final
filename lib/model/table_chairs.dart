class TabaleChairsModel {
  String? message;
  bool? success;
  List<ListOfData>? listOfData;

  TabaleChairsModel({this.message, this.success, this.listOfData});

  TabaleChairsModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  int? position;
  int? restId;
  int? chares;
  bool? isAvailable;
  bool? isActive;
  int? qMapId;
  int? branchId;

  ListOfData(
      {this.id,
      this.name,
      this.position,
      this.restId,
      this.chares,
      this.isAvailable,
      this.isActive,
      this.qMapId,
      this.branchId});

  ListOfData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
    restId = json['restId'];
    chares = json['chares'];
    isAvailable = json['isAvailable'];
    isActive = json['isActive'];
    qMapId = json['qMapId'];
    branchId = json['branchId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['position'] = this.position;
    data['restId'] = this.restId;
    data['chares'] = this.chares;
    data['isAvailable'] = this.isAvailable;
    data['isActive'] = this.isActive;
    data['qMapId'] = this.qMapId;
    data['branchId'] = this.branchId;
    return data;
  }
}