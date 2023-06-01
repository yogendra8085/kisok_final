import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../utils/reuseable_check_button.dart';
import '../utils/reuseable_login_button.dart';
import '../utils/reuseble_login_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController passward = TextEditingController();
  TextEditingController branchid = TextEditingController();

  sumbit() async {
    if (name.text.isEmpty || passward.text.isEmpty || branchid.text.isEmpty) {
      Get.showSnackbar(
        GetSnackBar(
          title: "Failed",
          message: "Please Fill All Field",
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      await LoginController()
          .loginuser(name.text.trim(), passward.text.trim(), branchid.text.trim(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  gradient: new RadialGradient(
                colors: [
                  Color(0xFF7725CC),
                  Color(0xFF31206D),
                ],
              )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 250),
                child: Column(children: [
                  Spacer(),
                  Image.asset(
                    "assets/images/welcomekiosk.png",
                    scale: 4,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Image.asset(
                        "assets/images/adminlogo.png",
                        scale: 3,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 8,
                          child: LoginScreentextfield(
                            hinttext: "branchid".tr,
                            controller: branchid,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Image.asset(
                        "assets/images/user.png",
                        scale: 3,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 8,
                          child: LoginScreentextfield(
                            hinttext: "user".tr,
                            controller: name,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Image.asset(
                        "assets/images/lock.png",
                        scale: 3,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 8,
                          child: LoginScreentextfield(
                            hinttext: "password".tr,
                            controller: passward,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    
                      Loginbutton(
                        text: "login".tr,
                        sumbit: sumbit,
                      ),
                        
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Image.asset(
                      "assets/images/requeue_icon.png",
                      scale: 5,
                    ),
                  )
                ]),
              )),
        ],
      ),
    ));
  }
}
