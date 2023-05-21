class ExpectedTimeModel {
  int? status;
  bool? success;
  String? message;
  InsideTime? insideTime;
  InsideTime? outsideTime;
  List<dynamic>? outside;

  ExpectedTimeModel(
      {this.status,
      this.success,
      this.message,
      this.insideTime,
      this.outsideTime,
      this.outside});

  ExpectedTimeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    insideTime = json['insideTime'] != null
        ? new InsideTime.fromJson(json['insideTime'])
        : null;
    outsideTime = json['outsideTime'] != null
        ? new InsideTime.fromJson(json['outsideTime'])
        : null;
    if (json['outside'] != null) {
      outside = json['outside'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.insideTime != null) {
      data['insideTime'] = this.insideTime!.toJson();
    }
    if (this.outsideTime != null) {
      data['outsideTime'] = this.outsideTime!.toJson();
    }
    if (this.outside != null) {
      data['outside'] = this.outside!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InsideTime {
  int? day;
  dynamic? hours;
  dynamic? minutes;

  InsideTime({this.day, this.hours, this.minutes});

  InsideTime.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    hours = json['hours'];
    minutes = json['minutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['hours'] = this.hours;
    data['minutes'] = this.minutes;
    return data;
  }
}
