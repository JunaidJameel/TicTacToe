import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tictactoee/home.dart';
import 'package:tictactoee/size_config.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void finish() {
    Get.to(Home());
  }

  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () => Get.to(Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 15 * SizeConfig.heightMultiplier,
          ),
          Text(
            'Tik Tac Toe',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 4 * SizeConfig.heightMultiplier,
            ),
          ),
          SizedBox(
            height: 18 * SizeConfig.heightMultiplier,
          ),
          Center(
            child: Container(
              height: 25 * SizeConfig.heightMultiplier,
              width: 50 * SizeConfig.widthMultiplier,
              child: Image.asset(
                'images/splash.png',
              ),
            ),
          ),
          Spacer(),
          Text(
            '@JUNAID',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 1.8 * SizeConfig.heightMultiplier,
                color: Color.fromARGB(255, 110, 25, 255)),
          )
        ],
      ),
    );
  }
}
