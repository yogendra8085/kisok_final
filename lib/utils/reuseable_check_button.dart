import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ReusealeCheckButton extends StatelessWidget {
  VoidCallback sumbit;
  ReusealeCheckButton({required this.sumbit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: sumbit,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 1.0),
            colors: [const Color(0xff4BE0C2), const Color(0xff267061)],
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
        child: Center(
          child: Text(
            "check".tr,
            style: TextStyle(color: Colors.white, fontSize: 20,height: .9),
            
          ),
        ),
      ),
    );
    ;
  }
}
