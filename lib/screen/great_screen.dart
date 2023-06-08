import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screen/select_party.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controller/check_controller.dart';
import '../controller/check_line_controller.dart';
import '../controller/get_setting_controller.dart';
import '../model/addcustomer_details_model.dart';
import '../model/app_setting_model.dart';
import '../model/check_line_details.dart';
import '../utils/const/text_style.dart';
import '../utils/reuseable_step.dart';
import '../utils/reuseble_next_button.dart';
import '../utils/reuseble_not_selected_step.dart';
import 'home_basic.dart';

class GreatScreen extends StatefulWidget {

  AddCustomerDetailsModel addCustomerDetailsModel;
   GreatScreen({required this.addCustomerDetailsModel});

  @override
  State<GreatScreen> createState() => _GreatScreenState();
}

class _GreatScreenState extends State<GreatScreen> {
  bool isloading = true;
  AppSettingModel appSettingModel = AppSettingModel();
  final controller = Get.put(GetSettingController());
  VideoPlayerController? videoPlayerController;
  CheckLineDetailsModel checkLineDetailsModel=CheckLineDetailsModel();
  getdata() async {
    isloading = true;
checkLineDetailsModel = await CheckLineController().getdataturn("33",
 "${widget.addCustomerDetailsModel.clientdetails?.clientPhone}", context, "${widget.addCustomerDetailsModel.countrydetails?.countryCode}", );
    // appSettingModel = await controller.getsetting();
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
    isloading = false;
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body:isloading==false?
             GetBuilder<GetSettingController>(
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 250, vertical: 80),
                                  child: BlurryContainer(
                                    blur: 10,
                                    color: newcontroller.colormincontainer ==
                                            null
                                        ? Color(0xff352073)
                                        : newcontroller.colormincontainer.value
                                            .withOpacity(.5),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                Get.offAll(() => HomeBasic());
                                              },
                                              child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 30,
                                                  )),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              "greate".tr,
                                              style:
                                                  TextStyleConst.b50stylewbold,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 30, vertical: 20),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          19.0),
                                                  border: Border.all(
                                                      width: 1.0,
                                                      color: const Color(
                                                          0xfe6f6f6f)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(
                                                          0x27000000),
                                                      offset: Offset(0, 0),
                                                      blurRadius: 30,
                                                    ),
                                                  ],
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      newcontroller.color1
                                                                  .value ==
                                                              null
                                                          ? Color(0xFF7725CC)
                                                          : newcontroller
                                                              .color1.value,
                                                      newcontroller.color2
                                                                  .value ==
                                                              null
                                                          ? Color(0xFF31206D)
                                                          : newcontroller
                                                              .color2.value,
                                                    ],
                                                    begin: Alignment(0.0, -1.0),
                                                    end: Alignment(0.0, 1.0),
                                                  )),
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'yourturn'.tr,
                                                      style: TextStyleConst
                                                          .b20stylew,
                                                    ),
                                                    Text(
                                                      "${checkLineDetailsModel.turn}",
                                                      style: TextStyleConst
                                                          .b80stylew,
                                                    ),
                                                    Text(
                                                      'insidesmall'.tr,
                                                      style: TextStyleConst
                                                          .b20stylew,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
                }):Center(child: CircularProgressIndicator(),)
                )
                );
    ;
  }
}
