import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screen/select_sub_area.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../controller/get_setting_controller.dart';
import '../model/addcustomer_details_model.dart';
import '../model/app_setting_model.dart';
import '../utils/const/text_style.dart';
import '../utils/reuseable_step.dart';
import '../utils/reuseble_next_button.dart';
import '../utils/reuseble_not_selected_step.dart';
import 'home_basic.dart';

class SelectParty extends StatefulWidget {
   String area;
   String chairs;
  AddCustomerDetailsModel addCustomerDetailsModel;
   SelectParty({required this.area,required this.addCustomerDetailsModel,required this.chairs});

  @override
  State<SelectParty> createState() => _SelectPartyState();
}

class _SelectPartyState extends State<SelectParty> {
  int selectindex = -1;
  List list = [
    "Family",
    "Both",
    "Single",
  ];
  AppSettingModel appSettingModel = AppSettingModel();
  final controller = Get.put(GetSettingController());
  VideoPlayerController? videoPlayerController;
  bool isloading = true;
  bool check=true;
  getdata() async {
    isloading == true;
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
    isloading == false;
  //  setState(() {});
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
    if(selectindex==-1){
       check=false;
       setState(() {
         
       });
    }
    else{
       check=true;
       setState(() {
        
      });
Get.to(() => SelectSubArea(party: list[selectindex],addCustomerDetailsModel: widget.addCustomerDetailsModel,area: widget.area,chairs: widget.chairs));
    }
    
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
                                                    children: [
                                                      Spacer(),
                                                      Expanded(
                                                        child: Text(
                                                          "selectparty".tr,
                                                          style: TextStyleConst
                                                              .h20bstylew,
                                                        ),
                                                      ),
                                                       check==false?  Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                        Text("Please select Party",style: TextStyle(fontSize: 15,color: Color(0xffEF5E82)),),
                                                        SizedBox(width: 5,),
                                                        Icon(Icons.error,color: Color(0xffEF5E82),),
                                                      ],):SizedBox.shrink(),
                                                      Expanded(
                                                        flex: 8,
                                                        child: ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount: 3,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    selectindex =
                                                                        index;
                                                                        check=true;
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          18),
                                                                  margin: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          90,
                                                                      vertical:
                                                                          10),
                                                                  // width: 373.64,

                                                                  decoration: BoxDecoration(
                                                                      color: selectindex ==
                                                                              index
                                                                          ? Color(
                                                                              0xFFffffff)
                                                                          : Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50),
                                                                      border: Border.all(
                                                                          color: selectindex == index
                                                                              ? Color(0xFF111111)
                                                                              : Color(0xFFFFFFFF))),
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    list[index],
                                                                    style: TextStyle(
                                                                        color: selectindex ==
                                                                                index
                                                                            ? Color(
                                                                                0xff352073)
                                                                            : Colors
                                                                                .white,
                                                                        fontSize:
                                                                            15),
                                                                  )),
                                                                ),
                                                              );
                                                            }),
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
                                                              text:
                                                                  "chairs".tr +
                                                                      " ${widget.chairs}",
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
