import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:http/http.dart' as http;
import '../model/login_model.dart';
import '../screen/home_basic.dart';
import '../utils/const/const_string.dart';

class LoginController {
  final Uri _loginURL =
      Uri.parse(ConstString.baseurl + ConstString.loginendpoint);
  LoginModel loginModel = LoginModel();

  loginuser(
      String name, String password, String id, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);
    _dialog.show(
      message: 'Loading...',
    );
    Map<String, dynamic> body = {
      'userName': name,
      'password': password,
      'branchId': int.parse(id).toInt()
    };
    final headers = {'Content-Type': 'application/json'};
    try {
      final response =
          await http.post(_loginURL, body: jsonEncode(body), headers: headers);

      var data = jsonDecode(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        loginModel = LoginModel.fromJson(data);
        prefs.setString("userToken", loginModel.acessToken.toString());
        _dialog.hide();
        Get.to(() => HomeBasic());
        Get.showSnackbar(
          GetSnackBar(
            title: "Success",
            message: "Login SucessFully!",
            duration: const Duration(seconds: 3),
          ),
        );
      } else {
        _dialog.hide();
        Get.showSnackbar(
          GetSnackBar(
            title: "Failed",
            message: "invalid username and password",
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
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
