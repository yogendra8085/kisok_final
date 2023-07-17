import '../model/check_line_details.dart';
import '../screen/check_your_turn_result.dart';
import '../utils/const/const_string.dart';
import '../model/expected_time_model.dart';
import '../utils/const/const_string.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:http/http.dart' as http;
import '../model/homebasic_model.dart';
import '../utils/const/const_string.dart';
import 'get_setting_controller.dart';

class CheckLineController {
  final Uri _checkline = Uri.parse(ConstString.baseurl + ConstString.checkline);
  CheckLineDetailsModel checkLineDetailsModel = CheckLineDetailsModel();
  final controller = Get.put(GetSettingController());

  getdata(String id, String number, String contryname, BuildContext context,
      String contrycode) async {
    final prefs = await SharedPreferences.getInstance();

    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "${prefs.getString("userToken")}"
    };
    Map<String, dynamic> body = {
      'mobileNo': number,
      "countryCode": int.parse((contrycode.replaceAll("+", "")).toString()),};
    try {
      final response =
          await http.post(_checkline, headers: headers, body: jsonEncode(body));

      var data = jsonDecode(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        checkLineDetailsModel = CheckLineDetailsModel.fromJson(data);
        Get.to(() => CheckYourTurnResult(
              contryname: contryname,
              phone: number,
              checkLineDetailsModel: checkLineDetailsModel,
            ))?.then((value) {
          controller.getsetting();
        });
        return checkLineDetailsModel;
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: response.statusCode.toString(),
            message: data["message"],
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      Get.showSnackbar(
        GetSnackBar(
          title: "Failed",
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

 getdataturn(String id, String number,BuildContext context,
      String contrycode) async {
    final prefs = await SharedPreferences.getInstance();

    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "${prefs.getString("userToken")}"
    };
    Map<String, dynamic> body = {
      'restid': "33",
      'mobileNo': number,
      "countryCode": int.parse((contrycode.replaceAll("+", "")).toString()),
    };
    print(body);
   // try {
      final response =
          await http.post(_checkline, headers: headers, body: jsonEncode(body));

      var data = jsonDecode(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        checkLineDetailsModel = CheckLineDetailsModel.fromJson(data);
        print("${checkLineDetailsModel.turn}"+"your tutn");
     
        return checkLineDetailsModel;
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: response.statusCode.toString(),
            message: data["message"],
            duration: const Duration(seconds: 3),
          ),
        );
    //  }
   // } catch (e) {
     // print(e.toString());
      // Get.showSnackbar(
      //   GetSnackBar(
      //     title: "Failed",
      //     message: e.toString(),
      //     duration: const Duration(seconds: 3),
      //   ),
      // );
   // }
  }
      }
}
