import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screen/select_area.dart';
import 'package:flutter_application_1/utils/reuseble_textfield.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../controller/get_setting_controller.dart';
import '../model/app_setting_model.dart';
import '../utils/const/text_style.dart';
import '../utils/reuseable_step.dart';
import '../utils/reuseable_textfield1.dart';
import '../utils/reuseble_next_button.dart';
import '../utils/reuseble_not_selected_step.dart';
import 'great_screen.dart';
import 'home_basic.dart';

class Getline extends StatefulWidget {
  const Getline({super.key});

  @override
  State<Getline> createState() => _GetlineState();
}

class _GetlineState extends State<Getline> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  String gender = "male";
  AppSettingModel appSettingModel = AppSettingModel();
  final controller = Get.put(GetSettingController());
  VideoPlayerController? videoPlayerController;
  bool isloading = true;
  getdata() async {
    isloading = true;
    // appSettingModel = await controller.getsetting();
    if (controller.videourl != "null") {
      videoPlayerController = VideoPlayerController.network(
        controller.videourl.value,
      );
      await videoPlayerController?.initialize().then((value) {
        videoPlayerController?.play();
        videoPlayerController?.setLooping(true);
      });
    }
    isloading = false;
    setState(() {});
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
    videoPlayerController?.dispose();
    super.dispose();
  }

  sumbit() {
    Get.to(() => GreatScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: GetBuilder<GetSettingController>(
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
                                    (newcontroller.imageurl.value).toString()),
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
                                      child: VideoPlayer(
                                          newcontroller.videoPlayerController),
                                    )
                                  : Container()
                              : Container(),
                          Column(
                            children: [
                              Expanded(
                                flex: 10,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 50),
                                  child: BlurryContainer(
                                    blur: 10,
                                    color: newcontroller.colormincontainer ==
                                            null
                                        ? Color(0xff352073)
                                        : newcontroller.colormincontainer.value
                                            .withOpacity(.5),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .arrow_back_ios_sharp,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5),
                                                      child: Text(
                                                        "back".tr,
                                                        style: TextStyleConst
                                                            .b24stylew,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.offAll(() => HomeBasic());
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                flex: 8,
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  decoration: BoxDecoration(
                                                      gradient:
                                                          new LinearGradient(
                                                        colors: [
                                                          newcontroller.color1
                                                                      .value ==
                                                                  null
                                                              ? Color(
                                                                  0xFF7725CC)
                                                              : newcontroller
                                                                  .color1.value,
                                                          newcontroller.color2
                                                                      .value ==
                                                                  null
                                                              ? Color(
                                                                  0xFF31206D)
                                                              : newcontroller
                                                                  .color2.value,
                                                        ],
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 18),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          "customerdetails".tr,
                                                          style: TextStyleConst
                                                              .h20bstylew,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            5,
                                                                        vertical:
                                                                            3),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                12),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Color(0x40ffffff),
                                                                        )),
                                                                child:
                                                                    CountryCodePicker(
                                                                  flagWidth: 80,
                                                                  onChanged:
                                                                      (value) {
                                                                    // countryname =
                                                                    //     value.code.toString();
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                                                  initialSelection:
                                                                      'KW',
                                                                  favorite: [
                                                                    '+965',
                                                                    'KW'
                                                                  ],
                                                                  // optional. Shows only country name and flag
                                                                  showCountryOnly:
                                                                      false,
                                                                  // optional. Shows only country name and flag when popup is closed.
                                                                  showOnlyCountryWhenClosed:
                                                                      false,
                                                                  textStyle: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20),
                                                                  // optional. aligns the flag and the Text left
                                                                  alignLeft:
                                                                      false,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Expanded(
                                                              flex: 8,
                                                              child:
                                                                  ReuseableTextfield1(
                                                                hinttext:
                                                                    "phone".tr,
                                                                controller:
                                                                    phone,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        ReuseableTextfield1(
                                                            hinttext:
                                                                "typeyourname"
                                                                    .tr,
                                                            controller: name),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                children: [
                                                                  Radio(
                                                                    value:
                                                                        'male',
                                                                    groupValue:
                                                                        gender,
                                                                    activeColor:
                                                                        Colors
                                                                            .white,
                                                                    onChanged:
                                                                        ((value) {
                                                                      setState(
                                                                          () {});
                                                                      gender = value
                                                                          .toString();
                                                                    }),
                                                                  ),
                                                                  Text(
                                                                    "male".tr,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Row(
                                                                children: [
                                                                  Radio(
                                                                    value:
                                                                        'female',
                                                                    groupValue:
                                                                        gender,
                                                                    activeColor:
                                                                        Colors
                                                                            .white,
                                                                    onChanged:
                                                                        ((value) {
                                                                      setState(
                                                                          () {});
                                                                      gender = value
                                                                          .toString();
                                                                    }),
                                                                  ),
                                                                  Text(
                                                                    "female".tr,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            20),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 20),
                                                    decoration: BoxDecoration(
                                                        gradient:
                                                            new LinearGradient(
                                                          colors: [
                                                            newcontroller.color1
                                                                        .value ==
                                                                    null
                                                                ? Color(
                                                                    0xFF7725CC)
                                                                : newcontroller
                                                                    .color1
                                                                    .value,
                                                            newcontroller.color2
                                                                        .value ==
                                                                    null
                                                                ? Color(
                                                                    0xFF31206D)
                                                                : newcontroller
                                                                    .color2
                                                                    .value,
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Spacer(),
                                                        Expanded(
                                                          child: ReuseableStep(
                                                              text:
                                                                  "chairs".tr +
                                                                      " ${5}",
                                                              index: "1"),
                                                        ),
                                                        Expanded(
                                                          child: ReuseableStep(
                                                              text: "area".tr,
                                                              index: "2"),
                                                        ),
                                                        Expanded(
                                                          child: ReuseableStep(
                                                              text: "party".tr,
                                                              index: "2"),
                                                        ),
                                                        Expanded(
                                                          child: ReuseableStep(
                                                              text: "seatedarea"
                                                                  .tr,
                                                              index: "4"),
                                                        ),
                                                        Spacer(),
                                                        ReuseablenextButton(
                                                          sumbit: sumbit,
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: TextStyleConst.text),
                            ],
                          ),
                        ],
                      ));
                })));
    ;
  }
}
