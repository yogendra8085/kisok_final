import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screen/select_area.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../controller/get_setting_controller.dart';
import '../model/app_setting_model.dart';
import '../utils/const/text_style.dart';
import '../utils/reuseable_step.dart';
import '../utils/reuseble_next_button.dart';
import '../utils/reuseble_not_selected_step.dart';
import 'home_basic.dart';

class SelectChair extends StatefulWidget {
  const SelectChair({super.key});

  @override
  State<SelectChair> createState() => _SelectChairState();
}

class _SelectChairState extends State<SelectChair> {
  AppSettingModel appSettingModel = AppSettingModel();
  final controller = Get.put(GetSettingController());
  VideoPlayerController? videoPlayerController;
  bool isloading = true;
  getdata() async {
    isloading = true;
    //appSettingModel = await controller.getsetting();
    // if (controller.videourl != "null") {
    //   videoPlayerController = VideoPlayerController.network(
    //     controller.videourl.value,
    //   );
    //   await videoPlayerController?.initialize().then((value) {
    //     videoPlayerController?.play();
    //     videoPlayerController?.setLooping(true);
    //   });
    // }
    isloading = false;
  //  setState(() {});
  }

  int selectindex = -1;
  int selectedCard = -1;

  sumbit() {
    Get.to(() => SelectArea());
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
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Spacer(),
                                                      Expanded(
                                                        child: Text(
                                                          "numberofchairs".tr,
                                                          style: TextStyleConst
                                                              .h20bstylew,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 8,
                                                        child: GridView.count(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 20),
                                                          crossAxisCount: 5,
                                                          mainAxisSpacing: 20,
                                                          crossAxisSpacing: 10,
                                                          childAspectRatio: 1.5,
                                                          shrinkWrap: true,
                                                          children:
                                                              List.generate(
                                                            15,
                                                            (index) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    // ontap of each card, set the defined int to the grid view index
                                                                    selectedCard =
                                                                        index;
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      color: selectedCard ==
                                                                              index
                                                                          ? Color(
                                                                              0xffffffff)
                                                                          : Colors
                                                                              .transparent,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    index ==
                                                                            15 -
                                                                                1
                                                                        ? ("${index + 1}+")
                                                                        : (index +
                                                                                1)
                                                                            .toString(),
                                                                    style: selectedCard ==
                                                                            index
                                                                        ? TextStyleConst
                                                                            .l40bstyleblue
                                                                        : TextStyleConst
                                                                            .l20bstylew,
                                                                  )),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
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
                                                              text: "chairs"
                                                                      .tr +
                                                                  " ${selectedCard + 1}",
                                                              index: "1"),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              ReuseableStepnotselected(
                                                                  text:
                                                                      "area".tr,
                                                                  index: "2"),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              ReuseableStepnotselected(
                                                                  text: "party"
                                                                      .tr,
                                                                  index: "3"),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              ReuseableStepnotselected(
                                                                  text:
                                                                      "seatedarea"
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
                                        )
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
