import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import '../model/addcustomer_details_model.dart';
import '../screen/great_screen.dart';
import '../utils/const/const_string.dart';

class AddQueueController{
 addqueue( String countrycode,String phone,String name,String gender,String chairs,String clienid,String tableposition,BuildContext context,AddCustomerDetailsModel addCustomerDetailsModel) async {
   final Uri addqueue =
      Uri.parse(ConstString.baseurl + ConstString.addqueue);
      final prefs = await SharedPreferences.getInstance();

    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "${prefs.getString("userToken")}"
    };
    print( "${prefs.getString("userToken")}");

      Map<String, dynamic> body ={
        "note":"hii", 
    "chairs":chairs, 
    "clientId":addCustomerDetailsModel.clientdetails?.clientId.toString(), 
    "tablePosition":tableposition, 
    "tagId":"-1", 
    "subTagId":"-1", 
    
    "countryCode":int.parse((addCustomerDetailsModel.countrydetails?.countryCode.toString().replaceAll("+","")).toString(),),
    "clientPhone":addCustomerDetailsModel.clientdetails?.clientPhone.toString(),
    "clientGender":addCustomerDetailsModel.clientdetails?.clientGender.toString(),
    "clientName":addCustomerDetailsModel.clientdetails?.clientName.toString(),
      };
      
    print("yg"+body.toString());
      

      

      
      SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);
    _dialog.show(
      message: 'Loading...',
    );
    try{
 final response =
          await http.post(addqueue, body: jsonEncode(body), headers: headers);
 var data = jsonDecode(response.body.toString());
         print("satus code"+(response.statusCode).toString());
         print("yg"+(data).toString());
          if(response.statusCode==200){
                _dialog.hide();
            Get.to(() => GreatScreen(addCustomerDetailsModel: addCustomerDetailsModel,));
              Get.showSnackbar(
          GetSnackBar(
            title: "Success",
            message: data["message"],
            duration: const Duration(seconds: 3),
          ),
        );
         
          }
          else {
        _dialog.hide();
        Get.showSnackbar(
          GetSnackBar(
            title: "Error",
            message:  data["message"],
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch(e){
  _dialog.hide();
      print(e.toString());
      Get.showSnackbar(
        GetSnackBar(
          title: "Failure",
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
      
 }
}