import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/get_line.dart';
import 'package:flutter_application_1/screen/home_basic.dart';
import 'package:flutter_application_1/screen/login_screen.dart';
import 'package:flutter_application_1/screen/select_area.dart';
import 'package:flutter_application_1/screen/select_party.dart';
import 'package:flutter_application_1/screen/select_sub_area.dart';
import 'package:flutter_application_1/utils/const/languge_change.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  SharedPreferences? sharedPreferences;
  // final prefs = await SharedPreferences.getInstance();
  getdata() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: Locale('en', 'US'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: sharedPreferences?.getString("userToken").toString() != "null"
          ? HomeBasic()
          : LoginScreen(),
    );
  }
}
