import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/reuseable_sidebar.dart';
import '../utils/reuseble_home_items.dart';

class homebasic1 extends StatefulWidget {
  String tittle;
  String personcont;
  String time;
  bool full;

  homebasic1(
      {required this.tittle,
      required this.personcont,
      required this.time,
      required this.full});

  @override
  State<homebasic1> createState() => _homebasic1State();
}

class _homebasic1State extends State<homebasic1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: new RadialGradient(
              colors: [
                Color(0xFF7725CC),
                Color(0xFF31206D),
              ],
            )),
            child: Center(
                child: Row(
              children: [
                Expanded(flex: 3, child: Reuseablesidebar()),
                Expanded(
                    flex: 7,
                    child: widget.full
                        ? Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                  child: HomeItems(
                                title: widget.tittle,
                                personcount: widget.personcont,
                                expectedtime: widget.time,
                                full: widget.full,
                              )),
                              SizedBox(
                                width: 50,
                              ),
                            ],
                          )
                        : Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sorry !",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 56),
                                ),
                                Text(
                                  " Restaurant is FULL now",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 44),
                                ),
                              ],
                            ),
                          ))
              ],
            ))),
      ),
    );
    ;
  }
}
