import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screen/select_area.dart';
import 'package:flutter_application_1/screen/select_party.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../controller/get_chairs.dart';
import '../controller/get_setting_controller.dart';
import '../model/addcustomer_details_model.dart';
import '../model/app_setting_model.dart';
import '../model/table_chairs.dart';
import '../utils/const/text_style.dart';
import '../utils/reuseable_step.dart';
import '../utils/reuseble_next_button.dart';
import '../utils/reuseble_not_selected_step.dart';
import 'home_basic.dart';

class SelectChair extends StatefulWidget {
  AddCustomerDetailsModel addCustomerDetailsModel;
  String ?area;
   SelectChair({required this.addCustomerDetailsModel,required this.area});

  @override
  State<SelectChair> createState() => _SelectChairState();
}

class _SelectChairState extends State<SelectChair> {
  AppSettingModel appSettingModel = AppSettingModel();
  final controller = Get.put(GetSettingController());
  VideoPlayerController? videoPlayerController;
  bool isloading = true;
  TabaleChairsModel tabaleChairsModel=TabaleChairsModel();
  int totalchairsinside=0;
  int totalchairsoutside=0;
  bool insidetablechairs=true;
  bool outsidetablechairs=true;
  getdata() async {
    isloading = true;
    tabaleChairsModel=await GetTableChairsController().gettable();
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
    if(tabaleChairsModel.listOfData?.isNotEmpty??false){
for(int i=0;i<tabaleChairsModel.listOfData!.length;i++){
   if("${tabaleChairsModel.listOfData?[i].position}"=="0"){
     totalchairsinside=(tabaleChairsModel.listOfData?[i].chares)!.toInt();
     insidetablechairs=tabaleChairsModel.listOfData?[i].isAvailable as bool;
   }
   else if("${tabaleChairsModel.listOfData?[i].position}"=="1"){
        totalchairsoutside=(tabaleChairsModel.listOfData?[i].chares)!.toInt();
        outsidetablechairs=tabaleChairsModel.listOfData?[i].isAvailable as bool;
   }

    }
    }
    
    isloading = false;
   setState(() {});
  }

  int selectindex = -1;
  int selectedCard = -1;
   bool check=true;
  sumbit() {
    print("selectcard"+selectedCard.toString());
    if(selectedCard==-1){
      check=false;
        setState(() {
          
        });
    }
    else{
      check=true;
      setState(() {
        
      });
 Get.to(() => SelectParty(area: "${widget.area}",addCustomerDetailsModel: widget.addCustomerDetailsModel,chairs: (selectedCard+1).toString(),));
    }
   
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
                                                   check==false?  Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                        Text("Please select Chairs",style: TextStyle(fontSize: 15,color: Color(0xffEF5E82)),),
                                                        SizedBox(width: 5,),
                                                        Icon(Icons.error,color: Color(0xffEF5E82),),
                                                      ],):SizedBox.shrink(),
                                                      Expanded(
                                                        flex: 8,
                                                      child:isloading==false?widget.area=="Inside"?insidetablechairs? GridView.count(
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
                                                            widget.area=="Inside"?totalchairsinside: widget.area=="Outside"?totalchairsoutside:15,
                                                            (index) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    // ontap of each card, set the defined int to the grid view index
                                                                    selectedCard =
                                                                        index;
                                                                        check=true;
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
                                                                    (index +
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
                                                        ):Center(child: Text("Chairs Is Not Available In This Side",style: TextStyle(color: Colors.white),),):widget.area=="Outside"?outsidetablechairs? GridView.count(
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
                                                            widget.area=="Inside"?totalchairsinside: widget.area=="Outside"?totalchairsoutside:15,
                                                            (index) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    // ontap of each card, set the defined int to the grid view index
                                                                    selectedCard =
                                                                        index;
                                                                        check=true;
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
                                                                    (index +
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
                                                        ):Center(child: Text("Chairs Is Not Available In This Side",style: TextStyle(color: Colors.white),),): GridView.count(
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
                                                            widget.area=="Inside"?totalchairsinside: widget.area=="Outside"?totalchairsoutside:15,
                                                            (index) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    // ontap of each card, set the defined int to the grid view index
                                                                    selectedCard =
                                                                        index;
                                                                        check=true;
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
                                                                    (index +
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
                                                        ):Center(child: CircularProgressIndicator(),),
                                                        //  GridView.count(
                                                        //   padding: EdgeInsets
                                                        //       .symmetric(
                                                        //           horizontal:
                                                        //               20,
                                                        //           vertical: 20),
                                                        //   crossAxisCount: 5,
                                                        //   mainAxisSpacing: 20,
                                                        //   crossAxisSpacing: 10,
                                                        //   childAspectRatio: 1.5,
                                                        //   shrinkWrap: true,
                                                        //   children:
                                                        //       List.generate(
                                                        //     widget.area=="Inside"?totalchairsinside: widget.area=="Outside"?totalchairsoutside:15,
                                                        //     (index) {
                                                        //       return InkWell(
                                                        //         onTap: () {
                                                        //           setState(() {
                                                        //             // ontap of each card, set the defined int to the grid view index
                                                        //             selectedCard =
                                                        //                 index;
                                                        //                 check=true;
                                                        //           });
                                                        //         },
                                                        //         child:
                                                        //             Container(
                                                        //           decoration: BoxDecoration(
                                                        //               color: selectedCard ==
                                                        //                       index
                                                        //                   ? Color(
                                                        //                       0xffffffff)
                                                        //                   : Colors
                                                        //                       .transparent,
                                                        //               shape: BoxShape
                                                        //                   .circle),
                                                        //           child: Center(
                                                        //               child:
                                                        //                   Text(
                                                        //             (index +
                                                        //                         1)
                                                        //                     .toString(),
                                                        //             style: selectedCard ==
                                                        //                     index
                                                        //                 ? TextStyleConst
                                                        //                     .l40bstyleblue
                                                        //                 : TextStyleConst
                                                        //                     .l20bstylew,
                                                        //           )),
                                                        //         ),
                                                        //       );
                                                        //     },
                                                        //   ),
                                                        // ):Center(child: CircularProgressIndicator(),),
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
                                                          child:
                                                              ReuseableStep(
                                                                  text:
                                                                      "area".tr,
                                                                  index: "1"),
                                                        ),
                                                        Expanded(
                                                          child: ReuseableStep(
                                                              text: "chairs"
                                                                      .tr +
                                                                  " ${selectedCard + 1}",
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
                                        ),
                                          SizedBox(height: 38,)
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
