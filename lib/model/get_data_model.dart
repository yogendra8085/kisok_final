class GetDataModel {
  String? message;
  bool? success;
  ListOfData? listOfData;

  GetDataModel({this.message, this.success, this.listOfData});

  GetDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    listOfData = json['listOfData'] != null
        ? new ListOfData.fromJson(json['listOfData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.listOfData != null) {
      data['listOfData'] = this.listOfData!.toJson();
    }
    return data;
  }
}

class ListOfData {
  dynamic clientId;
  String? clientName;
  String? clientPhone;
  dynamic createdDate;
  dynamic clientStatus;
  dynamic clientGender;
  dynamic password;
  dynamic mail;
  dynamic birthDate;
  dynamic points;
  dynamic longitude;
  dynamic latitude;
  dynamic country;
  dynamic savedTime;
  dynamic createdMethod;
  dynamic userId;
  dynamic restId;
  dynamic lastSeen;
  dynamic avatar;
  dynamic activationStep;
  dynamic walletBalance;
  dynamic realTimeChannel;
  dynamic freeQueue;
  dynamic subscription;
  dynamic subscriptionExpiredOn;
  dynamic totalQueue;
  bool? addedFreeQueue;
  dynamic loginPassword;
  bool? hasApp;
  dynamic carno;
  dynamic cardetails;
  dynamic oTP;
  dynamic countryId;
  String? countryName;
  dynamic countryStatus;
  dynamic countryCode;
  String? countryCurancy;
  String? countryNameAr;
  String? flag;
  dynamic restActive;
  dynamic length;
  String? prefix;
  String? shortCode;
  String? ticketActive;
  String? region;

  ListOfData(
      {this.clientId,
      this.clientName,
      this.clientPhone,
      this.createdDate,
      this.clientStatus,
      this.clientGender,
      this.password,
      this.mail,
      this.birthDate,
      this.points,
      this.longitude,
      this.latitude,
      this.country,
      this.savedTime,
      this.createdMethod,
      this.userId,
      this.restId,
      this.lastSeen,
      this.avatar,
      this.activationStep,
      this.walletBalance,
      this.realTimeChannel,
      this.freeQueue,
      this.subscription,
      this.subscriptionExpiredOn,
      this.totalQueue,
      this.addedFreeQueue,
      this.loginPassword,
      this.hasApp,
      this.carno,
      this.cardetails,
      this.oTP,
      this.countryId,
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

  ListOfData.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientName = json['client_name'];
    clientPhone = json['client_phone'];
    createdDate = json['created_date'];
    clientStatus = json['client_status'];
    clientGender = json['client_gender'];
    password = json['password'];
    mail = json['mail'];
    birthDate = json['birthDate'];
    points = json['points'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    country = json['country'];
    savedTime = json['savedTime'];
    createdMethod = json['createdMethod'];
    userId = json['userId'];
    restId = json['restId'];
    lastSeen = json['lastSeen'];
    avatar = json['avatar'];
    activationStep = json['activationStep'];
    walletBalance = json['walletBalance'];
    realTimeChannel = json['realTimeChannel'];
    freeQueue = json['freeQueue'];
    subscription = json['subscription'];
    subscriptionExpiredOn = json['subscriptionExpiredOn'];
    totalQueue = json['totalQueue'];
    addedFreeQueue = json['AddedFreeQueue'];
    loginPassword = json['LoginPassword'];
    hasApp = json['hasApp'];
    carno = json['carno'];
    cardetails = json['Cardetails'];
    oTP = json['OTP'];
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
    data['client_id'] = this.clientId;
    data['client_name'] = this.clientName;
    data['client_phone'] = this.clientPhone;
    data['created_date'] = this.createdDate;
    data['client_status'] = this.clientStatus;
    data['client_gender'] = this.clientGender;
    data['password'] = this.password;
    data['mail'] = this.mail;
    data['birthDate'] = this.birthDate;
    data['points'] = this.points;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['country'] = this.country;
    data['savedTime'] = this.savedTime;
    data['createdMethod'] = this.createdMethod;
    data['userId'] = this.userId;
    data['restId'] = this.restId;
    data['lastSeen'] = this.lastSeen;
    data['avatar'] = this.avatar;
    data['activationStep'] = this.activationStep;
    data['walletBalance'] = this.walletBalance;
    data['realTimeChannel'] = this.realTimeChannel;
    data['freeQueue'] = this.freeQueue;
    data['subscription'] = this.subscription;
    data['subscriptionExpiredOn'] = this.subscriptionExpiredOn;
    data['totalQueue'] = this.totalQueue;
    data['AddedFreeQueue'] = this.addedFreeQueue;
    data['LoginPassword'] = this.loginPassword;
    data['hasApp'] = this.hasApp;
    data['carno'] = this.carno;
    data['Cardetails'] = this.cardetails;
    data['OTP'] = this.oTP;
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
