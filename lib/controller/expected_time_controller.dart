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

class ExpectedTimeController {
  final Uri _expectedtime =
      Uri.parse(ConstString.baseurl + ConstString.expectedtime);
  ExpectedTimeModel expectedTimeModel = ExpectedTimeModel();

  getdata(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "${prefs.getString("userToken")}"
    };
    try {
      final response = await http.get(_expectedtime, headers: headers);

      var data = jsonDecode(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        expectedTimeModel = ExpectedTimeModel.fromJson(data);
        return expectedTimeModel;
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: expectedTimeModel.success.toString(),
            message: expectedTimeModel.message,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      // Get.showSnackbar(
      //   GetSnackBar(
      //     title: homeBasicModel.success.toString(),
      //     message: e.toString(),
      //     duration: const Duration(seconds: 3),
      //   ),
      // );
    }
  }
}
