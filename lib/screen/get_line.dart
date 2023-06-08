import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screen/select_area.dart';
import 'package:flutter_application_1/screen/select_chair.dart';
import 'package:flutter_application_1/utils/reuseble_textfield.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../controller/check_controller.dart';
import '../controller/get_setting_controller.dart';
import '../model/addcustomer_details_model.dart';
import '../model/app_setting_model.dart';
import '../model/get_data_model.dart';
import '../utils/const/text_style.dart';
import '../utils/reuseable_getline_button.dart';
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
  TextEditingController ?name;
  TextEditingController phone = TextEditingController();
  String ?gender="other";
  String? countrycode="+965";
  AppSettingModel appSettingModel = AppSettingModel();
  final controller = Get.put(GetSettingController());
  VideoPlayerController? videoPlayerController;
  bool isloading = true;
  GetDataModel getDataModel=GetDataModel();
  getdata() async {
    isloading = true;
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
    isloading = false;
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
   AddCustomerDetailsModel addCustomerDetailsModel=AddCustomerDetailsModel();
  sumbit() async {
    print(gender!+"gender");
    if(phone.text.isEmpty||(name?.text).toString()==""||(gender).toString()=="other"||(name?.text).toString().isEmpty){
             Get.showSnackbar(
          GetSnackBar(
            title: "Failed",
            message:"All Field Is Required" ,
            duration: const Duration(seconds: 3),
          ),
        );
    }
    else{
 addCustomerDetailsModel= await  CheckController().adddata(countrycode.toString(), phone.text, (name?.text).toString(),gender=="male"?"0":"1");
   setState(() {
     
   });
    }
  
   
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
                                                            // Expanded(
                                                            //   flex: 3,
                                                            //   child: Container(
                                                            //     padding: EdgeInsets
                                                            //         .symmetric(
                                                            //             horizontal:
                                                            //                 5,
                                                            //             vertical:
                                                            //                 3),
                                                            //     decoration:
                                                            //         BoxDecoration(
                                                            //             borderRadius:
                                                            //                 BorderRadius.circular(
                                                            //                     12),
                                                            //             border:
                                                            //                 Border.all(
                                                            //               color:
                                                            //                   Color(0x40ffffff),
                                                            //             )),
                                                            //     child:

                                                            //   ),
                                                            // ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Expanded(
                                                              flex: 8,
                                                              child: TextField(
                                                                onChanged: (value) async {
                                                                  if(value.length>3){
                                                                    print("call api");
                                                                  
                                                                getDataModel= await CheckController().getdata(countrycode!, value);
                                                                name=TextEditingController(text:"${getDataModel.listOfData?.clientName ?? ''}",
                                                               
                                                               
                                                                );
                                                                  
                                                                
                                                                  }
                                                                  setState(() {
                                                                  
                                                                });
                                                                 print(getDataModel.listOfData);
                                                                },
                                                                keyboardType:
                                                                    TextInputType
                                                                        .phone,
                                                                readOnly: false,
                                                                controller:
                                                                    phone,
                                                                style: TextStyleConst
                                                                    .h20bstylew,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                decoration: InputDecoration(
                                                                    hintText: "phone".tr,
                                                                    hintStyle: TextStyleConst.h20bstylew,
                                                                    prefixIcon: CountryCodePicker(
                                                                      flagWidth:
                                                                          80,
                                                                      onChanged:
                                                                          (value) {
                                                                        countrycode =
                                                                            value.dialCode.toString();
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
                                                                    enabledBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(12),
                                                                        borderSide: BorderSide(
                                                                          color:
                                                                              const Color(0x40ffffff),
                                                                        )),
                                                                    focusedBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: const Color(0x40ffffff)),
                                                                    )),
                                                              ),
                                                              //     ReuseableTextfield1(
                                                              //   hinttext:
                                                              //       "phone".tr,
                                                              //   controller:
                                                              //       phone,
                                                              // ),
                                                            ),
                                                          ],
                                                        ),
                                                        ReuseableTextfield1(
                                                            hinttext:
                                                                "typeyourname"
                                                                    .tr,
                                                            controller: name??TextEditingController()),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                children: [
                                                                  Radio(
                                                                    value:"male",
                                                                    
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
                                                                  "female",
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
                                                          child: ReuseableStepnotselected(
                                                              text: "area".tr,
                                                              index: "1"),
                                                        ),
                                                        Expanded(
                                                          child: ReuseableStepnotselected(
                                                              text:
                                                                  "chairs".tr
                                                                    ,
                                                              index: "1"),
                                                        ),
                                                       
                                                        Expanded(
                                                          child: ReuseableStepnotselected(
                                                              text: "party".tr,
                                                              index: "2"),
                                                        ),
                                                        Expanded(
                                                          child: ReuseableStepnotselected(
                                                              text: "seatedarea"
                                                                  .tr,
                                                              index: "4"),
                                                        ),
                                                        Spacer(),
                                                        ReuseableGetlineButton(
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
