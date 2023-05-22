import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../controller/get_setting_controller.dart';
import '../model/app_setting_model.dart';
import '../model/check_line_details.dart';
import '../utils/const/text_style.dart';
import '../utils/reuseable_check_button.dart';
import '../utils/reuseble_textfield.dart';

class CheckYourTurnResult extends StatefulWidget {
  CheckLineDetailsModel checkLineDetailsModel;
  String contryname;
  String phone;
  CheckYourTurnResult(
      {required this.checkLineDetailsModel,
      required this.contryname,
      required this.phone});

  @override
  State<CheckYourTurnResult> createState() => _CheckYourTurnResultState();
}

class _CheckYourTurnResultState extends State<CheckYourTurnResult> {
  TextEditingController phone = TextEditingController();
  AppSettingModel appSettingModel = AppSettingModel();
  final controller = Get.put(GetSettingController());
  VideoPlayerController? videoPlayerController;
  bool isloading = true;
  getdata() async {
    // isloading = true;
    // // appSettingModel = await controller.getsetting();
    // // if (controller.videourl != "null") {
    // //   videoPlayerController = VideoPlayerController.network(
    // //     controller.videourl.value,
    // //   );
    // //   await videoPlayerController?.initialize().then((value) {
    // //     videoPlayerController?.play();
    // //     videoPlayerController?.setLooping(true);
    // //   });
    // // }
    // isloading = false;
   // setState(() {});
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 139),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.close,
                                        color: Colors.transparent,
                                        size: 25,
                                      ),
                                      Text(
                                        "Check your turn",
                                        style: TextStyleConst.l34stylew,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // Expanded(
                                //   child: Text(
                                //     "Check your turn",
                                //     style: TextStyle(fontSize: 30, color: Colors.white),
                                //   ),
                                // ),
                                Expanded(
                                  flex: 10,
                                  child: BlurryContainer(
                                    blur: 14,
                                    color: newcontroller.colormincontainer ==
                                            null
                                        ? Color(0xff352073)
                                        : newcontroller.colormincontainer.value
                                            .withOpacity(.5),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5,
                                                            vertical: 8),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                          color:
                                                              Color(0x40ffffff),
                                                        )),
                                                    child: CountryCodePicker(
                                                      flagWidth: 80,
                                                      enabled: false,

                                                      initialSelection:
                                                          widget.contryname,
                                                      favorite: ['+965', 'KW'],

                                                      showCountryOnly: false,
                                                      // optional. Shows only country name and flag when popup is closed.
                                                      showOnlyCountryWhenClosed:
                                                          false,
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                      // optional. aligns the flag and the Text left
                                                      alignLeft: false,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  flex: 7,
                                                  child: ReuseableTextfield(
                                                    hinttext: "${widget.phone}",
                                                    controller: phone,
                                                    read: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(19),
                                                border: Border.all(
                                                    width: 2.0,
                                                    color: const Color(
                                                        0x40ffffff)),
                                              ),
                                              child: Center(
                                                child:
                                                    "${widget.checkLineDetailsModel.turn}" ==
                                                            "0"
                                                        ? Text(
                                                            "youarenotinlineyet"
                                                                .tr,
                                                            style:
                                                                TextStyleConst
                                                                    .l25stylew,
                                                          )
                                                        : Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                                Text(
                                                                  'yourturn'.tr,
                                                                  style: TextStyleConst
                                                                      .l20stylew,
                                                                ),
                                                                Text(
                                                                  "${widget.checkLineDetailsModel.turn}",
                                                                  style: TextStyleConst
                                                                      .l130stylew,
                                                                ),
                                                                Text(
                                                                  'insidesmall'
                                                                      .tr,
                                                                  style: TextStyleConst
                                                                      .l20stylew,
                                                                )
                                                              ]),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'pleasedownload'.tr,
                                    style: TextStyleConst.l20stylew,
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                })));
  }
}
