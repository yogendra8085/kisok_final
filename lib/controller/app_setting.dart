import 'package:shared_preferences/shared_preferences.dart';

import '../model/app_setting_model.dart';
import '../screen/home_basic.dart';
import '../utils/const/const_string.dart';
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

class AppSettingController extends GetxController {
  final Uri _updatedsetting =
      Uri.parse(ConstString.baseurl + ConstString.setting);

  updatesetting(
      List colorlist, String image, String type, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);
    _dialog.show(
      message: 'Loading...',
    );

    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      "Authorization": "${prefs.getString("userToken")}"
    };

    Map<String, String> body = {
      "colorCode": colorlist.toString(),
      "type": type ?? "color"
    };
    final request = http.MultipartRequest('POST', _updatedsetting);
    request.headers.addAll(headers);
    request.fields.addAll(body);
    // if (colorlist == null || colorlist.isEmpty) {
    // } else {
    //   request.fields.addAll(body);
    // }

    print("type" + type);
    print(colorlist);
    if (image.isEmpty || image == "" || image == null) {
    } else if (type == "AssetType.image") {
      request.files
          .add(await http.MultipartFile.fromPath('image', (image).toString()));
    } else if (type == "AssetType.video") {
      request.files
          .add(await http.MultipartFile.fromPath('video', (image).toString()));
    }

    final response = await request.send();
    print(response.statusCode);
    print(body);
    print(image);
    if (response.statusCode == 200) {
      _dialog.hide();
      print('Image uploaded successfully!');
      Get.to(() => HomeBasic());

      Get.showSnackbar(
        GetSnackBar(
          title: "Success",
          message: "update successfully",
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      print('Failed to upload image. Error code: ${response.statusCode}');
      _dialog.hide();
      Get.showSnackbar(
        GetSnackBar(
          title: "${response.statusCode}",
          message: "update Failed ",
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
