import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ReuseableButton extends StatelessWidget {
  VoidCallback sumbit;
   VoidCallback doublesumbit;

  ReuseableButton({required this.sumbit,required this.doublesumbit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: doublesumbit,
      onTap: sumbit,
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 60),
        padding: EdgeInsets.symmetric(horizontal: 10, ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            border: Border.all(
              color: Colors.white,
            )),
        child: Center(
          child: Text(
            "urdu".tr,
            style: TextStyle(color: Colors.white, fontSize: 25,  ),
          ),
        ),
      ),
    );
  }
}
