import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../controller/get_setting_controller.dart';
import '../model/app_setting_model.dart';
import '../utils/const/text_style.dart';
import '../utils/reuseable_sidebar.dart';

class FoodMenuDetails extends StatefulWidget {
  String price;
  String title;
  String description;
  String imageurl;
  FoodMenuDetails(
      {required this.description,
      required this.imageurl,
      required this.price,
      required this.title});

  @override
  State<FoodMenuDetails> createState() => _FoodMenuDetailsState();
}

class _FoodMenuDetailsState extends State<FoodMenuDetails> {
  bool isloading = true;
  AppSettingModel appSettingModel = AppSettingModel();
  final controller = Get.put(GetSettingController());
  VideoPlayerController? videoPlayerController;
  getdata() async {
    isloading = true;

    appSettingModel = await controller.getsetting();
    if (controller.videourl != "null") {
      videoPlayerController = VideoPlayerController.network(
        controller.videourl.value,
      );
      await videoPlayerController?.initialize().then((value) {
        videoPlayerController?.play();
        videoPlayerController?.setLooping(true);
      });
    }

    print(controller.color1.value);
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
                          Row(
                            children: [
                              Expanded(flex: 3, child: Reuseablesidebar()),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  flex: 7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_back_ios,
                                                color: Colors.white,
                                                size: 25,
                                              ),
                                              Text(
                                                "Back".tr,
                                                style: TextStyleConst.b24stylew,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 60, vertical: 30),
                                        child: BlurryContainer(
                                          blur: 10,
                                          color:
                                              newcontroller.colormincontainer ==
                                                      null
                                                  ? Color(0xff352073)
                                                  : newcontroller
                                                      .colormincontainer.value
                                                      .withOpacity(.5),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Column(
                                              children: [
                                                // widget.imageurl.isEmpty ||
                                                //         widget.imageurl.toString() == ""
                                                //     ?
                                                Expanded(
                                                  flex: 3,
                                                  child: Image.asset(
                                                    "assets/images/placeholeder.png",
                                                    scale: 3,
                                                  ),
                                                ),
                                                // : Image.network(widget.imageurl),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 8,
                                                          child: Text(
                                                            widget.title,
                                                            style:
                                                                TextStyleConst
                                                                    .h24mstylew,
                                                          )),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          widget.price,
                                                          style: TextStyleConst
                                                              .h24mstylew,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    widget.description,
                                                    style: TextStyleConst
                                                        .h20bstylew,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                    ],
                                  )),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ],
                      ));
                })));
    ;
  }
}
