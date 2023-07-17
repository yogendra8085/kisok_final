import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../controller/foodmenu_controller.dart';
import '../controller/get_setting_controller.dart';
import '../model/app_setting_model.dart';
import '../model/foodmenu_items_models.dart';
import '../utils/const/text_style.dart';
import '../utils/reuseable_sidebar.dart';
import 'foodmenue_details.dart';

class FoodMenuItmes extends StatefulWidget {
  const FoodMenuItmes({super.key});

  @override
  State<FoodMenuItmes> createState() => _FoodMenuItmesState();
}

class _FoodMenuItmesState extends State<FoodMenuItmes> {
  FoodMenuItemsModel foodMenuItemsModel = FoodMenuItemsModel();
  bool isloading = true;
  // AppSettingModel appSettingModel = AppSettingModel();
  final controller = Get.put(GetSettingController());
  VideoPlayerController? videoPlayerController;
  getdata() async {
    isloading = true;
  
    foodMenuItemsModel = await FoodMenuControoler().getdata();
   

    print("url"+controller.videourl.toString());
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
                                child: isloading == false
                                    ? Column(
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
                                                    "back".tr,
                                                    style: TextStyleConst
                                                        .b24stylew,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GridView.builder(
                                              itemCount: foodMenuItemsModel
                                                  .data?.length,
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      crossAxisSpacing: 10.0,
                                                      mainAxisSpacing: 10.0),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                          () => FoodMenuDetails(
                                                                description: Get
                                                                            .locale
                                                                            .toString() ==
                                                                        "en_US"
                                                                    ? "${foodMenuItemsModel.data?[index].detailsEn}"
                                                                    : "${foodMenuItemsModel.data?[index].detailsAr}",
                                                                imageurl:
                                                                    "https://cdn.requeue.net/media/media/"+"${foodMenuItemsModel.data?[index].image}",
                                                                price:
                                                                    "${foodMenuItemsModel.data?[index].price}",
                                                                title:
                                                                    "${foodMenuItemsModel.data?[index].enName}",
                                                              ));
                                                    },
                                                    child: BlurryContainer(
                                                      blur: 10,
                                                      color: newcontroller.colormincontainer ==
                                                      null
                                                  ? Color(0xff352073)
                                                  : newcontroller
                                                      .colormincontainer.value
                                                      .withOpacity(.5),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Expanded(
                                                            flex: 6,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          13),
                                                              child:
                                                                  // Image.network(
                                                                  //   "${foodMenuItemsModel.data?[index].image}",
                                                                  //   fit: BoxFit.cover,
                                                                  // ),
                                                                  CachedNetworkImage(
                                                                    fit: BoxFit.cover,
                                                                imageUrl:
                                                                   "https://cdn.requeue.net/media/media/"+"${foodMenuItemsModel.data?[index].image}",
                                                                placeholder:
                                                                    (context,
                                                                            url) =>
                                                                        Image
                                                                            .asset(
                                                                  "assets/images/placeholeder.png",
                                                                  scale: 4,
                                                                ),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Icon(Icons
                                                                        .error),
                                                              ),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Expanded(
                                                            child: Text(
                                                              Get.locale.toString() ==
                                                                      "en_US"
                                                                  ? "${foodMenuItemsModel.data?[index].enName}"
                                                                  : "${foodMenuItemsModel.data?[index].enName}",
                                                              style:
                                                                  TextStyleConst
                                                                      .h16bstylew,
                                                               maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                            ),
                                                          )

                                                          //  )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    : Center(
                                        child: CircularProgressIndicator(),
                                      ),
                              ),
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
