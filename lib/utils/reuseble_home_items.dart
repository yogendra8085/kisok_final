import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screen/home_basic1.dart';
import 'const/text_style.dart';

class HomeItems extends StatelessWidget {
  String title;
  String personcount;
  String expectedtime;
  bool full;
  HomeItems(
      {required this.title,
      required this.personcount,
      required this.expectedtime,
      required this.full});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: InkWell(
        onTap: () {
          // Get.to(() => homebasic1(
          //       personcont: personcount,
          //       time: expectedtime,
          //       tittle: title,
          //       full: full,
          //     ));
        },
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: BlurryContainer(
                child: Center(
                  child: Text(
                    title,
                    style: TextStyleConst.h30stylew,
                  ),
                ),
                blur: 10,
                color: Colors.transparent.withOpacity(.4),
                padding: EdgeInsets.symmetric(horizontal: 20),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        full
                            ? Text(
                                "full".tr,
                                style: TextStyle(
                                    fontFamily: "HelveticaNeue",
                                    color: Color(0xff4A4848),
                                    fontSize: 80),
                              )
                            : Text(
                                personcount,
                                style: TextStyle(
                                  fontSize: 140,
                                  color: Color(0xff4A4848),
                                ),
                              ),
                        Text(
                          "waiting".tr,
                          style: TextStyle(
                            fontFamily: "Bahij TheSansArabic Bold",
                            fontSize: 20,
                            color: Color(0xff4A4848),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Image.asset("assets/images/dot.png"),
                        ),
                        // Text(
                        //   "45 min ",
                        //   style: TextStyle(
                        //     fontSize: 20,
                        //     color: Color(0xff4A4848),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${expectedtime} min\n"+"estimatetime".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Bahij TheSansArabic Bold",
                            fontSize: 20,
                            color: Color(0xff4A4848),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
