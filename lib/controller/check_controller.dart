import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/addcustomer_details_model.dart';
import '../model/get_data_model.dart';
import '../screen/select_chair.dart';
class CheckController{
  GetDataModel getDataModel=GetDataModel();
  getdata(String contrycode,String phonenumber ) async {
    String countrycode1=contrycode.replaceAll("+", "");
     final Uri _checkline = Uri.parse("http://18.133.142.150:6600/kiosk/country/getClientInformation?phone=${phonenumber}&country_code=${countrycode1}");
     final prefs = await SharedPreferences.getInstance();

    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "${prefs.getString("userToken")}"
    };
    print("print data");
    try{
 final response =
          await http.get(_checkline, headers: headers);
          var data = jsonDecode(response.body.toString());
        if(response.statusCode==200){
           getDataModel=GetDataModel.fromJson(data);
           return getDataModel;
        }
        else{
            Get.showSnackbar(
          GetSnackBar(
            title: response.statusCode.toString(),
            message:"failed" ,
            duration: const Duration(seconds: 3),
          ),
        );
        }

    } catch(e){
          Get.showSnackbar(
          GetSnackBar(
            title:"Failed",
            message:e.toString() ,
            duration: const Duration(seconds: 3),
          ),
        );
    }
    return getDataModel;
    
  }
  adddata(String contrycode,String phonenumber,String name,String gender) async {
    String countrycode1=contrycode.replaceAll("+", "");
    AddCustomerDetailsModel addCustomerDetailsModel=AddCustomerDetailsModel();
 final Uri addline = Uri.parse("http://18.133.142.150:6600/kiosk/country/getClientInformation?client_name=${name}&client_phone=${phonenumber}&country_code=${countrycode1}&client_gender=${gender}");
     final prefs = await SharedPreferences.getInstance();

    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "${prefs.getString("userToken")}"
    };
    try{
 final response =
          await http.get(addline, headers: headers);
          var data = jsonDecode(response.body.toString());
          print("satus code add"+(response.statusCode).toString());
        if(response.statusCode==200){
           addCustomerDetailsModel=AddCustomerDetailsModel.fromJson(data);
            Get.to(() => SelectChair(addCustomerDetailsModel:addCustomerDetailsModel ,));
              Get.showSnackbar(
          GetSnackBar(
            title: "Sucess",
            message:"Customer Added Sucessfuly!" ,
            duration: const Duration(seconds: 3),
          ),
        );
           return addCustomerDetailsModel;
        }
        else{
            Get.showSnackbar(
          GetSnackBar(
            title: response.statusCode.toString(),
            message:"failed" ,
            duration: const Duration(seconds: 3),
          ),
        );
        }

    } catch(e){
          Get.showSnackbar(
          GetSnackBar(
            title:"Failed",
            message:e.toString() ,
            duration: const Duration(seconds: 3),
          ),
        );
    }
    return addCustomerDetailsModel;
  }
}