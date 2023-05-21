import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Loginbutton extends StatelessWidget {
  String text;
  VoidCallback sumbit;
  Loginbutton({required this.text, required this.sumbit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: sumbit,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 1.0),
            colors: [const Color(0xff4BE0C2), const Color(0xff267061)],
            stops: [0.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(5.0),
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
            "${text}",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
    ;
  }
}
