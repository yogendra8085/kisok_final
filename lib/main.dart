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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String savedLocale = prefs.getString('locale').toString();
  Locale initialLocale;
  
  if (savedLocale != "null") {
    List<String> localeParts = savedLocale.split('_');
    initialLocale = Locale(localeParts[0], localeParts[1]);
  } else {
    initialLocale = Locale('en', 'US');
  }
   runApp( MyApp(initialLocale: initialLocale,prefs: prefs,));
}

class MyApp extends StatefulWidget {
 final Locale initialLocale;
 SharedPreferences prefs;
  
  MyApp({required this.initialLocale,required this.prefs});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 

  

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale:widget.initialLocale=="null"?Locale('en','en_US'):widget.initialLocale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: widget.prefs?.getString("userToken").toString() != "null"
          ? HomeBasic()
          : LoginScreen(),
             builder: (context, child) {
            return MediaQuery(
              child: child!,
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            );
          },
    );
  }
}
