import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
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

class GetSettingController extends GetxController {
  AppSettingModel appSettingModel = AppSettingModel();
  var color1 = Color(0xff7325C6).obs;
  var color2 = Color(0xff352073).obs;
  var colormincontainer = Color(0xff352073).obs;
  var imageurl = "null".obs;
  var videourl = "null".obs;
  var type = "null".obs;
  var videoPlayerController;
  final Uri _getsetting =
      Uri.parse(ConstString.baseurl + ConstString.getsetting);

  getsetting() async {
    final prefs = await SharedPreferences.getInstance();

    final headers = {
      'Content-Type': 'application/json',
      "Authorization": "${prefs.getString("userToken")}"
    };

    try {
      final response = await http.get(
        _getsetting,
        headers: headers,
      );

      var data = jsonDecode(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        appSettingModel = AppSettingModel.fromJson(data);
       
        type.value=(appSettingModel.data?[0].type).toString();
        
         if(appSettingModel.data.toString()!="null"&&appSettingModel!=null&&appSettingModel.data!=[]&&appSettingModel.data?.length!=0){
          print("hhhjjfjfjfjkfkjfjk");
        String colorString =
            ((appSettingModel.data?[0].colorCode).toString() ?? "");
           

      //  Remove the square brackets and split the string
        if((appSettingModel.data?[0].colorCode).toString()!="null"&&type=="color"){
      
 List<String> colorStrings =
            colorString.replaceAll('[', '').replaceAll(']', '').split(', ');
 //print("${(colorStrings).toString()}"+"colorcodeliststring");
        // Convert the hexadecimal color values to Color objects
        List<Color> colors = colorStrings.map((str) {
          // Extract the hexadecimal value
          int value = int.parse(str.split('(')[1].split(')')[0].substring(2),
              radix: 16);
          return Color(value);
        }).toList();
         // print("${(colors).toString()}"+"colorcodelist");
        color1.value = colors[1];
        color2.value = colors[2];
        colormincontainer.value = colors[0];
        print(colors[2].toString()+"color");
        print(colors[0]);
        }
       
        imageurl.value =
            (appSettingModel.data?[0].imageId).toString() ?? "null";
        videourl.value =
            (appSettingModel.data?[0].videoId).toString() ?? "null";
        type.value = (appSettingModel.data?[0].type).toString() ?? "null";
        if (videourl != "null" && (appSettingModel.data?[0].type) == "video") {
          videoPlayerController = VideoPlayerController.network(
            videourl.value,
          );
          await videoPlayerController?.initialize().then((value) {
            videoPlayerController?.play();
            videoPlayerController?.setLooping(true);

          });
        }

        update();
        }

        return appSettingModel;
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

  dispose() {
    videoPlayerController.dispose();
    update();
  }

  void play() {}
}
