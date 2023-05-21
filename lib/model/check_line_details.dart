class CheckLineDetailsModel {
  int? status;
  bool? success;
  String? message;
  String? position;
  int? turn;

  CheckLineDetailsModel(
      {this.status, this.success, this.message, this.position, this.turn});

  CheckLineDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    position = json['position'];
    turn = json['turn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    data['position'] = this.position;
    data['turn'] = this.turn;
    return data;
  }
}
