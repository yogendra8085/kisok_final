import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/reuseable_sidebar.dart';
import '../utils/reuseble_home_items.dart';

class RestaurantClose extends StatefulWidget {
  const RestaurantClose({super.key});

  @override
  State<RestaurantClose> createState() => _RestaurantCloseState();
}

class _RestaurantCloseState extends State<RestaurantClose> {
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
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sorry !",
                            style: TextStyle(color: Colors.white, fontSize: 56),
                          ),
                          Text(
                            " Restaurant is FULL now",
                            style: TextStyle(color: Colors.white, fontSize: 44),
                          ),
                        ],
                      ),
                    ))
              ],
            ))),
      ),
    );
  }
}
