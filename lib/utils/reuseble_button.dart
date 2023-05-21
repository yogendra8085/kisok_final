import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ReuseableButton extends StatelessWidget {
  VoidCallback sumbit;
  ReuseableButton({required this.sumbit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: sumbit,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Colors.white,
            )),
        child: Center(
          child: Text(
            "urdu".tr,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
