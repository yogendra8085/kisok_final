import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter_application_1/utils/reuseble_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/app_setting.dart';
import '../controller/get_setting_controller.dart';
import '../controller/home_basic_controller.dart';
import '../model/app_setting_model.dart';
import '../model/homebasic_model.dart';
import '../screen/check_your_turn.dart';
import '../screen/customized_degin.dart';
import '../screen/foodmenu_itmes.dart';
import '../screen/get_line.dart';
import '../screen/login_screen.dart';
import '../screen/select_chair.dart';
import 'const/text_style.dart';

class Reuseablesidebar extends StatefulWidget {
  const Reuseablesidebar({super.key});

  @override
  State<Reuseablesidebar> createState() => _ReuseablesidebarState();
}

class _ReuseablesidebarState extends State<Reuseablesidebar> {
  List list = ["getline", "checkline", "foodmenu"];
  int index1 = -1;
  Color color1 = Color(0xff7325C6);
  Color color2 = Color(0xff352073);
  Color colormincontainer = Color(0xff352073);
  // convertcolor(String color) {
  //   String colorString = color.toString(); // Color(0x12345678)
  //   String valueString =
  //       colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
  //   int value = int.parse(valueString, radix: 16);
  //   Color otherColor = new Color(value);
  //   return otherColor;
  // }
  AppSettingModel appSettingModel = AppSettingModel();
  final controller = Get.put(GetSettingController());
  String? branchen;
  String? branchar;

  getcolor() async {
   // appSettingModel = await controller.getsetting();
    final prefs = await SharedPreferences.getInstance();
    branchen = prefs.getString("branchEn");
    branchar = prefs.getString("branchAr");
    setState(() {});
  }

  sumbit() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
  
    if (Get.locale.toString() == "en_US") {
      var locale = Locale('ar', 'KW');

      Get.updateLocale(locale);
      await prefs.setString('locale', locale.toString());
    } else {
      var locale = Locale('en', 'US');
      Get.updateLocale(locale);
      await prefs.setString('locale', locale.toString());
    }

    print(
      Get.locale,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getcolor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetSettingController>(
        init: GetSettingController(),
        builder: (newcontroller) {
          return BlurryContainer(
            borderRadius: BorderRadius.circular(0),
            blur: 24,
            color: newcontroller.colormincontainer == null
                ? Color(0xff352073)
                : newcontroller.colormincontainer.value.withOpacity(.5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                          flex: 8,
                          child: ReuseableButton(
                            sumbit: sumbit,
                          )),
                      Expanded(
                        flex:2 ,
                        child: InkWell(
                            onTap: () {
                              Get.to(() => CustomizedDegin())?.then((value) {});
                            },
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                       Expanded(
                        flex: 2,
                        child: InkWell(
                            onTap: () async {
                              final prefs = await SharedPreferences.getInstance();
                              prefs.clear();
                              Get.to(() => LoginScreen())?.then((value) {});
                            },
                            child: Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    Get.locale.toString() == "en_US"
                        ? branchen.toString()=="null"?"":branchen.toString()
                        : branchar.toString()=="null"?"":branchar.toString(),
                    style: TextStyleConst.h33bstylew,
                    maxLines: 1,
                  ),
                  Text(
                    "waitinglist".tr,
                    style: TextStyleConst.h29stylew,
                  ),
                  Spacer(),
                  for (int i = 0; i < list.length; i++) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: InkWell(
                        onTap: () {
                          index1 = i;
                          if ((list[i]).toString().tr == "checkline".tr) {
                            Get.to(() => CheckYourTurn());
                          } else if ((list[i]).toString().tr == "getline".tr) {
                            Get.to(() => Getline());
                          } else if ((list[i]).toString().tr == "foodmenu".tr) {
                            Get.to(() => FoodMenuItmes());
                          }

                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: index1 != i
                                      ? Colors.white
                                      : Colors.transparent),
                              boxShadow: index1 != i
                                  ? [
                                      BoxShadow(
                                        color:
                                            Colors.transparent.withOpacity(.0),
                                        offset: Offset(0, 0),
                                        blurRadius: 0,
                                      ),
                                    ]
                                  : [
                                      BoxShadow(
                                        color: const Color(0xff000000)
                                            .withOpacity(.5),
                                        offset: Offset(0, 20),
                                        blurRadius: 30,
                                      ),
                                    ],
                              gradient: index1 != i
                                  ? LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Colors.transparent,
                                      ],
                                    )
                                  : LinearGradient(
                                      colors: [
                                        // Color(0xFF7325C6),
                                        // Color(0xFF352073),
                                        newcontroller.color1.value == null
                                            ? Color(0xFF7325C6)
                                            : newcontroller.color1.value,
                                        newcontroller.color2.value == null
                                            ? Color(0xFF352073)
                                            : newcontroller.color2.value
                                      ],
                                    )),
                          child: Center(
                            child: Text(
                              (list[i]).toString().tr,
                              style: TextStyleConst.h24mstylew,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  Spacer(),
                  Image.asset("assets/images/requeue_icon.png")
                ],
              ),
            ),
          );
        });
  }
}
