import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ReuseablenextButton extends StatelessWidget {
  VoidCallback sumbit;
  ReuseablenextButton({required this.sumbit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: sumbit,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 1.0),
            colors: [const Color(0xff2fe58a), const Color(0xff187345)],
            stops: [0.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0x2b000000),
              offset: Offset(0, 15),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "next".tr,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
