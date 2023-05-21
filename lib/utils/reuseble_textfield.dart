import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'const/text_style.dart';

class ReuseableTextfield extends StatelessWidget {
  String hinttext;
  bool read;
  TextEditingController controller;
  ReuseableTextfield(
      {required this.hinttext, required this.controller, this.read = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone,
      readOnly: read,
      controller: controller,
      style: TextStyleConst.l64stylew,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: '${hinttext}',
          hintStyle: TextStyleConst.l64stylew,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: const Color(0x40ffffff),
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: const Color(0x40ffffff)),
          )),
    );
  }
}
