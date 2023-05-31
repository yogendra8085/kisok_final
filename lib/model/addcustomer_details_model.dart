class AddCustomerDetailsModel {
  int? status;
  bool? success;
  String? message;
  Clientdetails? clientdetails;
  Countrydetails? countrydetails;

  AddCustomerDetailsModel(
      {this.status,
      this.success,
      this.message,
      this.clientdetails,
      this.countrydetails});

  AddCustomerDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    clientdetails = json['clientdetails'] != null
        ? new Clientdetails.fromJson(json['clientdetails'])
        : null;
    countrydetails = json['countrydetails'] != null
        ? new Countrydetails.fromJson(json['countrydetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.clientdetails != null) {
      data['clientdetails'] = this.clientdetails!.toJson();
    }
    if (this.countrydetails != null) {
      data['countrydetails'] = this.countrydetails!.toJson();
    }
    return data;
  }
}

class Clientdetails {
  int? clientId;
  String? clientName;
  String? clientPhone;
  int? country;
  int? clientGender;

  Clientdetails(
      {this.clientId,
      this.clientName,
      this.clientPhone,
      this.country,
      this.clientGender});

  Clientdetails.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientName = json['client_name'];
    clientPhone = json['client_phone'];
    country = json['country'];
    clientGender = json['client_gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['client_name'] = this.clientName;
    data['client_phone'] = this.clientPhone;
    data['country'] = this.country;
    data['client_gender'] = this.clientGender;
    return data;
  }
}

class Countrydetails {
  int? countryId;
  String? countryName;
  bool? countryStatus;
  String? countryCode;
  String? countryCurancy;
  String? countryNameAr;
  String? flag;
  bool? restActive;
  int? length;
  String? prefix;
  String? shortCode;
  Null? ticketActive;
  Null? region;

  Countrydetails(
      {this.countryId,
      this.countryName,
      this.countryStatus,
      this.countryCode,
      this.countryCurancy,
      this.countryNameAr,
      this.flag,
      this.restActive,
      this.length,
      this.prefix,
      this.shortCode,
      this.ticketActive,
      this.region});

  Countrydetails.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    countryName = json['country_name'];
    countryStatus = json['country_status'];
    countryCode = json['country_code'];
    countryCurancy = json['country_curancy'];
    countryNameAr = json['country_name_ar'];
    flag = json['flag'];
    restActive = json['restActive'];
    length = json['length'];
    prefix = json['prefix'];
    shortCode = json['shortCode'];
    ticketActive = json['ticketActive'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['country_status'] = this.countryStatus;
    data['country_code'] = this.countryCode;
    data['country_curancy'] = this.countryCurancy;
    data['country_name_ar'] = this.countryNameAr;
    data['flag'] = this.flag;
    data['restActive'] = this.restActive;
    data['length'] = this.length;
    data['prefix'] = this.prefix;
    data['shortCode'] = this.shortCode;
    data['ticketActive'] = this.ticketActive;
    data['region'] = this.region;
    return data;
  }
}