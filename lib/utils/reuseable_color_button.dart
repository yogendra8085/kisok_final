import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReuseablecolorButton extends StatelessWidget {
  Color singal;
  Color linearfirst;
  Color linearsecond;
  final void Function(Color, Color) lenearsumbit;
  final void Function(Color) singalsumbit;
  ReuseablecolorButton(
      {required this.singal,
      required this.linearfirst,
      required this.linearsecond,
      required this.lenearsumbit,
      required this.singalsumbit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {
              singalsumbit(singal);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: singal, borderRadius: BorderRadius.circular(7)),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 5,
          child: InkWell(
            onTap: () {
              lenearsumbit(linearfirst, linearsecond);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [linearfirst, linearsecond]),
                  borderRadius: BorderRadius.circular(7)),
            ),
          ),
        )
      ],
    );
  }
}
