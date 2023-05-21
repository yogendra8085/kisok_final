import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/foodmenu_items_models.dart';
import '../utils/const/const_string.dart';

class FoodMenuControoler {
  final Uri _foodmenu = Uri.parse(ConstString.baseurl + ConstString.foodmenu);
  FoodMenuItemsModel foodMenuItemsModel = FoodMenuItemsModel();

  getdata(
      ) async {
    final prefs = await SharedPreferences.getInstance();

    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "${prefs.getString("userToken")}"
    };

    try {
      final response = await http.get(
        _foodmenu,
        headers: headers,
      );

      var data = jsonDecode(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        foodMenuItemsModel = FoodMenuItemsModel.fromJson(data);

        return foodMenuItemsModel;
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
}
