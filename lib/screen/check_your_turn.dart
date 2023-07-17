import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../controller/check_line_controller.dart';
import '../controller/get_setting_controller.dart';
import '../model/app_setting_model.dart';
import '../model/check_line_details.dart';
import '../utils/const/text_style.dart';
import '../utils/reuseable_check_button.dart';
import '../utils/reuseble_textfield.dart';

class CheckYourTurn extends StatefulWidget {
  const CheckYourTurn({super.key});

  @override
  State<CheckYourTurn> createState() => _CheckYourTurnState();
}

class _CheckYourTurnState extends State<CheckYourTurn> {
  TextEditingController phone = TextEditingController();
  CheckLineDetailsModel checkLineDetailsModel = CheckLineDetailsModel();
  String countryname = "KW";
  String? contrycode="+965";
  AppSettingModel appSettingModel = AppSettingModel();
  final controller = Get.put(GetSettingController());
  VideoPlayerController? videoPlayerController;
  bool isloading = true;
  getdata() async {
    isloading = true;
   // appSettingModel = await controller.getsetting();
   //  if (controller.videourl != "null") {
   //    videoPlayerController = VideoPlayerController.network(
   //      controller.videourl.value,
   //    );
   //    await videoPlayerController?.initialize().then((value) {
   //      videoPlayerController?.play();
   //      videoPlayerController?.setLooping(true);
   //    });
   //  }
    isloading = false;
   // setState(() {});
  }

  sumbit() async {
    if (phone.text.isEmpty) {
      Get.showSnackbar(
        GetSnackBar(
          title: "Failed",
          message: "Please Fill Phone Number",
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      checkLineDetailsModel = await CheckLineController().getdata(
          "33", phone.text, countryname, context, contrycode.toString());
    }

    print(checkLineDetailsModel);
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
            resizeToAvoidBottomInset: false,
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
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
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
                                Expanded(
                                  child: Text(
                                    "checkyouturn".tr,
                                    style: TextStyleConst.l34stylew,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: BlurryContainer(
                                      blur: 14,
                                      color: newcontroller.colormincontainer ==
                                              null
                                          ? Color(0xff352073)
                                          : newcontroller
                                              .colormincontainer.value
                                              .withOpacity(.5),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 29, vertical: 10),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    height: 90,
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
                                                    child: Center(
                                                      child: CountryCodePicker(
                                                        flagWidth: 80,
                                                        onChanged: (value) {
                                                          countryname = value
                                                              .code
                                                              .toString();
                                                          contrycode =
                                                              value.dialCode;
                                                          setState(() {});
                                                        },
                                                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                                        initialSelection: 'KW',
                                                        favorite: [
                                                          '+965',
                                                          'KW'
                                                        ],
                                                        // optional. Shows only country name and flag
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
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  flex: 7,
                                                  child: Container(
                                                    height: 90,
                                                    child: ReuseableTextfield(
                                                      hinttext: "99933378",
                                                      controller: phone,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 139),
                                              child: ReusealeCheckButton(
                                                  sumbit: sumbit),
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                                Spacer(),
                                Expanded(
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
