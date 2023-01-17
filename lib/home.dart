import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoee/controller.dart/homeController.dart';
import 'package:tictactoee/size_config.dart';
import 'package:tictactoee/ticTackContainer.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 24, 74),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 4 * SizeConfig.widthMultiplier,
                  vertical: 3 * SizeConfig.heightMultiplier),
              child: Row(
                children: [
                  Spacer(),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                            color: Color.fromARGB(255, 237, 100, 255),
                            width: 0.8 * SizeConfig.widthMultiplier)),
                    color: Colors.deepPurple[1000],
                    onPressed: () {},
                    height: 6.2 * SizeConfig.heightMultiplier,
                    minWidth: 13 * SizeConfig.widthMultiplier,
                    child: Icon(
                      Icons.settings,
                      color: Color.fromARGB(255, 239, 162, 156),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3 * SizeConfig.heightMultiplier,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 10.5 * SizeConfig.heightMultiplier,
                  width: 40 * SizeConfig.widthMultiplier,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[1000],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: Color.fromARGB(255, 56, 215, 255),
                          width: 0.6 * SizeConfig.widthMultiplier)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1 * SizeConfig.heightMultiplier),
                        child: Text(
                          'X',
                          style: TextStyle(
                              fontSize: 4 * SizeConfig.heightMultiplier,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 56, 215, 255)),
                        ),
                      ),
                      Obx(
                        () => Text(
                          'PLAYER SCORE : ${homeController.playerXScore}',
                          style: TextStyle(
                              color: Color.fromARGB(255, 56, 215, 255),
                              fontWeight: FontWeight.w700,
                              fontSize: 2 * SizeConfig.heightMultiplier),
                        ),
                      ),
                    ],
                  ),
                ),

                //
                Container(
                  height: 10.5 * SizeConfig.heightMultiplier,
                  width: 40 * SizeConfig.widthMultiplier,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[1000],
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      border: Border.all(
                          color: Color.fromARGB(255, 251, 104, 153),
                          width: 0.6 * SizeConfig.widthMultiplier)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1 * SizeConfig.heightMultiplier),
                        child: Text(
                          'O',
                          style: TextStyle(
                              fontSize: 4 * SizeConfig.heightMultiplier,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 251, 104, 153)),
                        ),
                      ),
                      Obx(
                        () => (Text(
                          'PLAYER SCORE : ${homeController.playerOScore}',
                          style: TextStyle(
                              color: Color.fromARGB(255, 251, 104, 153),
                              fontWeight: FontWeight.w700,
                              fontSize: 2 * SizeConfig.heightMultiplier),
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10 * SizeConfig.heightMultiplier,
            ),
            TicTacContainer()
          ],
        ),
      ),
    );
  }
}
