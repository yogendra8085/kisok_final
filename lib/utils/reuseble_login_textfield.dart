import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreentextfield extends StatelessWidget {
  String hinttext;
  TextEditingController controller;
  LoginScreentextfield({required this.hinttext, required this.controller});
  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
        borderRadius: BorderRadius.circular(5),
        padding: EdgeInsets.zero,
        blur: 14,
        color: Colors.white.withOpacity(.2),
        child: Center(
          child: TextField(
              controller: controller,
              style: TextStyle(color: Colors.white, fontSize: 15),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  isDense: true,
                  hintText: '${hinttext}',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none)),
        ));
  }
}
