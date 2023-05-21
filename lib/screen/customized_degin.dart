import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../controller/app_setting.dart';
import '../controller/get_setting_controller.dart';
import '../utils/reuseable_color_button.dart';
import '../utils/reuseable_sidebar.dart';

class CustomizedDegin extends StatefulWidget {
  const CustomizedDegin({super.key});

  @override
  State<CustomizedDegin> createState() => _CustomizedDeginState();
}

class _CustomizedDeginState extends State<CustomizedDegin> {
  Color color1 = Color(0xff7325C6);
  Color color2 = Color(0xff352073);
  Color colormincontainer = Color(0xff352073);
  List<AssetEntity>? assets;
  File? image;
  VideoPlayerController? _controller;

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  Future<void> linearsumbit(Color linearfirst, Color linearsecond) async {
    final prefs = await SharedPreferences.getInstance();
    color1 = linearfirst;
    color2 = linearsecond;

    setState(() {});
  }

  Future<void> singal(Color singalcolor) async {
    colormincontainer = singalcolor;
    final prefs = await SharedPreferences.getInstance();

    print("jdas");
    setState(() {});
  }

  final controller = Get.put(GetSettingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xffE0E0E0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0xff4A4848),
                          size: 30,
                        ),
                        Text(
                          "BACK",
                          style:
                              TextStyle(fontSize: 24, color: Color(0xff4A4848)),
                        ),
                      ],
                    ),
                  ),
                  Text("SETTING",
                      style: TextStyle(fontSize: 24, color: Color(0xff4A4848))),
                  InkWell(
                    onTap: () async {
                      List<String> colorlist = [
                        colormincontainer.toString(),
                        color1.toString(),
                        color2.toString()
                      ];
                      print("hello");

                      // print(colorlist);
                      await AppSettingController().updatesetting(
                          colorlist as List<dynamic>,
                          (image?.path).toString() ?? "",
                          (assets?[0].type).toString() == "AssetType.image"
                              ? "image"
                              : (assets?[0].type).toString() ==
                                      "AssetType.video"
                                  ? "video"
                                  : "color",
                          context);
                      controller.videoPlayerController.dispose();
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff4A4848),
                      size: 30,
                    ),
                  ),
                  // Text("SETTING",
                  //     style:
                  //         TextStyle(fontSize: 24, color: Colors.transparent)),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                    color: Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(35)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                assets = await AssetPicker.pickAssets(
                                  context,
                                  pickerConfig: const AssetPickerConfig(
                                      requestType: RequestType.all),
                                );
                                image = await assets?[0].file;
                                _controller = VideoPlayerController.file(
                                    File((image?.path).toString()))
                                  ..initialize().then((_) {
                                    // Once the video has been loaded we play the video and set looping to true.
                                    _controller?.play();
                                    _controller?.setLooping(true);
                                    // Ensure the first frame is shown after the video is initialized.
                                    setState(() {});
                                  });
                                setState(() {});
                                print(assets?[0].file);
                                print(assets?[0].type);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(19),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x29000000),
                                      offset: Offset(0, 10),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: Center(
                                    child: Text(
                                  "Upload video or picture",
                                  style: TextStyle(
                                      color: Color(0xff9B9B9B), fontSize: 16),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 3,
                            child: image == null
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 25),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(19),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0x29000000),
                                          offset: Offset(0, 10),
                                          blurRadius: 20,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                            "assets/images/placeholeder.png")),
                                  )
                                : assets?[0].type == AssetType.image
                                    ? Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xffFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: FileImage(File(
                                                    (image?.path).toString())),
                                                fit: BoxFit.cover)),
                                      )
                                    : Container(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: VideoPlayer(_controller!)),
                                      ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(19),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 10),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                              child: Center(
                                  child: Text(
                                "Food menu ",
                                style: TextStyle(
                                    color: Color(0xff9B9B9B), fontSize: 16),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: image == null
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                gradient: new LinearGradient(
                                  colors: [
                                    color1,
                                    color2,
                                  ],
                                ))
                            : BoxDecoration(
                                // gradient: LinearGradient(
                                //     colors: [Color(color1), Color(color2)]),

                                image: DecorationImage(
                                  image:
                                      FileImage(File((image?.path).toString())),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                        child: Stack(
                          children: [
                            image != null
                                ? assets![0].type == AssetType.video
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: VideoPlayer(_controller!),
                                      )
                                    : Container()
                                : Container(),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: BlurryContainer(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(14),
                                          bottomLeft: Radius.circular(14)),
                                      blur: 10,
                                      color: colormincontainer.withOpacity(.4),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 15,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              border: Border.all(
                                                  color: Colors.white),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "العربية",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            "RESTAURANTS NAME",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Waiting list",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white),
                                          ),
                                          Spacer(),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                gradient: LinearGradient(
                                                  begin: Alignment(-1.0, -1.0),
                                                  end: Alignment(0.937, 1.0),
                                                  colors: [color1, color2],
                                                  stops: [0.0, 1.0],
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        const Color(0x8b000000),
                                                    offset: Offset(0, 20),
                                                    blurRadius: 30,
                                                  ),
                                                ]),
                                            child: Center(
                                                child: Text(
                                              "Get in line",
                                              style: TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 10),
                                            )),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color: Colors.white),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        const Color(0x8b000000),
                                                    offset: Offset(0, 20),
                                                    blurRadius: 30,
                                                  ),
                                                ]),
                                            child: Center(
                                                child: Text(
                                              "Check your turn",
                                              style: TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 10),
                                            )),
                                          ),
                                          Spacer(
                                            flex: 2,
                                          ),
                                          Image.asset(
                                              "assets/images/requeue_icon.png")
                                        ],
                                      )),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Container(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ReuseablecolorButton(
                              singal: Color(0xff352073),
                              linearfirst: Color(0xff7325C6),
                              linearsecond: Color(0xff352073),
                              lenearsumbit: linearsumbit,
                              singalsumbit: singal,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ReuseablecolorButton(
                              singal: Color(0xff670B0B),
                              linearfirst: Color(0xffD63838),
                              linearsecond: Color(0xff650A0A),
                              lenearsumbit: linearsumbit,
                              singalsumbit: singal,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ReuseablecolorButton(
                              singal: Color(0xff141414),
                              linearfirst: Color(0xff4D4D4D),
                              linearsecond: Color(0xff101010),
                              lenearsumbit: linearsumbit,
                              singalsumbit: singal,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ReuseablecolorButton(
                              singal: Color(0xffA71C69),
                              linearfirst: Color(0xffF87E9C),
                              linearsecond: Color(0xffA01465),
                              lenearsumbit: linearsumbit,
                              singalsumbit: singal,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ReuseablecolorButton(
                              singal: Color(0xff872A0F),
                              linearfirst: Color(0xffE6AA6D),
                              linearsecond: Color(0xff862900),
                              lenearsumbit: linearsumbit,
                              singalsumbit: singal,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ReuseablecolorButton(
                              singal: Color(0xff065313),
                              linearfirst: Color(0xff25C694),
                              linearsecond: Color(0xff065212),
                              lenearsumbit: linearsumbit,
                              singalsumbit: singal,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ReuseablecolorButton(
                              singal: Color(0xff132572),
                              linearfirst: Color(0xff257CC6),
                              linearsecond: Color(0xff12216E),
                              lenearsumbit: linearsumbit,
                              singalsumbit: singal,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ReuseablecolorButton(
                              singal: Color(0xffA3A3A3),
                              linearfirst: Color(0xffFFFFFF),
                              linearsecond: Color(0xffA2A2A2),
                              lenearsumbit: linearsumbit,
                              singalsumbit: singal,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
