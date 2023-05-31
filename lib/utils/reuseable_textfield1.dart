import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'const/text_style.dart';

class ReuseableTextfield1 extends StatelessWidget {
  String hinttext;
  bool read;
  TextEditingController controller;
  ReuseableTextfield1(
      {required this.hinttext, required this.controller, this.read = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.name,
      readOnly: read,
      
      controller: controller,
      style: TextStyleConst.h20bstylew,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        
          hintText: '${hinttext}',
          hintStyle: TextStyleConst.h20bstylew,
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
