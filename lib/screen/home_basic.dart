import 'dart:io';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../controller/app_setting.dart';
import '../controller/expected_time_controller.dart';
import '../controller/get_setting_controller.dart';
import '../controller/home_basic_controller.dart';
import '../model/app_setting_model.dart';
import '../model/expected_time_model.dart';
import '../model/homebasic_model.dart';

import '../utils/const/text_style.dart';
import '../utils/reuseable_sidebar.dart';
import '../utils/reuseble_button.dart';
import '../utils/reuseble_home_items.dart';

class HomeBasic extends StatefulWidget {
  const HomeBasic({super.key});

  @override
  State<HomeBasic> createState() => _HomeBasicState();
}

class _HomeBasicState extends State<HomeBasic> {
  HomeBasicModel homeBasicModel = HomeBasicModel();
  ExpectedTimeModel expectedTimeModel = ExpectedTimeModel();
  bool isloding = true;

  AppSettingModel appSettingModel = AppSettingModel();
  final controller = Get.put(GetSettingController());
  VideoPlayerController? videoPlayerController;

  getdata() async {
    isloding = true;
    homeBasicModel = await HomeBasicController().getdata(context);
    expectedTimeModel = await ExpectedTimeController().getdata(context);
    appSettingModel = await controller.getsetting();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("branchEn", (homeBasicModel.data?.branchNameEn).toString());
    prefs.setString("branchAr", (homeBasicModel.data?.branchNameAr).toString());
    // if (controller.videourl != "null") {
    //   videoPlayerController = VideoPlayerController.network(
    //     controller.videourl.value,
    //   );
    //   await videoPlayerController?.initialize().then((value) {
    //     videoPlayerController?.play();
    //     videoPlayerController?.setLooping(true);
    //   });
    // }

    print(controller.color1.value);

    isloding = false;
    setState(() {});
  }

  timetostring(dynamic min, dynamic personcont) {
    dynamic data = min * personcont;
    return data.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
   //controller. videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: isloding == false
              ? GetBuilder<GetSettingController>(
                  init: GetSettingController(),
                  builder: (newcontroller) {
                    return Container(
                        decoration: newcontroller.imageurl.value == "" ||
                                newcontroller.imageurl.value == "null" ||
                                newcontroller.type.value == "color"
                            ? BoxDecoration(
                                gradient: new RadialGradient(
                                colors: [
                                  newcontroller.color1.value == null
                                      ? Color(0xFF7725CC)
                                      : newcontroller.color1.value,
                                  newcontroller.color2.value == null
                                      ? Color(0xFF31206D)
                                      : newcontroller.color2.value,
                                ],
                              ))
                            : BoxDecoration(
                                // gradient: LinearGradient(
                                //     colors: [Color(color1), Color(color2)]),

                                image: DecorationImage(
                                  image: NetworkImage(
                                      (newcontroller.imageurl.value)
                                          .toString()),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                        child: Stack(
                          children: [
                            newcontroller.videourl.value != "null"
                                ? newcontroller.type.value == "video"
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child:
                                            VideoPlayer(newcontroller.videoPlayerController),
                                      )
                                    : Container()
                                : Container(),
                            Center(
                                child: Row(
                              children: [
                                Expanded(flex: 3, child: Reuseablesidebar()),
                                Expanded(
                                    flex: 7,
                                    child: (homeBasicModel.data?.insideActive)
                                                    as bool ==
                                                true &&
                                            (homeBasicModel.data?.outsideActive)
                                                    as bool ==
                                                true
                                        ? Center(
                                            child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Sorry !",
                                                style: TextStyleConst.b55stylew,
                                              ),
                                              Text(
                                                " Restaurant is FULL now",
                                                style: TextStyleConst.b44stylew,
                                              ),
                                            ],
                                          ))
                                        : Row(
                                            children: [
                                              SizedBox(
                                                width: 50,
                                              ),
                                              (homeBasicModel.data
                                                      ?.insideActive) as bool
                                                  ? SizedBox.shrink()
                                                  : Expanded(
                                                      child: HomeItems(
                                                      title: "inside".tr,
                                                      personcount:
                                                          (homeBasicModel.data
                                                                      ?.inside)
                                                                  .toString() ??
                                                              "0",
                                                      expectedtime: timetostring(
                                                          expectedTimeModel
                                                                  .insideTime
                                                                  ?.minutes ??
                                                              0,
                                                          homeBasicModel
                                                              .data?.inside),
                                                      full: homeBasicModel.data
                                                              ?.isInsideFull
                                                          as bool,
                                                    )),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              (homeBasicModel.data
                                                      ?.outsideActive) as bool
                                                  ? SizedBox.shrink()
                                                  : Expanded(
                                                      child: HomeItems(
                                                      title: "outside".tr,
                                                      personcount:
                                                          (homeBasicModel.data
                                                                      ?.outside)
                                                                  .toString() ??
                                                              "0",
                                                      expectedtime: timetostring(
                                                          expectedTimeModel
                                                                  .outsideTime
                                                                  ?.minutes ??
                                                              0,
                                                          homeBasicModel
                                                              .data?.outside),
                                                      full: homeBasicModel.data
                                                              ?.isOutsideFull
                                                          as bool,
                                                    )),
                                              SizedBox(
                                                width: 50,
                                              ),
                                            ],
                                          ))
                              ],
                            )),
                          ],
                        ));
                  })
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
